confluence.archive.2

<entry [Tue 2013:01:01 00:36:59 EST] JBROWSE SCREENSHOTS>
    
jbrowse-human-chr1-tracks-medium-wide-view.png
jbrowse-fullscreen-medium-closeup.png
jbrowse-searching-CCDS190.1.png
jbrowse-CCDS190.1-displayed.png
jbrowse-CCDS190.1-saving-location.png
jbrowse-ikmc-gene-hovered.png


1. Medium wide view of human chromosome 1 in JBrowse Genome Viewer 	
2. Medium closeup of human chromosome 1 in JBrowse Genome Viewer 
3. Searching for CCDS gene CCDS190.1 in human genome 	
4. Displaying results of successful search for CCDS gene CCDS190.1 in human genome 	
5. Saving location after successful search for gene CCDS190.1 	
6. Detailed view of IKMC feature track in human chromosome 1 	



</entry>
<entry [Mon 2012:12:31 18:23:54 EST] BACKED UP CONFLUENCE 4.3.5 TO ZIPFILE>

1. CREATED ZIPFILE

Confluence Admin --> Administration : Backup and Restore --> Backup Confluence Data

    Backup Successful
    
    The backup was successfully created at
    
    /var/atlassian/application-data/confluence/temp/xmlexport-20121231-232235-1.zip
    
    This file will be deleted in 24 hours.
    
    An archive copy of the backup has been created at null/xmlexport-20121231-232235-1.zip.


2. COPIED ZIPFILE ON CONFLUENCE 4.3.5 INSTANCE

mkdir /root/confluence-backup
cp /var/atlassian/application-data/confluence/temp/xmlexport-20121231-232235-1.zip /root/confluence-backup/xmlexport-20121231-232235-1.zip


3. COPIED ZIPFILE TO TOSHIBA

ON TOSHIBA

cd /home/syoung/notes/backup/confluence
scp roo@$HEADIP:/root/confluence-backup/xmlexport-20121231-232235-1.zip .



</entry>
<entry [Mon 2012:12:31 07:34:55 EST] REFINED WIKI - NEWS MACRO>

http://demo.refinedwiki.com/display/rwot/rw-news	

The rw-news macro displays news which is marked as visible on dashboard.

{rw-news:profilePic=true|max=3|title=Wiki news}

    
</entry>
<entry [Mon 2012:12:31 05:17:24 EST] REFINED WIKI LAYOUT - SPACETREE>

Confluence Admin --> RefinedWiki Original Theme --> Edit Global Spaces Layout

LEFT COLUMN
{spacetree:sort=natural|spaceCategories=Home,HowTo,Developers|expandChildren=true|showRoot=false}{space-news}
    
</entry>
<entry [Mon 2012:12:31 04:44:38 EST] stuartpyoung@gmail.com ATLASSIAN ACCOUNT>

user: stuartpyoung@gmail.com
pass: ************
    
</entry>
<entry [Mon 2012:12:31 04:33:42 EST] REFINED WIKI - ALLOW SKYPE TO SHOW STATUS>

 Allow Skype to show your status on the web

    Added by Emil Sjödin, last edited by Emil Sjödin on Nov 22, 2012

    Start your Skype client
    Select Tools -> Options on Windows or select Preferences on Mac. 
    Select Privacy Settings. 
    Click the "Show Advanced Options" button. 
    Finally tick on the "Allow my status to be shown on the web" check button. 
    Click "Save" in the Options dialog to exit.


    
</entry>
<entry [Mon 2012:12:31 04:11:29 EST] REFINED WIKI CSS EXAMPLES>


http://demo.refinedwiki.com/display/rwot/Style+the+theme+with+custom+CSS
  
NB: You find more information about changing the dashboard name here:

https://confluence.atlassian.com/display/DOC/Modify+Confluence+Interface+Text


Global level

Go to: Confluence Admin > Look and Feel > Stylesheet > Edit
This will affect all pages in the entire wiki.

Space level

Go to: Browse > Space Admin > Look and Feel > Stylesheet > Edit
This will affect all pages in the active space.


Examples

Change the text font-size and color of a page
.wiki-content, .wiki-content p, .wiki-content table,
.wiki-content tr, .wiki-content td, .wiki-content th,
.wiki-content ol, .wiki-content ul, .wiki-content li {
         font-size:13px;
         color:#999999;
}

Change font-size and color of headings
.wiki-content h1 {
font-size:23px;
color:#333333;
}
.wiki-content h2 {
font-size:19px;
color:#333333;
}
.wiki-content h3 {
font-size:15px;
color:#333333;
}
.wiki-content h4 {
font-size:15px;
font-weight:normal;
color:#333333;
}
.wiki-content h5 {
font-size:14px;
font-weight:normal;
color:#333333;
}
.wiki-content h6 {
font-size:13px;
font-weight:normal;
color:#333333;
}


Remove the top menu with css
#top_menu {
display:none;
}

Remove the breadcrumbs:
#breadcrumb_wrapper {
display:none;
}

Remove the power by fotter
a#rw_footer {
display:none;
}

Remove the title and icon from the news macro:
.news_wrapper .tabletitle {
  display:none;
}
 
Change the size/width of the left and right "outer columns"
(ie. everything left and right beyond the "greenish" frame around this page)
#bg_wrapper #main_wrapper {
  width:98%;
}

Override the width setting on the side borders no longer works with 3.x?
#rw_wrapper #rw_main {
width:98%;
}

Eliminate the "attachment line" in the Page Meta Data area
.page-metadata-wrapper {border:0px;}
Remove the complete line :
.page-metadata-modification-info, .content-metadata-attachments {display:none;}

Disable the "show-comments" in the heading of a page
.page-metadata-wrapper .show-hide-comment-link {display:none;}
    
Change the color of the pagetitle:
#com-atlassian-confluence #menu_bar h1 { color:#ff8400; }


    Hi,
    I am trying to add a banner and the logo on top where the logo is present; I am trying to upload the combined banner+logo and uploaded. However, the banner is squished and appears distorted. I added the following code in CSS stylesheet:

    img.global {  
       height:300px;  
       width:200px;  
    }  
    h1.pagetitle img {  
         max-height:300px;  /* Should be the same than the previous height */  
    }

    It still doesn't change–what should I change here img.global to img.space? is pagetitle.img a variable that needs some value? Appreciate any help here.
        Permalink

    User icon: craig.hylwa@cerveceradepr.com

    Oct 19, 2012
    Craig Hylwa

    .wiki-content h3   

    {   

    text-decoration:underline;   

    }  


</entry>
<entry [Mon 2012:12:31 03:42:34 EST] CUSTOM STYLESHEET CSS>


/* LEFT NAVIGATION BAR FLUSH WITH SIDE AND NO GAP BETWEEN LEFT BAR AND MAIN COLUMN */
#rw_main_column.rw_has_left_column,
.rw_has_left_column {
  margin-left: 0px !important;
  padding-left: 0px !important;
}
#rw_main {
  width: 98% !important;
}
#rw_left_column {
  width: 18% !important;
}

/* BLOG HEADING */
a.blogHeading {
  font-size: 10pt;
  line-height: normal;
  font-weight: bold;
  text-decoration: none;
}

/* HIDE BLOG AUTHOR  --- note: no space between classes */
.rw_small_text.rw_author {
    display: none !important;
}
/* REMOVE WHITESPACE BEFORE BLOG BODY */
.rw_box_section {
    padding: 0px !important;
}

/* HIDE METADATA AT TOP OF PAGE, INCLUDING PAGE NAME */
.page-metadata-wrapper,
.page-metadata,
.page-metadata-modification-info,
#fullscreen-container .customSection,
#fullscreen-container .page_title {
    visibility: hidden !important;
    display: none !important;
}

/* HIDE SPACETREE CATEGORY NAMES IN MENU */
div.plugin_spacetree h4 {    
  display: none !important;    
  visibility: invisible;    
}  
  
/* HIDE DASHBOARD TAB */  
#rw_category_menu li.rw_first {  
  display:none;  
}  
           


</entry>
<entry [Mon 2012:12:31 03:14:40 EST] PLUGIN LICENSES>

System Information
Confluence Version	4.3.5
Build Number	3396
Server Base Url	http://ec2-54-243-20-133.compute-1.amazonaws.com:8090
Confluence Home	/var/atlassian/application-data/confluence

Server ID	BJTN-55VF-FZJ2-MLGK

Support Entitlement Number	SEN-2256165
Daily XML Backup	 Enabled

REFINED WIKI
Confluence Admin --> RefinedWiki Original Theme --> Original Theme License


**** OLD LICENSE FOR v3.0 ON LINODE
368036b67b27d6f9e27ceefca67bbc5830f9cf5a9a7333d10e825e37440b6ea535bb0c2304186e1c2b49a56beb3fa3f43987328e26e1b872a98297636281ba021011081c


    
</entry>
<entry [Sun 2012:12:30 05:20:58 EST] LINODE www.aguadev.org CONFLUENCE WON'T START>

Cause
java.lang.RuntimeException: Error rendering template for decorator root
    at com.atlassian.confluence.setup.velocity.ApplyDecoratorDirective.render(ApplyDecoratorDirective.java:210)

caused by: java.lang.RuntimeException: Error rendering template for decorator page
    at com.atlassian.confluence.setup.velocity.ApplyDecoratorDirective.render(ApplyDecoratorDirective.java:210)

caused by: org.apache.velocity.exception.ResourceNotFoundException: Unable to find resource '/decorators/includes/page-content-includes.vm'
    at com.atlassian.confluence.util.velocity.ConfigurableResourceManager.loadResource(ConfigurableResourceManager.java:400)
    


cd /usr/share/confluence
.util.velocity.ConfigurableResourceManager.loadResource(C


DEALING

    SEVERE: Exception sending context destroyed event to listener instance of class com.atlassian.config.\
lifecycle.LifecycleServletContextListener
org.springframework.transaction.CannotCreateTransactionException: Could not open Hibernate Session fo\
r transaction; nested exception is net.sf.hibernate.exception.GenericJDBCException: Cannot open conne\
ction
Caused by: net.sf.hibernate.exception.GenericJDBCException: Cannot open connection
        at net.sf.hibernate.exception.ErrorCodeConverter.handledNonSpecificException(ErrorCodeConvert\
er.java:90)




SEVERE: Exception sending context destroyed event to listener instance of class com.atlassian.config.\
lifecycle.LifecycleServletContextListener
org.springframework.transaction.CannotCreateTransactionException: Could not open Hibernate Session fo\
r transaction; nested exception is net.sf.hibernate.exception.GenericJDBCException: Cannot open conne\
ction
Caused by: net.sf.hibernate.exception.GenericJDBCException: Cannot open connection
        at net.sf.hibernate.exception.ErrorCodeConverter.handledNonSpecificException(ErrorCodeConvert\
er.java:90)


</entry>
<entry [Sun 2012:12:30 01:24:44 EST] SET UP GMAIL SMTP SERVER IN CONFLUENCE>

1. OPENED PORTS 25 (SMTP) AND 465 (SMTPS) IN AWS CONSOLE


2. EDITED /opt/atlassian/confluence/conf/server.xml

GET TOMCAT VERSION
cd /opt/atlassian/confluence
cat logs/catalina.out
    INFO: Starting Servlet Engine: Apache Tomcat/6.0.32
    ...

FOR Tomcat 5.5 or Tomcat 6, INSERT conf/server.sml INSIDE THE <*Context*> NODE:

<!--
    <Context path="" docBase="../confluence" debug="0" reloadable="false" useHttpOnly="true">
        <Manager pathname="" />
    </Context>
-->

THIS TEXT: (substitute username and password):
 
<!-- 
    <Resource name="mail/Session"
        auth="Container"
        type="javax.mail.Session"
        mail.smtp.host="smtp.gmail.com"
        mail.smtp.port="465"
        mail.smtp.auth="true"
        mail.smtp.user="aguadev@gmail.com"
        password="rst2agua"
        mail.smtp.starttls.enable="true"
        mail.smtp.socketFactory.class="javax.net.ssl.SSLSocketFactory"
      />

Note: You may optionally add mail.debug="true" into the <*Resource*> to see logs generated by JavaMail.

-->



3. MOVED FILES:

activation-1.0.2.jar
mail-1.4.1.jar

FROM:

confluence/WEB-INF/lib

TO:

lib


COMMAND

cd /opt/atlassian/confluence
mv confluence/WEB-INF/lib/activation-1.0.2.jar lib
mv confluence/WEB-INF/lib/mail-1.4.1.jar lib


4. SET JNDI MAIL CONFIGURATION

Confluence Admin --> Mail Servers --> Add New SMTP Server

java:comp/env/mail/Session



5. RESTARTED CONFLUENCE:

service confluence restart


6. TESTED SEND EMAIL

    OK


</entry>
<entry [Sun 2012:12:30 01:02:16 EST] ALLOW USERS TO SIGNUP>

SUMMARY

Dashboard --> Invite Users --> User Signup Options

OR

Confluence Admin --> Users --> User Signup Options.


    
Allowing user signup

If you enable user signup, a 'Sign Up' option will appear on the Confluence screens. The option will be on the login screen, and also in the header on public sites. People can choose the option to create their own usernames on Confluence.

You can restrict the signup to people whose email addresses are within a given domain or domains. This is useful if you want to ensure that only people within your organisation can add their own usernames.

    Choose one of the following options:
        Restricted by domain(s) – Note: You need to set up a mail server for Confluence before you can configure domain restricted signup. When you choose this option, a text box will appear. Enter one or more domains, separated by commas. People will only be able to sign up if their email address belongs to one of the domains specified here. Confluence will send the person an email message, asking them to click a link to confirm their email address.
        For example: mydomain.com, mydomain.net
        No restrictions – Anyone will be able to sign up to Confluence. Confluence will not send any email message requesting confirmation.
    Choose Notify administrators by email when an account is created if you want Confluence to send an email message to all administrators (people with Confluence Administrator or System Administrator permissions) every time someone signs up to Confluence.

    
</entry>
<entry [Sun 2012:12:30 00:33:26 EST] CONFIGURED THE SERVER BASE URL (AFTER RESTORE FROM ONDEMAND)>
    
AFTER RESTORE, SERVER BASE URL WAS SET INCORRECTLY TO http://localhost

RESET WITH Confluence Admin --> General Configuration --> Edit --> Enter new URL --> Save.



The Server Base URL is the URL via which users access Confluence. The base URL must be set to the same URL by which browsers will be viewing your Confluence site.

Confluence will automatically detect the base URL during setup, but you may need to set it manually if your site's URL changes or if you set up Confluence from a different URL to the one that will be used to access it publicly.

You need to have System Administrator permissions in order to perform this function.
	

(warning) The information on this page does not apply to Confluence OnDemand.

To configure the Server Base URL:

    Choose Browse > Confluence Admin.
    Choose General Configuration in the left-hand panel.
    Choose Edit.
    Enter the new URL in the Server Base URL text box.
    Choose Save.
    
    
</entry>
<entry [Sun 2012:12:30 00:27:54 EST] sysadmin USER APPEARS AFTER RESTORE FROM ONDEMAND INSTANCE>

USE THE username/password COMBINATION sysadmin/sysadmin TO LOGIN (AND THEN CHANGE sysadmin PASSWORD) TO RECOVER SYSTEM-ADMIN PRIVILEGES

    
</entry>
<entry [Sun 2012:12:30 00:18:45 EST] GOT OPEN-SOURCE LICENCE FOR REFINEDWIKI ORIGINAL THEME>

Non profit

RefinedWiki software (the Original Theme and/or the Mobile Interface) is free for use by official not for profit organisations and charities. RefinedWiki Community Licenses are designed for official not for profit organisations and charities which are not for profit, non-government, non-academic, non-commercial in nature, have no religious affiliation and that would not otherwise be able to afford RefinedWiki software. If your organisation does not really fit into this description, we suggest you purchase one of our commercial licenses — they are still highly affordable.

In order to receive a non profit license, please include the following information in an email to sales@refinedwiki.com:

    1. Send a picture (screenshot) of your non profit license from your Atlassian product(s).
    2. Tell us how many users you are in Confluence.
    3. To receive the license, please go to the RefinedWiki signup page and create an account.
    4. Confirm when that is done and which user name you have chosen.
    5. After that you will be able to generate the license.


    
</entry>
<entry [Sat 2012:12:29 12:05:52 EST] SPACETREE NAVIGATION MACRO>

Spacetree Macro

Use the Spacetree macro to create pagetrees of multiple spaces grouped by specific space categories. Or just leave the space categories blank to display a list of all spaces.

Use the Spacetree macro on wiki pages or in themes like the Documentation Theme to display navigation trees in the sidebar of the theme.

Tip: Categorize your spaces and display them in groups to provide a clear navigation for your Confluence users.
Parameters

Parameter	Default	Description

Space Categories

spaceCategories	None - list of all spaces will be displayed	Comma separated list of space categories to select the spaces you want to display in the tree. The space categories are case-insensitive and displayed in the tree as you specifiy them in the list. Use @favourite to display favourite spaces of current user. Leave blank to list all spaces.

Expand Children
expandChildren	false	Enable to automatically expand the child pages of the current page.

Sort Order
sort	position	The order the pages should be sorted by. Valid values are:
bitwise - Sort alphabetically, for example: title1, title10, title2.
creation - Sort by date of creation.
modified - Sort by order of date last modified.
natural - Sort in 'natural' alphabetical order, for example: title1, title2, title10.
position - Sort by the default Confluence sorting rules. If your pages have been ordered manually, this sort will respect the defined order. Otherwise the pages will be displayed in the 'natural' alphabetical order, such as: title1, title2, title10.

Reverse Order
reverse	false	Enable for reverse ordering.

Theme Configuration

Follow the steps below to replace the default page tree in the left sidebar of the Documentation Theme with the Spacetree macro:

Go to Browse > Space Admin > Look and Feel > Themes

Select the Documentation Theme and click on Configure theme
Uncheck the Page Tree option

Insert the Spacetree macro as wiki markup into the Navigation textarea:


{spacetree} - to list all spaces with default options
{spacetree:spaceCategories=Departments,Products} - to list all spaces of categories departments and products
    
</entry>
<entry [Sat 2012:12:29 06:18:37 EST] TRANSPARENT WITH BACKGROUND IMAGE>


http://demo.refinedwiki.com/display/rwot3x/Blog+design+tutorial
    
</entry>
<entry [Sat 2012:12:29 04:06:33 EST] EC2 MICRO INSTANCE (630 MB) DOESN'T HAVE ENOUGH MEMORY FOR CONFLUENCE>

PROBLEM

CONFLUENCE WON'T START, WITH ERROR LOG:

/opt/atlassian/confluence# cat logs/catalina.out 
    Error occurred during initialization of VM
    Could not reserve enough space for object heap

GET CURRENT MEMORY USE:

cat /proc/meminfo

SHOWS ONLY 34 KB FREE MEMORY !!!



SOLUTION

CHANGED TO m1.small INSTANCE


NOTES
-----

https://answers.atlassian.com/questions/115639/setup-wizard-for-confluence-4-3-3-in-ec2-fails

Hi Volker,

I have just been checking the specifications for an EC2 Micro Instance and I'm sorry to say that if the instance you are referring to has the following specs, taken from the EC2 site, then it is insufficient for running Confluence:

Micro Instance
613 MiB memory
Up to 2 EC2 Compute Units (for short periodic bursts)
EBS storage only
32-bit or 64-bit platform
I/O Performance: Low
EBS-Optimized Available: No
API name: t1.micro

Realistically, Confluence requires 768MB of memory and this would be in excess of the resources required by the Operating System and other applications required by Confluence, (such as the database, web server etc). Therefore, my suggestion based on the current EC2 options would be to migrate to a "Small Instance", as this is the next option up and it has the required specs to run Confluence satisfactorily.

Small Instance
1.7 GiB memory
1 EC2 Compute Unit (1 virtual core with 1 EC2 Compute Unit)
160 GB instance storage
32-bit or 64-bit platform
I/O Performance: Moderate
EBS-Optimized Available: No
API name: m1.small

I hope this suggestion helps, because I don't believe your current instance has enough resources to successfully run Confluence.

All the best,
John Inder [Atlassian] (6.0k karma) Dec 14 at 05:03 AM
    
</entry>
<entry [Sat 2012:12:29 03:24:01 EST] INSTALLED aguadev CONFLUENCE 4.3.5 ON EC2 SMALL INSTANCE>

1. DOWNLOADED CONFLUENCE 4.3.5

mkdir -p /apps/confluence
cd /apps/confluence
wget http://www.atlassian.com/software/confluence/downloads/binary/atlassian-confluence-4.3.5-x64.bin


2. INSTALL CONFLUENCE

chmod 755 atlassian-confluence-4.3.5-x64.bin 
./atlassian-confluence-4.3.5-x64.bin 

    Unpacking JRE ...
    Starting Installer ...
    
    This will install Confluence 4.3.5 on your computer.
    OK [o, Enter], Cancel [c]
    o
    Choose the appropriate installation or upgrade option.
    Please choose one of the following:
    Express Install (uses default settings) [1], Custom Install (recommended for advanced users) [2, Enter], Upgrade an existing Confluence installation [3]
    1
    See where Confluence will be installed and the settings that will be used.
    Installation Directory: /opt/atlassian/confluence 
    Home Directory: /var/atlassian/application-data/confluence 
    HTTP Port: 8090 
    RMI Port: 8000 
    Install as service: Yes 
    Install [i, Enter], Exit [e]
    i
    
    Extracting files ...

3. CHECK RUNNING ON PORT 8090

    OK


4. GET LICENSE

LOGIN TO atlassian.com

INPUT SERVER ID: B5KT-LTET-53EZ-9TM0

LICENSE:

AAABMw0ODAoPeNpVkF1rwjAUhu/zKwK7jtS4ChUCY20uZLWVpV5sDEYWj12gTUs+ZP77RTuZQnKT8
7wfOQ9CelyAwjTDyWKVZiua4lw0mCZzigpwyurR68GwfDCHLoBR8LHC9QgGiyFYBSi3IM9EIT2ws
4zEQzMUBV4qX8kemPBBWo/fhmBapKLTLE70EZi3Aa4k30jdMXdBx9MZfWr7+DRTQ4/4UXbhksMOs
nMwuZRagXHQnEa45NRbXn2KeveacxTdjAcjY2P+M2p7uhZckOSR0GRyqEL/BbY+5F1wHmw17MGxB
NW2lUa7KfCuveAVi5dQmi7nyxQJsEew64I9py8NKRvekHTB30nWbBL01y9Oy3Vxq7rL3jmwjpH5F
b+pG0yne+1hj7Zx2d/Swf+ap1/8Ao8glYMwLAIUIMLiy7711BkbXNrItZTvC3kl/e0CFD/gQ5tUI
ztCq15ZnqUYGJ8zmQ87X02fb



5. CONFIGURE DATABASE SETTINGS IN CONFLUENCE

ADD MYSQL confluence USER:

CREATE USER 'confluence'@'localhost' IDENTIFIED BY 'open4confl';
GRANT ALL PRIVILEGES ON confluence.* TO 'confluence'@'localhost';


ADD TO CONFLUENCE CONFIGURATION

Configure Database

Enter the settings for connecting to the database that Confluence will use to store data. You may need to consult your database documentation for the correct settings. Make sure that the JDBC drivers for your database are in the application server's classpath.

If you plan to use non-latin characters, you will also need to add &useUnicode=true&characterEncoding=utf8 on the end of the above URL.

These options are not required for any database other than MySQL.

Setup Database

Driver Class Name:  com.mysql.jdbc.Driver
Database URL:	    jdbc:mysql://localhost/confluence?sessionVariables=storage_engine%3DInnoDB
User Name:	        confluence
Password:	        open4confl

NB: APPENDED UTF8 INFO TO URL SO FINAL URL IS:

http://ec2-54-243-20-133.compute-1.amazonaws.com:8090/setup/setupstandarddb-start.action?database=mysql&useUnicode=true&characterEncoding=utf8



6. CREATE A MAIL SERVER

Login Confluence as admin
Click on "Mail Servers" --> 'Add a new SMTP mail server'



Set up a mail session for the Confluence distribution to use Gmail as follows:


<!--

1. Stop Confluence.

2. Move (don't copy)

activation-1.0.2.jar
mail-1.4.1.jar

from

<confluence-install>/confluence/WEB-INF/lib

to

<confluence-install>/lib.


Add the following to your server.xml file found in <confluence-install>/conf/ (add it just before the </Context> tag):

For Confluence 3.5.x
<Resource name="mail/GmailSMTPServer"
    auth="Container"
    type="javax.mail.Session"
    mail.smtp.host="smtp.gmail.com"
    mail.smtp.port="465"
    mail.smtp.auth="true"
    mail.smtp.user="yourEmailAddress@gmail.com"
    password="yourPassword"
    mail.smtp.starttls.enable="true"
    mail.transport.protocol="smtps"
    mail.smtp.socketFactory.class="javax.net.ssl.SSLSocketFactory"
/>

Restart Confluence.
Choose Browse > Confluence Admin.

Choose Mail Servers.
Choose either Edit an existing configuration, or Add a new SMTP mail server.
Edit the server settings as necessary, and set the JNDI Location as:

     java:comp/env/mail/GmailSMTPServer

Note that the JNDI Location is case sensitive and must match the resource name specified in server.xml.

Submit, and send a test email.


-->




From:   www.aguadev.org
JNDI:   java:comp/env/mail/Session

'Send test email' FAILED WITH LOG:

    An error has occurred with sending the test email:
    com.atlassian.mail.MailException: javax.naming.NameNotFoundException: Name mail is not bound in this Context at com.atlassian.mail.server.impl.SMTPMailServerImpl.send(SMTPMailServerImpl.java:187)
    
 


</entry>
<entry [Thu 2012:12:27 08:25:20 EST] ROYALTY FREE IMAGES>

http://www.123rf.com/freeimages.php
    
</entry>
<entry [Thu 2012:12:27 07:35:25 EST] LINODE CONFLUENCE DOWN: Error reading from remote server>

[Thu Dec 27 12:34:23 2012] [error] [client 96.47.224.42] proxy: Error reading from remote server returned by /confluence/display/PTA/2012/08/29/YkrskKXCFuw
[Thu Dec 27 12:34:38 2012] [error] [client 96.47.224.42] (70007)The timeout specified has expired: proxy: error reading status line from remote server localhost
[Thu Dec 27 12:34

startconf

    
</entry>
<entry [Tue 2012:12:18 00:56:58 EST] instant_atlassian.jar POSSIBLE QUICK EC2 CONFLUENCE INSTALL>

http://blogs.atlassian.com/2009/04/setting_up_jira_and_confluence/
http://blogs.atlassian.com/2009/04/instant_atlassian_part_2_creat/

https://confluence.atlassian.com/display/BAMBOO/Creating+a+custom+elastic+image


</entry>
<entry [Thu 2012:12:13 00:17:58 EST] IGNORE FIX RAW HTML ON FIRST LOAD aguadev HOME>



SUMMARY: IGNORE. APPEARS TO HAPPEN ON FIRST CONNECT AFTER RESTARTING CONFLUENCE


GET THIS BELOW TOOLBAR CONTAINING 'Browse', 'Login', 'Sign Up' LINKS:

#originaltheme_renderButton("system.content.button") #originaltheme_renderAddMenu() #originaltheme_renderActionMenu()


EXAMINING THE HTML I SEE THIS:

<!--

<ul class="toolbar_menu">
    #originaltheme_renderButton("system.content.button")
    #originaltheme_renderAddMenu()
    #originaltheme_renderActionMenu()
</ul>
        
-->

    
</entry>
<entry [Sun 2012:08:26 11:47:37 EST] EXPORT FROM ONDEMAND HOMEWORKWIKI>


Matthew Hunter [Atlassian] updated Usage Query JST-44623
Export from onDemand
	

Hi Stuart,

You can simply go follow the instructions at this page to export your Confluence data, which can be summarised as follows:

    Log in as an administrator.
    Navigate to the Backup Manager as follows:
        If your site has multiple OnDemand applications, go to your_username > Administration > Wiki > Administration > Backup Manager
        In a Confluence-only site, go to Browse > Confluence Admin > the Administration section > Backup Manager.
    If you want to include attachments, select the Back up attachments option.
    To start the backup, click Create Backup.

The import back into standalone Confluence process follows the steps at this page:

    https://confluence.atlassian.com/display/DOC/Restoring+a+Site

Let me know how you go, and if you have any other questions.

Cheers,
Matt
Change By: 	Matthew Hunter [Atlassian] (23/Aug/12 7:22 PM)
Status: 	Atlassian Investigating Waiting For Customer


    
</entry>
<entry [Thu 2012:08:23 20:29:12 EST] FIXED ERROR: BEING UPDATED BY ANOTHER CONFLUENCE INSTANCE>

SUMMARY: MANUALLY KILL MULTIPLE PROCESSES, RESTART CONFLUENCE


PROBLEM

BROWSE TO CONFLUENCE PAGE:

 You cannot access Confluence at present. Look at the table below to identify the reasons

This page will automatically update every 60 seconds.

Time 	Level 	Type 	Description 	Exception
2012-08-23 22:58:38 	fatal 	cluster 	Non Clustered Confluence: Database is being updated by another Confluence instance. Please see http://confluence.atlassian.com/x/mwiyCg for troubleshooting.

Your server id is: BFE9-Z3V6-PKYR-P33M.


DIAGNOSIS

TWO confluence PROCESSES RUNNING AT THE SAME TIME



SOLUTION

1. MANUALLY kill -9 CONFLUENCE PROCESSES

2. RESTART CONFLUENCE

    
</entry>
<entry [Thu 2012:07:26 02:47:15 EST] USED CARDS IN Home WITH ROUNDED CORNERS CSS>

NB: PEAR-SHAPED  ROUNDED CORNERS:

.pearElement  {
  border-top-left-radius: 7px;
  border-top-right-radius: 5px;
  border-bottom-right-radius: 6px;
  border-bottom-left-radius: 8px;
}


CSS

Space Admin --> Stylesheet


/* DECK TABS */

.deck .cards.tabbed {
    border: 1px solid #ACF !important;
    height: 30px !important;
}
//.deck .cards a:link,
.deck .cards a:visited, 
.deck .cards a:active, 
.deck .cards a:hover {
    height: 30px !important;
}

.deck .tabBar.top .tab a { 
    margin-bottom: 1px;
    border-top-left-radius: 10pt;
    border-top-right-radius: 10pt;
    font-weight: 800 !important;
    font-size: 16px;
    color: white;
}
.deck .cards.tabbed {
    border: 1px solid #BBF;
    font-weight: 800 !important;
    border-top-left-radius: 10px;
    border-top-right-radius: 10px;
    border-bottom-left-radius: 5px;
    border-bottom-right-radius: 15px;
    height: auto !important;
}
a:link, a:visited, a:active, a:hover, 
#default-labels-header a.add {
    font-weight: 800 !important;
    color: #036;  
}

#default-labels-header a.add {
    color: white;
    height: 30px !important;
}
.deck .tabBar .tab#current a {
    background: white;
    border: 1px solid #DDF;
    color: #036 !important;
}




FULL Home PAGE:

{section}
{column:width=70%}

{composition-setup}
 cloak.toggle.type = default
{composition-setup}

{deck:id=myDeck}
{card:label=What is Agua?}

Agua is a workflow and genomic visualization platform for running highly scalable high performance computing analyses in the Amazon Elastic Compute Cloud (EC2). Agua features pre-configured analysis pipelines for Next Generation Sequencing (NGS) data and enables users to easily and rapidly create custom analyses. For an overview of Agua, please see the [Introduction|Introduction].

!agua-in-the-cloud-v5-550x360-v3.png|align=center!
{card}

{card:label=Who is it for?}

Agua is about empowering two types of people: *Non-technical Users* who want to run complex, prepackaged analyses without having to set up a bioinformatics/IT department, and *Technical Users* who need to efficiently manage and maintain existing pipelines and save time constructing new pipelines.
{card}

{card:label=How do I get it?}
Please see the [Get It|getit:Get It] section of this website for details on how to start Agua in the EC2 cloud or download and install it on your own host.


{card}
{card:label=How do I learn more?}

For an overview of Agua, please see the [Introduction|Introduction]. 

For further information regarding Agua and its functionality, please see [Frequently Asked Questions |FAQ].

And for the latest discussions see the [Mailing List|Mailing List]. 

The [How To|howto:How To] section describes how to use Agua.

And the [Developers|dev:Developers] section describes how to modify and contribute to it.
{card}

{deck}

{column}

{column:width=30%}

{composition-setup}
cloak.toggle.exclusive = false
{composition-setup}

h2. {toggle-cloak:id=calendar} News Calendar

{cloak:id=calendar}
{blog-calendar}
{cloak}


{style}
a.blogHeading {
font-size: 10pt;
line-height: normal;
font-weight: bold;
text-decoration: none;
}
{style}

{blog-posts:content=excerpts|reverse=true}



{column}
{section}


</entry>
<entry [Thu 2012:07:26 02:17:25 EST] DELETED COMMENTS USING CONFLUENCE CLI>

http://ffeathers.wordpress.com/2011/10/20/confluence-cli-for-bulk-actions-like-deleting-or-publishing-pages/

Confluence CLI for bulk actions like deleting or publishing pages
OCT 20
Posted by ffeathers


Today I needed to remove a number of pages from our Confluence documentation site. To do it via the web interface would have taken a long time. Instead, I used Bob Swift’s Confluence CLI tool. It is simple to use and powerful in capability, and you can run it from your own computer. Ideal for bulk deletion of pages and other mass documentation admin tasks!

The pages that I wanted to remove were a set of transcripts from our developer IRC chat. We had an automated process that generated the transcripts and added them to Confluence regularly for a certain period. There was therefore quite a large number of them. Then we stopped generating the transcripts, and those that were on the wiki became out of date and irrelevant. I needed to remove the parent page that introduced the transcripts, and all the child pages that represented individual IRC sessions. Enter the CLI.

My environment
I’m using the following setup:

My desktop PC is running Windows 7, and I executed the CLI commands from a command window on this machine.
The Confluence server is running Confluence 3.5.
I used version 2.2.0 of the CLI.
Note that you need Confluence administrator permissions to use the CLI.

Using the Confluence CLI
1. Make sure that the remote API is enabled on your Confluence site. Go to Confluence admin > General Configuration and make sure the following option is enabled: Remote API (XML-RPC & SOAP).

2. At this point, I recommend that you change your password on Confluence, because soon you will enter the password to a text file on your computer, where it will be visible for anyone to see unless you encrypt the file.

3. Download the CLI distribution from the Atlassian Plugin Exchange: https://plugins.atlassian.com/plugin/details/284.

4. Unzip the distribution into a directory on your computer. This will give you a directory called confluence-cli-x.x.x, where “x.x.x” is the version of the CLI that you downloaded. For example, mine is called confluence-cli-2.2.0.

5. Open a text editor and edit the batch file called confluence.bat (on Windows) or confluence.sh (on a Mac) which you will find in the above directory. Now you will specify the address of your Confluence server, and the username and password that the CLI will use to access that server.

My computer is running Windows 7. This is the content of the confluence.bat file before I did anything to it:

@echo off

rem remember the directory path to this bat file

set dirPath=%~dp0

rem need to reverse windows names to posix names by changing \ to /

set dirPath=%dirPath:\=/%

rem remove blank at end of string

set dirPath=%dirPath:~0,-1%

rem – Customize for your installation, for instance you might want to add default parameters like the following:

rem java -jar “%dirPath%”/lib/confluence-cli-2.2.0.jar –server http://my-server –user automation –password automation %*

java -jar “%dirPath%”/lib/confluence-cli-2.2.0.jar %*

rem Exit with the correct error level.

EXIT /B %ERRORLEVEL%

I commented out this line:

rem java -jar “%dirPath%”/lib/confluence-cli-2.2.0.jar %*

And added this line:

java -jar “%dirPath%”/lib/confluence-cli-2.2.0.jar –server https://my.confluence.com –user myname –password secret %*

Hehe, my password isn’t actually “secret”. You will need to substitute the correct values for https://my.confluence.com and myname too.

This is the content after I have added the details of the server and user:

@echo off

rem remember the directory path to this bat file

set dirPath=%~dp0

rem need to reverse windows names to posix names by changing \ to /

set dirPath=%dirPath:\=/%

rem remove blank at end of string

set dirPath=%dirPath:~0,-1%

rem – Customize for your installation, for instance you might want to add default parameters like the following:

rem java -jar “%dirPath%”/lib/confluence-cli-2.2.0.jar –server http://my-server –user automation –password automation %*

rem java -jar “%dirPath%”/lib/confluence-cli-2.2.0.jar %*

java -jar “%dirPath%”/lib/confluence-cli-2.2.0.jar –server https://my.confluence.com –user myname –password secret %*

rem Exit with the correct error level.

EXIT /B %ERRORLEVEL%

6. Save the batch file.

7. Open a command window and go to the directory (cd) where you unzipped the CLI distribution. For example: C:\>cd confluence-cli-2.2.0

8. Execute the batch file (see examples below), passing the relevant parameters to perform the action you need done. The CLI documentation lists all the parameters available and gives examples of the actions you can perform.

As mentioned at the beginning of this post, I wanted to delete a specific page and all its child pages. The pages were on our production documentation site. But first, being a cautious soul, I tested the CLI on a staging server, and instructed it to delete just one page. The page name is “atlassiandev_log-2010-03-15″.

This is the command I ran. (Remember that my batch file is configured to address the correct server with a valid username and password.)

confluence –action removePage –space “DOCS” –title “atlassiandev_log-2010-03-15″

This was the result:

C:\Atlassian\confluence-cli-2.2.0>confluence –action removePage –space “DOCS” –title “atlassiandev_log-2010-03-15″

Removed page ‘atlassiandev_log-2010-03-15′ from space ‘DOCS’.

C:\Atlassian\confluence-cli-2.2.0>

To make ultra sure, I went to my Confluence site and had a look at the trash bin for the space. (Go to Space Admin > Trash.) Yep, just the one page, and it was the one I expected. (I had craftily purged the trash bin before running the CLI command, so that I knew exactly what should be in there.)

Next I was ready to delete the parent page and all its child pages. In fact, this command will remove all descendents of the parent page, including its children and their children, and so on. The parent page is “IRC Chat Transcripts”.

confluence –action removePage –space “DOCS” –title “IRC Chat Transcripts” –descendents

This was the result:

C:\Atlassian\confluence-cli-2.2.0>confluence –action removePage –space “DOCS” –title “IRC Chat Transcripts” –descendents

Removed page ‘IRC Chat Transcripts’ from space ‘DOCS’.

C:\Atlassian\confluence-cli-2.2.0>

Hmm. Interesting. The message mentioned only the title of the parent page. I hopped back to my online view of the space’s trash bin, and all the expected pages had been deleted. Excellent!

Now I was ready to try it on the production server. I adjusted the server URL and my password in the batch file, then ran the same command as above. Yaayyy! It worked.

9. When all is done, change your password on Confluence again.

10. Have a chocolate.

Other scenarios
My requirement was fairly simple, but typical of the mass-processing a document administrator may need to do. The CLI documentation includes some useful examples and a list of all the available actions and parameters.

A scenario that springs to mind is publishing and removing pages on release date. In the scenario that I described above, all I needed was one line to remove a page and its descendents. To perform a series of actions, you can set up a number of lines in the batch file and then run it to do all the processing at one time. This may be very useful on release date. For example, you may want to delete a number of individual pages and publish other pages by removing page restrictions (permissions). Add the commands to the batch file during the documentation development cycle, then run the file on release date.

Thank you Bob
Thank you to Bob Swift for the awesome Confluence CLI! And thanks to Scott for pointing it out to me.
    
</entry>
<entry [Thu 2012:07:26 02:17:14 EST] INSTALLED CONFLUENCE CLI>

    
</entry>
<entry [Thu 2012:07:26 02:12:38 EST] HID COMMENTS TO BLOCK OUT SPAM>

Space Admin --> StyleSheets

/* HIDE COMMENTS ON Home */   
#comments-section {  
    visibility: invisible;  
    display: none;  
}  
    
</entry>
<entry [Wed 2012:07:25 11:37:49 EST] GET RID OF SPAM USER PROFILE AND COMMENTS>

Deleting Spam
Profile Spam
By 'profile spam', we mean spammers who create accounts on Confluence and post links to their profile page.

If you have had many such spam profiles created, it is easier to delete them via SQL, as described below.

To delete a spam profile:

Shut down Confluence and back up your database. Note: This step is essential before you run any SQL commands on your Confluence dattabase.
Find the last real profile:

SELECT bodycontentid,body FROM bodycontent WHERE contentid IN 
  (SELECT contentid FROM content WHERE contenttype='USERINFO') 
  ORDER BY bodycontentid DESC; 
Look through the bodies of the profile pages until you find where the spammer starts. You may have to identify an number of ranges.
Find the killset:

CREATE TEMP TABLE killset AS SELECT bc.bodycontentid,c.contentid,c.username FROM 
  bodycontent bc JOIN content c ON bc.contentid=c.contentid WHERE 
  bodycontentid >= BOTTOM_OF_SPAM_RANGE AND bodycontentID <= TOP_OF_SPAM_RANGE 
  AND  c.contenttype='USERINFO';

DELETE FROM bodycontent WHERE bodycontentid IN (SELECT bodycontentid FROM killset);

DELETE FROM links WHERE contentid IN (SELECT contentid FROM killset);

DELETE FROM content WHERE prevver IN (SELECT contentid FROM killset);

DELETE FROM attachments WHERE pageid IN (SELECT contentid FROM killset);

DELETE FROM content WHERE contentid IN (SELECT contentid FROM killset);

DELETE FROM os_user_group WHERE user_id IN (SELECT id FROM killset k JOIN os_user o ON o.username=k.username);

DELETE FROM os_user WHERE username IN (SELECT username FROM killset);
Once the spam has been deleted, restart Confluence and rebuild the index. This will remove any references to the spam from the search index.
Notes
See CONF-1469. Your comments that issue are very much appreciated.
None
3 Comments Hide/Show Comments
 Jan 25, 2010
Thies Edeling
Tables and columns are case sensitive on Linux systems. All confluence tables are uppercase and fields lowercase.

CREATE TEMP TABLE killset AS SELECT bc.bodycontentid,c.contentid,c.username FROM
  bodycontent bc JOIN content c ON bc.contentid=c.contentid WHERE
  bodycontentid >= BOTTOM_OF_SPAM_RANGE AND bodycontendID <= TOP_OF_SPAM_RANGE
  AND  c.contenttype='USERINFO';
should be

CREATE TEMPORARY TABLE killset AS SELECT bc.bodycontentid,c.contentid,c.username FROM
  BODYCONTENT bc JOIN CONTENT c ON bc.contentid=c.contentid WHERE
  bodycontentid >= BOTTOM_OF_SPAM_RANGE AND bodycontentid <= TOP_OF_SPAM_RANGE
  AND  c.contenttype='USERINFO';
etc
Permalink

    
</entry>
<entry [Thu 2012:06:28 01:47:30 EST] FIXED ERROR: #originaltheme_renderButton...>


PROBLEM:

THIS APPEARS AT TOP OF www.aguadev.org HOME PAGE

    #originaltheme_renderButton("system.content.button") #originaltheme_renderAddMenu() #originaltheme_renderActionMenu(
    


    
    
</entry>
<entry [Thu 2012:04:19 04:13:44 EST] FIXED PAGETREE2 initialDepth ETC.>


*** SCRAPPED THIS AS pagetree2 FAILS TO RECOGNISE IT'S SUPPORTED PARAMETERS


ORIGINAL

{pagetree2:@home|initialDepth=3|allowdrag=true|sort=natural|excerpt=true|reverse=false|expandCollapseAll=true|searchBox=true}


{pagetree2:@home|initialDepth=3|allowdrag=true|sort=natural|excerpt=true|reverse=false|expandCollapseAll=true|searchBox=true}





    
</entry>
<entry [Wed 2012:04:18 15:42:59 EST] deck/card MARKUP AND CSS FOR AGUA HOME-alt>

TRIED USING TABS INSTEAD OF PARAGRAPHS FOR MIDDLE PANE


{composition-setup}
 cloak.toggle.type = default
{composition-setup}

{deck:id=myDeck}
{card:label=What is Agua?}
Agua is a workflow and genomic visualization platform for running highly scalable high performance computing analyses in the Amazon Elastic Compute Cloud (EC2). Agua features pre-configured analysis pipelines for Next Generation Sequencing (NGS) data and enables users to easily and rapidly create custom analyses.
{card}

{card:label=Who is it for?}
Agua is about empowering two types of people: *Non-technical Users* who want to run complex, prepackaged analyses without having to set up a bioinformatics/IT department, and *Technical Users* who need to efficiently manage and maintain existing pipelines and save time constructing new pipelines.
{card}


{card:label=How do I learn more?}
For an overview of Agua, please see the [Introduction|Introduction]. For further information regarding Agua and its functionality, please see [Frequently Asked Questions |FAQ] and for the latest discussions see the [Mailing List|Mailing List]. The [How To|howto:How To] section describes how to use Agua and the [Developers|dev:Developers] section describes how to modify and contribute to it.
{card}


{deck}




    
</entry>
<entry [Sun 2012:01:29 02:26:39 EST] SET UP REDIRECT ON www.aguadev.org>

1. MOVE index.html FILE

mv index.html index.html.safe


3. ADD REDIRECT TO CONFLUENCE

emacs -nw /etc/httpd/conf/httpd.conf

    Redirect permanent /index.html http://www.aguadev.org/confluence


3. RESTART APACHE

/etc/init.d/httpd restart    

    OK
    
</entry>
<entry [Wed 2012:01:25 10:22:41 EST] FIXED PROBLEM 'database is being updated'>

http://confluence.atlassian.com/display/CONFKB/'Database+is+being+updated+by+an+instance+which+is+not+part+of+the+current+cluster'+Error+Message

PROBLEM:

You cannot access Confluence at present. Look at the table below to identify the reasons

Time	Level	Type	Description	Exception
2012-01-17 11:46:06	fatal	cluster	Non Clustered Confluence: Database is being updated by another Confluence instance. Please see http://confluence.atlassian.com/x/mwiyCg for troubleshooting.

Your server id is: BFE9-Z3V6-PKYR-P33M.


DIAGNOSIS:

3 CONFLUENCE PROCESSES RUNNING AT ONCE


SOLUTION:

KILL ALL THREE PROCESSES AND RESTART CONFLUENCE

Using CATALINA_BASE:   /usr/share/confluence
Using CATALINA_HOME:   /usr/share/confluence
Using CATALINA_TMPDIR: /usr/share/confluence/temp
Using JRE_HOME:       /root/base/apps/java/jre1.6.0_17



IF PROBLEM RECURS, MAY NEED ONE OF THESE PERMANENT SOLUTIONS:

1. PATCH
https://jira.atlassian.com/browse/CONF-17136

2. UPGRADE TO 3.1

3. UPGRADE TO 4.0

    
</entry>
<entry [Mon 2012:01:16 22:12:59 EST] SORT OUT pagetree2 DEFAULT EXPANDED DEPTH>

OLD CONFIG:

{pagetree2:@home|initialDepth=5|selectionMode=row|sort=natural|branchStyle=plus-lines|iconStyle=computer|showRoot=true}


NEW CONFIG:

{pagetree2:@home|sort=natural|reverse=false|startDepth=3|expandCollapseAll=true|searchBox=true}

    
</entry>
<entry [Mon 2012:01:16 21:56:14 EST] FIX PYRAMID/ARROW IN TOP MENU POINTING TO SELECTED SPACE>

GO TO Space -> Advanced -> Team Labels -> ADD 'rw_category_howto'

ALSO SELECT CATEGORY:

Space Admin -> Change Category --> How To

RELOAD PAGE AND THE ARROW IS IN THE RIGHT POSITION!



</entry>
<entry [Mon 2012:01:16 19:46:22 EST] FIXED ERROR: 'SESSION ERROR'>
    
PROBLEM:

GET 'SESSION ERROR' JAVA POPUP WHEN TRYING TO ACCESS 'HowTo' SITE ON aguadev

NB: THE 'HowTo' SITE ALSO SEEMED INCAPABLE OF REMEMBERING LOGIN INFO BEFORE I MADE IT PUBLICLY VIEWABLE


SOLUTION:

Confluence Admin --> Edit Categories --> How To --> REMOVED DOUBLE '/' FROM URL

<!--

I've had the same problem. You should try the following:

1. Stop Confluence
2. Edit server.xml in your confluence conf directory and search for <Context path=....> 
3. At the very end of this line you shoud see useHttpOnly="true" ... Change this to useHttpOnly="false"
4. Restart Confluence

This should solve your problem!
PS: I don't think, this is a problem of Atlassian... Looks more like a problem of libraries beeing used by Adaptavist...

-->

**** RANDOM PAGETREE CONFIG: ****

{div:id=rw_pagetree|class=no_icons}{pagetree2:root=@none|expandCollapseAll=true|showRoot=false|selectionMode=row|iconStyle=website|sort=natural}{div}
    
</entry>
<entry [Sun 2012:01:15 19:47:16 EST] PAGETHREE USAGE INSTRUCTIONS - ARGUMENTS>

{pagetree2} macro
 This macro required Theme Builder 3 or above

Overview
Usage
{pagetree2:@space|selectionMode=node}
Parameters
Parameter	Required	Default	Notes	Builder Version
default		@space	Defines where the page tree should start from:
SPACEKEY:pagename - a specific page in a specific space
page title - a specific page (defined by it's title) in the current space
@self - the current page
@parent - the parent of the current page
@parentparent - the parent of the parent of the current page
@space - the currently viewed space showing all top-level pages and also news items (default)
@orphan - same as @space
@root - the root of the current tree
@home - the homepage of currently viewed space (does not include news items)
@dashboard - the Confluence dashboard showing all spaces the user has access to


3.0
space		current space	If you want to show a page tree for a different space, specify the space key of that space using this parameter.	3.0
page		 	An alternate way to specify the page (by it's title) to use as the root node of the tree.	3.0
target		 	The target window that links in the tree should be opened in (eg. _blank or _self).	3.0
showIcons		true	Should icons be shown in the tree?
true - show icons (default)
false - do not show icons
3.0
selectionMode		node	When a node is selected in the tree, what should be highlighted?
node - highlight the node caption (default)
row - highlight the entire row
3.0
autoCollapse		false	Only allow a single node to be expanded?
false - allow any number of nodes to be expanded (default)
true - when a node is opened, collapse all other nodes
3.0
indent		true	Should different levels of the tree be indented?
true - indent each level (default)
false - left align all levels
3.0
showRoot		true	Should the root node of the tree be shown?
true - show the root node
false - hide the root node
3.0
branchStyle		plus-lines	Defines how the structure of the tree is visualised:
plus-lines - +/- buttons, dotted lines (default)
plus-nolines - +/- buttons, no lines
ball-lines - yellow sphere buttons, dotted lines
ball-nolines - yellow sphere buttons, no lines
arrow - green arrow buttons, no lines
3.0


iconStyle		computer	Which icon set should be used?
computer - computer style icons (default)
website - website style icons
builder - Theme Builder style icons
bookshelf - bookshelf style icons


3.0
class		 	An optional CSS class to assign to the outer wrapper of the page tree.	3.0
openpage		true	When a link is clicked, should the corresponding page be opened?
true - open the link
false - highlight the link, but don't open it
3.0
allowdrag		false	Allow pages in the tree to be dragged to new locations?
true - allow page moving
false - do not allow page moving
3.0
treename		 	The name of the tree (for use with pagepanel macro) 
 May be deprecated or changed in future versions	3.0
titletip		false	Should the page title be used as the tooltip when hovering over items in the tree?
true - display the page title in the tooltip
false - display the date and author of the item in the tooltip
3.0
initialDepth		1	Prevent the tree expanding beyond this depth on page startup.	3.0
    
</entry>
<entry [Sun 2012:01:15 13:02:57 EST] COMPLETED LEFT NAVIGATION BAR LAYOUT AND CUSTOM CSS>


LEFT NAVIGATION BAR LAYOUT
==========================

Space Admin --> Edit Space Layout --> Left Column:

BAD FORMAT (NO FOLDERS):

#{divbox:id=rw_pagetree|class=navTree}
#{pagetree:root=@none|expandCollapseAll=true|showRoot=false|startDepth=5|expandCollapseAll=true}
#{divbox}

# ALPHABETICAL SORT ONLY
#{divbox:id=rw_pagetree|class=no_icons}{pagetree2:root=@none|expandCollapseAll=true}{divbox}{space-news}


USED class=nav_lsb FOR MANUAL SORT AND NICE IMAGES:

{divbox:class=nav_lsb}{pagetree2:@home|selectionMode=node|sort=natural}{divbox}

{space-news}

{composition-setup}
cloak.toggle.exclusive = false
{composition-setup}

h2. {toggle-cloak:id=zero} Blogs

{cloak:id=zero}
Bioinformatics blogs
{cloak}

h2. {toggle-cloak:id=one} Forums

{cloak:id=one}

{rss:url=http://biostar.stackexchange.com/feeds|max=1|showTitlesOnly=true|titleBar=true}

{rss:url=http://feeds.feedburner.com/seqanswers|max=1|showTitlesOnly=true|titleBar=true}

{cloak}

h2. {toggle-cloak:id=two} Journals

{cloak:id=two}

{rss:url=http://feeds.feedburner.com/seqanswers|max=1|showTitlesOnly=true|titleBar=true}

{rss:url=http://barf.jcowboy.org/bmcgenomics.xml|max=1|showTitlesOnly=true}

{rss:url=http://www.medworm.com/rss/medicalfeeds/source/Source+Code+for+Biology+and+Medicine.xml|max=1|showTitlesOnly=true}

{rss:url=http://barf.jcowboy.org/bioinformatics.xml|max=1|showTitlesOnly=true}

{cloak}

h2. {toggle-cloak:id=three} Twitter

{cloak:id=three}


{rss:url=http://www.twibes.com/group/Bioinformatics/tweets.rss?screen_name=bioinformatics|max=1|showTitlesOnly=true}


{rss:url=http://api.twitter.com/1/statuses/user_timeline.rss?screen_name=bioinformatics|max=1|showTitlesOnly=true}

{cloak}


CUSTOM CSS
==========

/* HIDE METADATA AT TOP OF PAGE, INCLUDING PAGE NAME */
.page-metadata-wrapper,
.page-metadata,
.page-metadata-modification-info,
#fullscreen-container .customSection,
#fullscreen-container .page_title {
    visibility: hidden !important;
    display: none !important;
}


/* CLEAR MENU BAR BACKGROUND IMAGE */
#menu_bar {
    background: url();
}

/* CLOAK TOGGLE IN LEFT NAVBAR */
.cloakToggle {
    margin: 0px !important;
}
/* WIKI CONTENT FONT */
.wiki-content,
.wiki-content p {
    font-family: Helvetica !important;
}

/* REMOVE BACK BUTTON */
a.space_back {
    display: none !important;
}

a.space_link {
    background: none !important;
    font-size: 20px !important;
}

/* MAILING LIST */
#description-box {
    font-size: 16px !important;
}
#admin-notice {
    visibility: hidden !important;
    display: none !important;
}


/* PAGETREE BACKGROUND */
.page_left_section {
    background-color: #FFF !important;
}

/* CODE SECTIONS */
.code {
    border-style: none !important;
}

.wiki-content .preformattedContent, .wiki-content .code .panel {
    border-color: transparent !important;
}

.wiki-content .preformattedContent, .wiki-content .codeContent {
    padding: 0px 0px !important;
    margin: 0px 0px !important;
}
pre {
    /*  float: left; */
    width: 540px;
    padding: 0 0 0 5px; 
    color: #44FF00;
    background: #222;
    overflow: auto;
    font: normal 12px "bitstream vera sans mono", monaco "lucida console", "courier new", courier, serif;
    margin: 0.9em 0; padding: 8px;
}
pre {
    white-space: pre-wrap;
    white-space: -moz-pre-wrap !important;
    white-space: -pre-wrap;
    white-space: -o-pre-wrap;
    word-wrap: break-word;
}
pre a:hover {
    background: #FFC;
}
pre a:hover {
    background: #ABD86E;
}
pre a {
    color: #C94B00 !important ;
    outline-style: none;
    outline-width: medium;
    text-decoration: none;
}

/* HIDE TOP MENU */
#top_menu {
    visibility: hidden !important;
    display: none !important;
}


/* HIDE CHILDREN SECTION */
#children-section {
    visibility: hidden !important;
    display: none !important;
}

.wiki-content h3 {
    margin-top: 10px !important;
}

/* TOGGLE PAGETREE */
.plugin_pagetree ul li a {
color: black !important;
    padding: 0px !important;
    margin: 0px !important;
}

/* ACTIVE ARROW OF CATEGORY (Download, Developers,etc.) */
#category_menu_dynamic li#active a span.menu_left {
    background: url("../../images/templates/pointer/category_menu_active.png") no-repeat scroll transparent;
    background-position: center bottom; 
   color: #FFFFFF;
    font-size: 16px;
    font-weight: bold;
    height: 40px;
    padding: 0 10px;
}

/* NAVIGATION MENU ON HOVER */
.navTree .plugin_pagetree_children ul li span:hover[id^='childrenspan'] {
    background-color: #7DE !important;
    color: #000 !important;
}

.plugin_pagetree ul li a,
.plugin_pagetree ul li a:hover,
.plugin_pagetree ul li a:active,
.plugin_pagetree ul li a:visited {
    color: #000 !important;
}

.plugin_pagetree li:hover,
.plugin_pagetree li:active,
.plugin_pagetree li:visited {
    background-color: #BCD !important;
}

span[id^='childrenspan'] {
    visibility: visible !important;
    background-image: url(/confluence/s/1636/56/1/_/download/resources/com.adaptavist.confluence.themes.sitebuilder:sitebuilder/icons/document_plain.png);
    background-repeat: no-repeat;
    height: 20px !important;
    color: #000;
}

.navTree .plugin_pagetree_children ul li {
    background-image: url(http://www.stuartpyoung.com/confluence/s/1636/56/1/_/download/resources/com.adaptavist.confluence.themes.sitebuilder:sitebuilder/nlstree/img/lineints.gif);
    background-repeat: no-repeat;
}

.navTree .plugin_pagetree_children ul li img {
    visibility: hidden !important; 
    width: 15px !important;
}

.navTree .plugin_pagetree_children ul li  a.plugin_pagetree_childtoggle {
    visibility: visible !important;
    background-image: url(http://www.stuartpyoung.com/confluence/s/1636/56/1/_/download/resources/com.adaptavist.confluence.themes.sitebuilder:sitebuilder/icons/folder.png);
    background-repeat: no-repeat;
    background-position: left !important;
    height: 30px !important;
    width: 30px !important;
    z-index: 500;
}

.plugin_pagetree {
    background-color: #FFF !important;
    border: 1px solid #AAA;
    -moz-border-radius: 6px;
    -webkit-border-radius: 6px;
    border-radius: 6px;
}

.customSection .plugin_pagetree ul {
    font-size: 13px;
}

.navTree {
background-color: #FFF;
border: 1px;
border-color: #444;
}

#top_logo_wrapper {
    float: left;
    height: 0px !important;
    width: 500px;
}

#category_menu_wrapper {
    left: 130px !important;
    position: absolute !important;
    z-index: 500 !important;
}

#top {
    height: 0px !important;
    padding: 0 10px  !important;
    text-align: left  !important;
}

#menu_bar {
    -moz-border-radius: 6px 6px 6px 6px;
    padding: 0 !important;
    top: 10px !important;
}

#top_menu {
    height: 52px !important;
   position: absolute !important;
    right: 190px !important;
    top: -15px !important;
    width: 445px !important
}    

#breadcrumb_wrapper,
#breadcrumbs li, 
#breadcrumbs li a,
#breadcrumb_wrapper li span, 
#breadcrumb_wrapper li span a,
#breadcrumb_wrapper #breadcrumbs li span, 
#breadcrumb_wrapper #breadcrumbs li span a {
    visibility: hidden !important;
    display: none !important;
}


#category_menu_dynamic li a span.menu_left {
    color: #FFFFFF !important;
}

#category_menu_dynamic li.menu_item_1 a span.menu_left {
    visibility: hidden !important;
    display: none !important;
}

#category_menu_dynamic {
    margin-left: 90px !important;
}


    
</entry>
<entry [Fri 2012:01:13 09:01:48 EST] A MILDER PRE CSS FORMAT>

pre {
    margin: 12px 0;
    padding: 6px 9px 7px;
    font-size: 11px;
    border: 1px solid #CCC;
    background: #FFFFEB;
    color: #555;
    border-left: none;
    border-right: none;
    overflow: auto;
}

pre, code {
    font-family: "Lucida Grande", "Lucida 
}

p, blockquote, code, pre, div, form, table {
    vertical-align: baseline;
}

pre, xmp, plaintext, listing {
    display: block;
    font-family: monospace;
    white-space: pre;
    margin: 1em 0px;
}



</entry>
<entry [Tue 2012:01:10 05:44:05 EST] BACKED UP HOWTO AND WHOLE SITE TO notes>

 create mode 100644 backup/confluence/agua-howto-export-120104-post-doc-082832-74.xml.zip
 create mode 100644 backup/confluence/confluence-backup-120104-post-doc-082451-70.xml.zip
 create mode 100644 compare.runs.xsl
    
</entry>
<entry [Mon 2012:01:02 23:17:23 EST] IMPORTED TEXT DOC FILES INTO aguadev>

To import text files from a directory on the Confluence server:

Choose Browse > Space Admin.

 Space Admin is displayed only if you are a space administrator for that space or you are a Confluence system administrator.

Click Import pages from disk in the left panel under 'Import'.

Type the directory's path into the Import directory box.

Select Trim file extensions to remove file extensions from the page titles when converting the files
to Confluence pages. Note that:

    the Confluence pages will take their titles from the files' names (including their extensions).
    
So to avoid having page titles with a suffix like '.txt', make sure you check this box.
    
Select Overwrite existing pages if you want to replace existing Confluence pages with the same page title.

Click Import. 

    
</entry>
<entry [Wed 2011:11:23 23:35:54 EST] CHANGED FROM www.stuartpyoung.com TO www.aguadev.org ON LINODE>

SEE linode.xsl
[Wed 2011:11:23 22:51:53 EST]
SET LINODE TO www.aguadev.org

EDITED server.xml:


NB: THIS FILE CONTAINS THE ONLY REFERENCE TO www.stuartpyoung.com

cd /usr/share/confluence-3.0.2-std
grep -r -n www.stuartpyoung.com *
    conf/server.xml:7:		   proxyName="www.stuartpyoung.com" proxyPort="80"


 
    
</entry>
<entry [Thu 2011:11:17 02:13:51 EST] FIXED DEFAULT HOME PAGE www.stuartpyoung.com/confluence>

CONFLUENCE ADMIN --> SITE CONFIGURATION --> SITE WELCOME MESSAGE

REMOVED '{show-to:user=@anonymous}{redirect:home:Home}{show-to}'

    
</entry>
<entry [Fri 2011:08:26 06:07:12 EST] USED blog-posts MACRO INSTEAD OF space-news>

... BECAUSE THE LATTER CAN'T DISPLAY THE ENTIRE TEXT WITHOUT CLICKING IT (AND THEN IT BROWSES TO A BLOG POST PAGE)


{blog-posts}

PARAMETERS:

    Parameter name	 Default	 Description
    default parameter	 15	 Specify the number of posts you want to display.
    content	 entire	 Specify 'content=excerpts' to display short excerpts, or 'content=titles' to display a list of posts.
    time	 no limit
    Specify from how far back in time you want items displayed, using 'h' (hours) or 'd' (days). 
    labels	 none	 Display posts that match the specified label(s).
    spaces	 @all	 Display posts from the specified space(s). Specify '@all' for all spaces, the space key for a global space, or '~username' for a personal space. Separate multiple space keys with commas.
    
</entry>
<entry [Tue 2011:08:23 09:36:06 EST] ADDED NABBLE MAILING LIST TO AGUA CONFLUENCE>

user: youngstuart
email: stuartpyoung@gmail.com
pass: u*u*l

Agua MAILING LIST URL:

http://agua.1062669.n5.nabble.com/


EMBED IN PAGE:

<!--

<a id="nabblelink" href="http://agua.1062669.n5.nabble.com/">Agua</a>
<script src="http://agua.1062669.n5.nabble.com/embed/f4726807"></script>

-->
 
    OK

    
</entry>
<entry [Mon 2011:08:22 10:23:53 EST] FIX 'active' ID IN HOME PAGE>

Confluence Admin --> Look and Feel --> Insert Custom HTML-- > At end of the BODY	

<!--

<script>
    
var categoryMenu = document.getElementById('category_menu_dynamic');
console.log("categoryMenu: " + categoryMenu);
if ( categoryMenu != null )
{
    var activeNode = categoryMenu.childNodes[3];
    console.log("categoryMenu.childNodes.length: " + categoryMenu.childNodes.length);
    console.log("activeNode: " + activeNode);
    console.dir({activeNode: activeNode});
    //activeNode.setAttribute("id","active");
    activeNode.id = "active";
    console.log("activeNode.id: " + activeNode.id);

}

</script>

-->
    
</entry>
<entry [Mon 2011:08:22 06:05:18 EST] LEFT NAV BAR CONFIGURATION SETTINGS>


Space Admin --> Edit Space Layout --> Left Column:


{divbox:id=rw_pagetree|class=navTree}
{pagetree:root=@none|expandCollapseAll=true|showRoot=false|startDepth=5|expandCollapseAll=true}
{divbox}

{composition-setup}
cloak.toggle.exclusive = false
{composition-setup}

h2. {toggle-cloak:id=zero} Blogs

{cloak:id=zero}
Bioinformatics blogs
{cloak}

h2. {toggle-cloak:id=one} Forums

{cloak:id=one}

{rss:url=http://biostar.stackexchange.com/feeds|max=1|showTitlesOnly=true|titleBar=true}

{rss:url=http://feeds.feedburner.com/seqanswers|max=1|showTitlesOnly=true|titleBar=true}

{cloak}

h2. {toggle-cloak:id=two} Journals

{cloak:id=two}

{rss:url=http://feeds.feedburner.com/seqanswers|max=1|showTitlesOnly=true|titleBar=true}

{rss:url=http://barf.jcowboy.org/bmcgenomics.xml|max=1|showTitlesOnly=true}

{rss:url=http://www.medworm.com/rss/medicalfeeds/source/Source+Code+for+Biology+and+Medicine.xml|max=1|showTitlesOnly=true}

{rss:url=http://barf.jcowboy.org/bioinformatics.xml|max=1|showTitlesOnly=true}

{cloak}

h2. {toggle-cloak:id=three} Twitter

{cloak:id=three}


{rss:url=http://www.twibes.com/group/Bioinformatics/tweets.rss?screen_name=bioinformatics|max=1|showTitlesOnly=true}


{rss:url=http://api.twitter.com/1/statuses/user_timeline.rss?screen_name=bioinformatics|max=1|showTitlesOnly=true}

{cloak}



    
</entry>
<entry [Mon 2011:08:22 03:20:59 EST] RSS FEEDS>

SEQANSWERS

h3. RSS feeds
{rss:url=http://feeds.feedburner.com/seqanswers|max=5|showTitlesOnly=true}

THIS DOESN'T WORK:
{rss:url=http://bioinformatics.oxfordjournals.org/rss|max=3|showTitlesOnly=true}


{rss:url=http://barf.jcowboy.org/bmcgenomics.xml|max=3|showTitlesOnly=true}


http://barf.jcowboy.org/



BIOINFORMATICS
http://bioinformatics.oxfordjournals.org/rss/ahead.xml
http://bioinformatics.oxfordjournals.org/rss/current.xml
http://bioinformatics.oxfordjournals.org/rss/recent.xml



</entry>

<entry [Sat 2011:08:20 22:11:03 EST] PAGETREE CONFIGURATION FOR LEFT HAND NAVIGATION BAR>



{divbox:id=rw_pagetree|class=navTree}
{pagetree:root=@none|expandCollapseAll=true|showRoot=false|startDepth=5|expandCollapseAll=true}
{divbox}



NOTES
-----


PAGETREE2

{divbox:id=rw_pagetree|class=no_icons}

{pagetree2:@space|selectionMode=row|sort=position|startDepth=3|root=Download|expandCollapseAll=true}

{divbox}
{space-news}

PAGETREE

{divbox:id=rw_pagetree|class=no_icons}{pagetree:@space|sort=position|startDepth=3|root=Download|expandCollapseAll=true}{divbox}{space-news}


{divbox:id=rw_pagetree}
{pagetree:root=@none|expandCollapseAll=true}
{divbox}


<img src="http://www.stuartpyoung.com/confluence/s/1636/56/1/_/download/resources/com.adaptavist.confluence.themes.sitebuilder:sitebuilder/nlstree/img/lineints.gif" class="pagetree2 angleline">
    
    
</entry>
<entry [Fri 2011:08:19 22:40:27 EST] CHANGE COLOUR OF NEWS ITEMS IN REFINED WIKI>

.news_pic_item_btn .rw_news_pic_item_heading
{
background:red;
}

.news_pic_item_btn .rw_news_pic_item_heading:hover
{
background:blue;
}

</entry>
<entry [Fri 2011:08:19 07:33:59 EST] REMOVED GLOBAL CSS>

#category_menu_dynamic li a span.menu_left {
    color: #FFFFFF !important;
}

#category_menu_dynamic li.menu_item_1 a span.menu_left {
    visibility: hidden !important;
    display: none !important;
}

#category_menu_dynamic {
    margin-left: 60px !important;
}

#main_wrapper {
margin-left: 2px !important;
}

#top_menu li a {
/* font-size: 12px !important; */
font-weight: bolder !important;
color: #000000 !important;
}

#top {
height: 0px !important;
}

#top_logo_wrapper {
height: 0px !important;
}
    
</entry>
<entry [Fri 2011:08:19 06:38:21 EST] CSS TO FIX MENU POSITION>


<a class="category_download" title="Download" href="http://www.stuartpyoung.com/confluence/display/download/Download">
<span class="menu_left">
<span>Download</span>
<span class="icon_container_16 category_dropdown_btn"></span>
</span>
<span class="menu_right"></span>
</a>


http://www.stuartpyoung.com/confluence/download/resources/com.refinedwiki.confluence.plugins.theme.original/styles/templates/refinedwiki-template-pointer-base.css

#category_menu_dynamic li#active a span.menu_left {
    background: url("../../images/templates/pointer/category_menu_active.png") no-repeat scroll center bottom transparent;
    color: #FFFFFF;
    font-size: 16px;
    font-weight: bold;
    height: 40px;
    padding: 0 10px;
}




<li id="" class="menu_item_2">
<a class="category_home" title="Home" href="http://www.stuartpyoung.com/confluence/display/agua/Home">
<span class="menu_left">
<span>Home</span>
<span class="icon_container_16 category_dropdown_btn"></span>
</span>
<span class="menu_right"></span>
</a>
</li>





#category_menu_dynamic a span.menu_left span.category_dropdown_btn {
    background: url("../../images/icons.png") no-repeat scroll -582px -2px transparent;
}
refine...ase.css (line 178)
#category_menu_dynamic a span.menu_left span {
    float: left;
}




ONWORKING TRIANGLE IMAGE FOR SELECTED 'Agua HOME':


#category_menu_dynamic a span.menu_left span.category_dropdown_btn {
    background: url("../../images/templates/pointer/category_menu_active.png") no-repeat scroll center bottom transparent;
}


#menu_bar a.space_back {  
    visibility: hidden !important;  
    display: none !important;  
}

#category_menu_wrapper {
    left: 50px !important;
    position: absolute !important;
    z-index: 500 !important;
}

#top {
    height: 0px !important;
    padding: 0 10px  !important;
    text-align: left  !important;
}

#menu_bar {
    -moz-border-radius: 6px 6px 6px 6px;
    padding: 0 !important;
    top: 10px !important;
}

#top_menu {
    height: 52px !important;
   position: absolute !important;
    right: 190px !important;
    top: -15px !important;
    width: 445px !important
}    

#breadcrumb_wrapper,
#breadcrumbs li, 
#breadcrumbs li a,
#breadcrumb_wrapper li span, 
#breadcrumb_wrapper li span a,
#breadcrumb_wrapper #breadcrumbs li span, 
#breadcrumb_wrapper #breadcrumbs li span a {
    visibility: hidden !important;
    display: none !important;
}


#category_menu_dynamic li a span.menu_left {
    color: #FFFFFF !important;
}

#category_menu_dynamic li.menu_item_1 a span.menu_left {
    visibility: hidden !important;
    display: none !important;
}

#category_menu_dynamic {
    margin-left: 50px !important;
}


    
</entry>
<entry [Fri 2011:08:19 06:23:54 EST] ADDED PAGETREE2 TO ALL PAGES >

Space Admin --> Edit Space Layout --> CHANGE TO:


    {divbox:id=rw_pagetree|class=no_icons}{pagetree2:root=Agua|expandCollapseAll=true|startDepth=3}{divbox}{space-news}
    
    h3. RSS feeds
    {rss:url=http://feeds.feedburner.com/seqanswers|max=5|showTitlesOnly=true}
    
</entry>
<entry [Fri 2011:08:19 06:14:57 EST] ADDED PLUGIN Branch Remover TO AID REFACTORING>

http://www.valiantys.com/display/IN/Accueil

BUT DOES NOT WORK!!! SO DISABLED...
    
</entry>
<entry [Fri 2011:08:19 05:56:07 EST] REMOVED CSS FROM Agua SPACE>


.customSection {
}

.page-metadata-wrapper {
visibility: hidden !important;
border: none  !important;
margin-bottom: 0px !important;
min-height: 0px !important
padding: 0px !important
}


#main_wrapper {
margin-left: 2px !important;
}

#top_menu li a {
/* font-size: 12px !important; */
font-weight: bolder !important;
color: #000000 !important;
}

//#quick-search-query {
//position: absolute !important;
//top:35px !important;
//left: 20px !important;
//background: #FFFFFF !important;
//height: 30px !important;
//}

#top {
height: 0px !important;
}

#top_logo_wrapper {
height: 0px !important;
}

/* full360.com TERMINAL THEME FOR PRE TEXT */
pre {
/*  float: left; */
    width: 540px;
    padding: 0 0 0 5px; 
  
    color: #88FF00;
    font-weight: bold;

    background: #222;
    overflow: auto;
    font: normal 12px "bitstream vera sans mono", monaco "lucida console", "courier new", courier, serif;
    margin: 0.9em 0; padding: 8px;
}

/* http://longren.org/2006/09/27/wrapping-text-inside-pre-tags */
pre {
    white-space: pre-wrap;
    white-space: -moz-pre-wrap !important;
    white-space: -pre-wrap;
    white-space: -o-pre-wrap;
    word-wrap: break-word;
}

a:hover {
    background: #FFC;
}
a:hover {
    background: #ABD86E;
}
pre a {
    color: #FF2222 !important;
    font-weight: bold;
    outline-style: none;
    outline-width: medium;
    text-decoration: none;
}





/* THIS REMOVES THE DOTTED LINE AROUND code BLOCKS */
.panel {
    border: 3px solid transparent !important;
    border-spacing: 0px 0px;
}


.wiki-content .preformattedContent, 
.wiki-content .codeContent {
    background: #EEE;
    padding: 20px 10px;
    border: 3px solid #CCC !important;
}
.panelContent {
background-color: transparent;
border: 3px solid #CCC !important;
border-bottom-left-radius: 6px 6px;
border-bottom-right-radius: 6px 6px;
border-top-left-radius: 6px 6px;
border-top-right-radius: 6px 6px;
}
.preformattedContent panelContent {
background-color: transparent;
border: 3px solid #CCC;
border-bottom-left-radius: 6px 6px;
border-bottom-right-radius: 6px 6px;
border-top-left-radius: 6px 6px;
border-top-right-radius: 6px 6px;
    
}


div.panel .panelcontent {
background-color: transparent;
border: 3px solid #CCC;
}

div.code .panelcontent, div.preformatted .panelcontent, div.panelmacro, div.panelmacro table {
border-bottom-left-radius: 6px 6px;
border-bottom-right-radius: 6px 6px;
border-top-left-radius: 6px 6px;
border-top-right-radius: 6px 6px;
}

#top_menu li top_menu_addspace {
    color: #000;
    font-size: 15px;
}


#top {
    display: none;
}

.quick-search-query {
    background-color: #FFF;
    font-size: 15px;
    height: 30px;
    size: 50;

}

/* CENTER ROWS IN TABLES */
td.confluenceTd, table.confluenceTable td.confluenceTd {
    vertical-align: middle;
}

/* CENTER PAGE TITLE */
.page_title {
    text-align: center;
}


/* HIDE PAGE METADATA */
.page-metadata {
    display: none;
    visibility: hidden;
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
font-size: 14px;
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
<entry [Fri 2011:08:19 05:02:03 EST] CHANGED TO pagetree2 IN GLOBAL SPACE LAYOUT>


Confluence Admin --> Edit Global Space Layout

Your changes has been saved
Left Column:	

####{divbox:id=rw_pagetree|class=no_icons}{pagetree:root=@none|expandCollapseAll=true}{divbox}{space-news}
{divbox:id=rw_pagetree|class=no_icons}{pagetree2:root=@none|expandCollapseAll=true}{divbox}{space-news}


</entry>
<entry [Fri 2011:08:19 04:48:18 EST] USED CSS TO HIDE BREADCRUMBS IN REFINEDWIKI THEME>




SCRAPPED THIS - USED CSS INSTEAD

Space Admin --> Stylesheets --> Paste and Save:

#breadcrumb_wrapper,
#breadcrumbs li, 
#breadcrumbs li a,
#breadcrumb_wrapper li span, 
#breadcrumb_wrapper li span a,
#breadcrumb_wrapper #breadcrumbs li span, 
#breadcrumb_wrapper #breadcrumbs li span a {
    visibility: hidden !important;
    display: none !important;
}




1. ENABLED HTML MACROS

http://confluence.atlassian.com/display/DOC/Enabling+HTML+macros 

Confluence Admin --> Plugins --> Confluence HTML Macros -> Enabled




2. CREATED JQuery MACRO

From Confluence, navigate to Confluence Admin > User Macros from the Browse Menu
Select 'Create a new user macro'
Set Macro Name to the: jquery
Change Output to macro generate HTML output
Copy and paste the code below into the Template field
Click save



## Macro name: jquery
## Macro has a body: Y
## Body format: Unprocessed
## Output: Wiki
##
## Version: 1.3
##
## Developed by: Simon Bartlett (http://simonbartlett.co.uk)
## Date created: 26/05/2010
## Installed by: < admin>
 
## This macro sets up references to jQuery so that it can be used easily in pages or other user macros.
 
##CONFIG
##
## Location of help page for this macro:
#set($helpUrl= "http://confluence.atlassian.com/display/DISC/jQuery+User+Macro")
##jQuery Library Locations
    #set($jQueryUrl_12= "http://ajax.googleapis.com/ajax/libs/jquery/1.2.6/jquery.min.js")
    #set($jQueryUrl_13= "http://ajax.googleapis.com/ajax/libs/jquery/1.3.2/jquery.min.js")
    #set($jQueryUrl_14= "http://ajax.googleapis.com/ajax/libs/jquery/1.4.2/jquery.min.js")
## Set default:
#set($jQueryUrl = $jQueryUrl_14)
 
#if (!($param0 == "help") && !($generalUtil.convertToString($body).replaceAll(' ', '').replaceAll('\n', '') == ""))
 
#set($markup= $parammarkup)
## Check for valid version, otherwise set to 0 (for unique namespace)
#if ($paramversion>1)
  #set($namespace = $paramversion * 10)
#else
  #set($namespace = 0)
#end
 
#set($haveList= $generalUtil.convertToString(${paramplugins}).replaceAll(' ', '').replaceAll('\n', ''))
#set($scriptList1= '["')
#set($scriptList2= $generalUtil.convertToString(${haveList}).replaceAll(',', '","') )
#set($scriptList3= '"]')
#set($scriptList= "$scriptList1$scriptList2$scriptList3")
#if($namespace == 12)
    #set($jQueryUrl= $jQueryUrl_12)
#elseif($namespace == 13)
    #set($jQueryUrl= $jQueryUrl_13)
#elseif($namespace == 14)
    #set($jQueryUrl= $jQueryUrl_14)
#end
 
    {html}
    <script type="text/javascript">
        jQueryOriginal = (typeof jQuery == 'undefined') ? null : jQuery;
        if (typeof jQuery$namespace == 'undefined') document.write('<script src="$jQueryUrl" type="text/javascript"><\/script><script type="text/javascript">jQuery.noConflict();<\/script>');
        else jQuery = jQuery$namespace;
    </script>
#if($paramplugins!='' && $haveList != '')
    <script type="text/javascript">
        scriptList = $scriptList;
        jQueryRef_${namespace} = (typeof jQueryRef_${namespace} == 'undefined') ? new Array() : jQueryRef_${namespace};
 
        for (url in scriptList)
        {
            if (url.match(/a/)==null && url.match(/e/)==null && url.match(/i/)==null && url.match(/o/)==null && url.match(/u/)==null) {
                if ( jQuery.inArray(scriptList[url], jQueryRef_${namespace}) )
                {
                    jQueryRef_${namespace}.push(scriptList[url]);
                    if (scriptList[url].match(/.css$/) != null)
                        document.write('<link rel="stylesheet" href="' + scriptList[url] + '" type="text/css" \/>');
                    else
                        document.write('<script src="' + scriptList[url] + '" type="text/JavaScript"><\/script>'); 
                }
            }
        }
    </script>
#end
    <script type="text/javascript">
        jQuery$namespace = jQuery;
        jQuery = jQueryOriginal;
    </script>
    {html}
 
#set($replace1= "jQuery$namespace" + '\(')  
#set($replace2= "jQuery$namespace" + '\.')
#set($macrobody= $generalUtil.convertToString($body).replaceAll('\$\(', $replace1).replaceAll('jQuery\(', $replace1).replaceAll('\$\.', $replace2).replaceAll('jQuery\.', $replace2))
 
#if($markup == "wiki")
    $macrobody
#elseif($markup == "html")
    {html}$macrobody{html}
#else
    {html}<script type="text/javascript">$macrobody</script>{html}
#end
 
#else
The following versions of jQuery may be referenced:
 - 1.2 ($jQueryUrl_12)
 - 1.3 ($jQueryUrl_13)
 - 1.4 ($jQueryUrl_14)
 
Available Parameters:
'markup': Describes body content of macro: script (default), html or wiki. Value of help produces this output.
'version': Version of jQuery required. Omit this parameter to use the latest version available.
'plugins': Full path for any specific plug-ins you wish to use. Comma delimited.
 
For more info see this wiki page: [$helpUrl]
#end






Usage
-----

Edit a page and enter the following wiki markup:

View help documentation:

{jquery:help}



Using the $ (dollar) syntax:

{jquery}
    $(function() {
        $("#elementId").hide();
    });
{jquery}


Using the jQuery syntax:

{jquery}
    jQuery("#elementId").hide();
{jquery}



Referencing a specfic verion of jQuery:

{jquery:version=1.3}
    jQuery("#elementId").hide();
{jquery}



Using HTML as the body format:

{jquery:markup=html}
<div id="helloWorld">HELLO WORLD</div>
<script type="text/javascript">
    $("#elementId").hide();
</script>
{jquery}




Using WikiMarkup as the body format:

{jquery:markup=wiki}
{html}
    <div id="helloWorld">HELLO WORLD</div>
    <script type="text/javascript">
        $("#elementId").hide();
    </script>
{html}
{jquery}
Referencing plugins:

{jquery:plugins=http://...jquery.plugin1.js,http://...jquery.plugin2.js}
    jQuery("#elementId").pluginMethod();
{jquery}







The simplest/safest method to include inline JS is to create a user 
macro: http://confluence.atlassian.com/display/DISC/Shared+User+Macros


If you want to use the jQuery javascript library then you'll find that this is embedded in recent versions of Confluence. You can do a hell of a lot with this library in a few lines of code.

This user macro, published by my colleague Simon Bartlett, will help you use jQuery more easily:

http://confluence.atlassian.com/display/DISC/jQuery+User+Macro

Hope this helps,



    
</entry>
<entry [Fri 2011:08:19 03:01:43 EST] USED THEME BUILDER PLUGIN TO REMOVE DASHBOARD MENU ITEM>

INSTALLED Page Information Plugin FOR THEME BUILDER:

'Manage Builder Layouts'

Click the layout you want to change

Go to the menus tab
Click 'Edit'

Remove the line containing "caption=Dashboard"

 {submenu}{menuicon:documents}Other pages
  {compound-menuitem:home|icon=house|caption=Home page}
//  {compound-menuitem:dashboard|icon=presentation|caption=Dashboard}
  {menuseparator}


Click OK, Save layout, and you're done.

BUT DIDN'T WORK!!!

    
</entry>
<entry [Fri 2011:08:19 01:14:04 EST] SET CUSTOM GLOBAL LOGO>

Confluence Admin --> Look and Feel --> Global Logo --> Upload PNG

https://www.adaptavist.com/display/AtlassianConfluence/Global+Logo

You must be logged in as a system administrator to access this functionality
The logo must be a valid GIF, JPEG or PNG file
The logo should not be wider than 250 pixels

    OK!!!
    
</entry>
<entry [Fri 2011:08:19 00:52:12 EST] INSTALLED PARTIAL COPY PLUGIN>

Copy Partial Space developped by Valiantys allows you to copy any branch of a space into a new space.

It's particularly useful for refactoring purpose:

    One of your spaces is growing over a reasonable amount of pages and you want to split it into several spaces.
    A space becomes too complex and have to be reorganized.
    You want to refactor permissions without getting into the hell of page level restrictions.

HOW TO:

1. select the parent page of the branch you want to copy

2. click on the Copy into a new space button in the Tools menu

3. select a key and a label for your space.

4. You're done! Easy :)

    
</entry>
<entry [Fri 2011:08:19 00:28:49 EST] DISABLE THE PEOPLE DIRECTORY>


The People Directory provides a list of all users in your Confluence system.

If you need to disable the People Directory set the following system properties on your application server command line:


To disable the People Directory for anonymous users,

-Dconfluence.disable.peopledirectory.anonymous=true


To disable the People Directory entirely,

-Dconfluence.disable.peopledirectory.all=true
 
 
    
</entry>
<entry [Thu 2011:08:18 10:33:23 EST] CREATED REDIRECT FROM 'DASHBOARD' TO CUSTOM HOME PAGE>

http://www.adaptavist.com/display/AtlassianConfluence/Custom+Dashboards
Redirect requests from The Dashboard to a specific Space, thus allowing full customisation of the new "dashboard space" that's presented to users.

1. INSTALL REQUIRED PLUGINS

Redirection Plugin
Visibility Plugin
Composition Plugin
Content Formatting Macros

style macro in 'Content Formatting Macros ? Adaptavist'


2. CREATE CUSTOM DASHBOARD SPACE

Create a new space to hold your new dashboard. You can call it anything you want, but we recommend using "Dashboard" as the space key so that URLs will be like:

www.mysite.com/display/Dashboard/Home


3. CREATE NEW DASHBOARD HOME PAGE

The home page of the space you have just created will be your new dashboard. Edit the page to include the following:

{section}{column:width=50%}
Insert your introduction text here
{spaces}
{column}{column:width=50%}
{recently-updated:width=100%|types=page,news,comment|spaces=*}
{favpages}
{column}{section}


4. REDIRECT TO THE NEW DASHBOARD

ADD TO 'WELCOME MESSAGE SETTING':

General Configuration --> Site Configuration --> Site Welcome Message setting

NB: IT WORKS NOW THAT I HAVE REINSTALLED THE CONFLUENCE 

{show-to:user=@anonymous}{redirect:agua:Agua}{show-to}



5. HIDE 'DASHBOARD' MENU ITEM  -- OK

#category_menu_dynamic li.menu_item_1 a span.menu_left {  
    visibility: hidden !important;  
    display: none !important;  
}  
  
#category_menu_dynamic {  
    margin-left: 50px !important;  
}  
  

6. COLOR MENU ITEMS WHITE

#category_menu_dynamic li.menu_item_1 a span.menu_left {  
    color: #FFFFFF !important;
}


POSITION MENU RELATIVE TO GLOBAL LOGO (SEE ABOVE)


#main_top_right {
    height: 0 !important;
    top: -10px !important;
}








THIS DIDN'T WORK!!!

INSTALL style MACRO
General Configuration --> Site Welcome Message setting



{style}
.category_menu_wrapper {
    position: relative !important;
    left:  50px !important;
}
{style}





ADDED TO Confluence Admin --> GLOBAL STYLESHEET BUT DIDN'T WORK!!!:

.category_menu_wrapper {
position: absolute !important;
left: 0px !important;
}

.page-title,
.page-title .title-text {
    visibility: hidden !important;
    display: none !important;
}




#main_wrapper {
margin-left: 2px !important;
}

#top_menu li a {
/* font-size: 12px !important; */
font-weight: bolder !important;
color: #000000 !important;
}

#top {
height: 0px !important;
}

#top_logo_wrapper {
height: 0px !important;
}




5. ADD KEYWORDS PLUGIN

http://techtime.co.nz/display/TECHTIME/TechTime+EasySEO+Plugin+for+Atlassian+Confluence






LATER: ENABLE PUBLIC SIGNUP, ANONYMOUS ACCESS TO REMOTE API AND CUSTOM STYLESHEETS:

General Configuration --> Security and Privacy --> Public Signup --> ON

General Configuration --> Security and Privacy -->  Anonymous Access to Remote API:	ON

General Configuration --> Security and Privacy -->  Enable Custom Stylesheets for Spaces: ON


    
</entry>
<entry [Thu 2011:08:18 04:43:34 EST] LINODE CONFLUENCE INFO 500page.jsp>

SUMMARY:

supportEntitlementNumber: 821413
version: 3.0.2
Unique ID: 65b1beab-b453-445d-8be1-d88732d19bea
Server information

FULL OUTPUT:

logo System Error

A system error has occurred ? our apologies!

Please ask your Confluence administrator to create a support issue on Atlassian's support system at http://support.atlassian.com with the following information:

   1. a description of your problem and what you were doing at the time it occurred
   2. a copy of the error and system information found below
   3. a copy of the application logs (if possible).

Your Confluence administrator can use the support request form to create a support ticket which will include this information.

We will respond as promptly as possible.
Thank you!

Referer URL

Unknown
Confluence Application Information
Build Information

home: /usr/share/confluence-data
buildNumber: 1636
upTime: 19 hours, 37 minutes, 8 seconds
devMode: false
supportEntitlementNumber: 821413
version: 3.0.2
Unique ID: 65b1beab-b453-445d-8be1-d88732d19bea
Server information

Application Server: Apache Tomcat/6.0.14
Servlet Version: 2.5
Database Dialect: com.atlassian.hibernate.dialect.MySQLDialect
Database Driver Name: com.mysql.jdbc.Driver
Database Driver Version: 5.1
Database Name: MySQL
Database Version: 5.0.77
Database Transaction Isolation: Repeatable read Database Latency: 0
Memory Information

Total Memory: 254 MB
Used Memory: 240 MB
Free Memory: 13 MB
System Information

favouriteColour: Lemon chiffon
javaRuntime: Java(TM) SE Runtime Environment
jvmInputArgs: -Xms256m -Xmx512m -XX:MaxPermSize=256m -Djava.awt.headless=true -Djava.util.logging.manager=org.apache.juli.ClassLoaderLogManager -Djava.util.logging.config.file=/usr/share/confluence/conf/logging.properties -Djava.endorsed.dirs=/usr/share/confluence/endorsed -Dcatalina.base=/usr/share/confluence -Dcatalina.home=/usr/share/confluence -Djava.io.tmpdir=/usr/share/confluence/temp
operatingSystem: Linux 2.6.18.8-x86_64-linode10
jvmVersion: 1.0
fileSystemEncoding: UTF-8
javaVm: Java HotSpot(TM) Client VM
javaVendor: Sun Microsystems Inc.
jvmImplementationVersion: 14.3-b01
systemTimezone: Etc/UTC
appServer: Apache Tomcat
tempDirectory: /usr/share/confluence/temp
date: Thursday, 18 Aug 2011
time: 08:38:19
jvmVendor: Sun Microsystems Inc.
userName: root
javaVersion: 1.6.0_17
systemLanguage: en
operatingSystemArchitecture: i386
workingDirectory: /root
Cluster Information

Not clustered.
Plugins

AJAX PAGETREE
Atlassian UI Plugin
Blog Post Plugin
Blogging RPC Plugin
Builder Theme
Chart Plugin
Clikr Theme
Composition Plugin
Confluence Advanced Plugins
Confluence Attachment Extractors
Confluence Attachments Macro
Confluence Basic Macros
Confluence Code Macros
Confluence Dashboard Macros
Confluence HTML Macros
Confluence Inplace Editor
Confluence Information Macros
Confluence JIRA Macros
Confluence PDF Export
Confluence Remote API 
Confluence Repository Client
Confluence Tabular Metadata Plugin ? Atlassian
Confluence Thread Dump Plugin
Confluence Usage Tracking Plugin
Content Formatting Macros
Contributors Plugin 
Copy Space Plugin 
Dynamic Tasklist 2
Flexi Blog Posts Plugin
German language pack 
Graphviz Plugin 
IM Presence NG Plugin 
Intranet Theme Plugin
Layout Macros 
Left Navigation Theme
Livesearch Macro 
Mail Page Plugin 
Office Connector 
Page version link plugin 
RefinedWiki Original Theme 
Shared Application Access Layer API
Shared Application Access Layer Confluence Plugin
Social Bookmarking Plugin
Table of Contents Plugin
TechTime Blog Theme 
TinyMCE Editor Plugin
UWC Importer Admin Panel 
User Status
WebDAV Plugin
Widget Connector 




    * Ad hoc Workflows (com.comalatech.workflow, Version: 3.0.10)
    * Adaptavist Content Formatting Macros (com.adaptavist.confluence.contentFormattingMacros, Version: 1.6.13)
    * Add Content Menu Sections (confluence.menu.add, Version: 1.0)
    * Admin Sections (confluence.sections.admin, Version: 1.0)
    * Advanced Macros (confluence.macros.advanced, Version: 1.6.2.10)
    * Atlassian UI Plugin (com.atlassian.auiplugin, Version: 1.0.2)
    * Attachment Actions (confluence.sections.attachments, Version: 1.0)
    * Attachment Extractors (com.atlassian.confluence.plugins.attachmentExtractors, Version: 1.0-SNAPSHOT)
    * Basic Macros (confluence.macros.basic, Version: 1.4)
    * Blog posts plugin (com.locusglobal.confluence.blog-posts-plugin, Version: 1.0.0)
    * Browse Menu Items (confluence.sections.browse, Version: 1.0)
    * Chart Plugin (confluence.extra.chart, Version: 1.14)
    * Clickr Theme (com.atlassian.confluence.themes.clickr, Version: 2.6)
    * Code Macro (confluence.macros.code, Version: 1.5)
    * Comment Action Sections (confluence.comment.action, Version: 1.0)
    * Confluence Atlassian Plugin Repository (confluence.repository.client, Version: 2.1.4)
    * Confluence Attachments Plugin (confluence.extra.attachments, Version: 2.15)
    * Confluence Blogging RPC Plugin (com.atlassian.confluence.plugins.xmlrpc.bloggingrpc, Version: 1.2.4)
    * Confluence Contributors Plugin (com.atlassian.confluence.contributors, Version: 1.2.5)
    * Confluence HTML Macros (confluence.macros.html, Version: 1.9)
    * Confluence PDF Export (com.atlassian.confluence.extra.flyingpdf, Version: 1.2)
    * Confluence Remote API (confluence.extra.confluencerpc, Version: 3.0.2)
    * Confluence Thread Dump Plugin (com.atlassian.confluence.plugin.threaddump, Version: 1.2)
    * Content Action Menu Sections (confluence.content.action.menu, Version: 1.0)
    * Content Buttons (confluence.sections.page.temp, Version: 1.0)
    * Content Metadata (confluence.sections.content.metadata, Version: 1.0)
    * Copy Space Plugin (com.atlassian.confluence.plugin.copyspace, Version: 1.1)
    * Core Extractors (confluence.extractors.core, Version: 1.4)
    * Core Listeners (confluence.listeners.core, Version: 1.3)
    * Core Path Converters (confluence.converters.core, Version: 1.0)
    * Core Startup and Shutdown (confluence.lifecycle.core, Version: 1)
    * CustomWare Composition Plugin (net.customware.confluence.plugin.composition, Version: 2.3.5)
    * Dashboard Macros (confluence.macros.dashboard, Version: 1.13)
    * Default Theme (com.atlassian.confluence.themes.default, Version: 1.0)
    * Did You Mean Index Building Interface (confluence.sections.admin.indexing, Version: 1.0)
    * Dynamic Task List 2 Plugin (confluence.extra.dynamictasklist2, Version: 3.2.5)
    * Edit Settings Sections (confluence.sections.settings.edit, Version: 1.0)
    * Editor Actions (confluence.editor.actions, Version: 1.0)
    * EhCache Plugins (confluence.cache.ehcache, Version: 3.0)
    * Flexi Blog Posts (net.customware.confluence.plugin.flexi-blog-posts, Version: 1.2.3)
    * Follow list resources (confluence.sections.user.follow.list, Version: 1.0)
    * French language pack (confluence.languages.fr_FR, Version: 1.15)
    * German language pack (confluence.languages.de_DE, Version: 1.10)
    * Global Dashboard Actions (confluence.sections.dashboard.global, Version: 1.0)
    * Global Labels Sections (confluence.sections.labels, Version: 1.0)
    * Graphviz Plugin (com.atlassian.confluence.extra.graphviz, Version: 1.2.0)
    * IM Presence NG Plugin (confluence.extra.impresence2, Version: 2.5)
    * Information Macros (confluence.extra.information, Version: 1.2)
    * Intranet Theme Plugin (com.atlassian.confluence.themes.intranet, Version: 1.9.3)
    * JIRA Macros (confluence.extra.jira, Version: 2.8.18)
    * Layout Macros (confluence.extra.layout, Version: 1.3)
    * Left Navigation Theme (com.atlassian.confluence.themes.leftnavigation, Version: 2.8)
    * Live Search Macros (confluence.extra.livesearch, Version: 2.11)
    * Lucene Boosting Strategies (confluence.search.lucene.boosting, Version: 1.0)
    * News Tabs (confluence.sections.news, Version: 1.0)
    * Office Connector plugin (com.atlassian.confluence.extra.officeconnector, Version: 1.5)
    * Page Information Tools (com.adaptavist.confluence.pageinfo, Version: 1.3.3)
    * Page Operations (confluence.sections.page.operations, Version: 1.0)
    * Page Tabs (confluence.sections.page, Version: 1.0)
    * Page Tabs (confluence.search.mappers.lucene, Version: 1.0)
    * Page Tree (com.atlassian.confluence.plugins.pagetree, Version: 1.12)
    * Page View Links (confluence.sections.page.actions, Version: 1.0)
    * Profile Macros (confluence.macros.profile, Version: 1.0)
    * Profile Tabs (confluence.sections.profile, Version: 1.0)
    * RefinedWiki Original Theme (com.refinedwiki.confluence.plugins.theme.original, Version: 2.2.1)
    * Search Web Interface (confluence.sections.admin.generalconfig, Version: 1.0)
    * Search Web Interface (confluence.sections.search.view, Version: 1.0)
    * Shared Application Access Layer API (com.atlassian.sal.sal-api-2.0.3, Version: 2.0.3)
    * Shared Application Access Layer Confluence Plugin (com.atlassian.sal.confluence, Version: 2.0.3)
    * Social Bookmarking Plugin (com.atlassian.confluence.plugins.socialbookmarking, Version: 1.3.2)
    * Space Actions Sections (confluence.sections.space.actions, Version: 1.0)
    * Space Admin Sections (confluence.sections.space.admin, Version: 1.0)
    * Space Advanced Sections (confluence.sections.space.advanced, Version: 1.0)
    * Space Browse Sections (confluence.sections.space.browse, Version: 1.0)
    * Space Export Web Interface (confluence.sections.space.export.view, Version: 1.0)
    * Space Item Tabs (confluence.sections.space, Version: 1.0)
    * Space Labels Sections (confluence.sections.space.labels, Version: 1.0)
    * Space Pages Sections (confluence.sections.space.pages, Version: 1.0)
    * System Web Resources (confluence.web.resources, Version: 1.0)
    * Table of Contents Plugin (org.randombits.confluence.toc, Version: 2.4.10.1)
    * Tabular Metadata (confluence.extra.masterdetail, Version: 2.7)
    * TechTime Blog Theme (org.techtime.confluence.themes.blog, Version: 0.13.29)
    * TinyMCE Editor Plugin (com.atlassian.confluence.tinymceplugin, Version: 3.0.2)
    * UWC Importer Admin Panel (com.atlassian.confluence.plugins.uwc.uwcimporter-adminpanel, Version: 1.1)
    * User Administration (confluence.admin.user, Version: 1.0)
    * User Hover Menu Sections (confluence.user.hover.menu, Version: 1.0)
    * User Lister (confluence.extra.userlister, Version: 2.4.3)
    * User Menu Sections (confluence.user.menu, Version: 1.0)
    * User Menu Sections (confluence.user.menu.concise, Version: 1.0)
    * User Status (confluence.userstatus, Version: 1.0)
    * View Profile Web Interface (confluence.sections.profile.view, Version: 1.0)
    * View follow resources (confluence.sections.user.view.follow, Version: 1.0)
    * WebDAV Plugin (confluence.extra.webdav, Version: 2.3)
    * Widget Connector (com.atlassian.confluence.extra.widgetconnector, Version: 1.2.3)
    * Wiki Renderer Components (confluence.renderer.components, Version: 1.0)

Request
Information

URL
    http://www.stuartpyoung.com/confluence/500page.jsp 
URI
    /confluence/500page.jsp 
Context Path
    /confluence
Servlet Path
    /500page.jsp
 
</entry>
<entry [Wed 2011:08:17 08:19:05 EST] FIXED ERROR ON RESTART AFTER UPDATING MODULES>

http://confluence.atlassian.com/pages/viewpage.action?pageId=227409987

PROBLEM: WON'T START

em /usr/share/confluence/logs/catalina.2011-08-17.log

    Aug 17, 2011 11:41:37 AM org.apache.coyote.http11.Http11Protocol pause
    INFO: Pausing Coyote HTTP/1.1 on http-8080
    Aug 17, 2011 11:41:37 AM org.apache.coyote.http11.Http11Protocol init
    SEVERE: Error initializing endpoint
    java.net.BindException: Address already in use:8080
            at org.apache.tomcat.util.net.JIoEndpoint.init(JIoEndpoint.java:501)
            at org.apache.coyote.http11.Http11Protocol.init(Http11Protocol.java:177)
            at org.apache.catalina.connector.Connector.initialize(Connector.java:1059)
            at org.apache.catalina.core.StandardService.initialize(StandardService.java:677)
            at org.apache.catalina.core.StandardServer.initialize(StandardServer.java:792)
            at org.apache.catalina.startup.Catalina.load(Catalina.java:518)
            at org.apache.catalina.startup.Catalina.load(Catalina.java:538)
            at sun.reflect.NativeMethodAccessorImpl.invoke0(Native Method)
            at sun.reflect.NativeMethodAccessorImpl.invoke(Unknown Source)
            at sun.reflect.DelegatingMethodAccessorImpl.invoke(Unknown Source)
            at java.lang.reflect.Method.invoke(Unknown Source)
            at org.apache.catalina.startup.Bootstrap.load(Bootstrap.java:260)
            at org.apache.catalina.startup.Bootstrap.main(Bootstrap.java:412)
    Aug 17, 2011 11:41:37 AM org.apache.catalina.startup.Catalina load


DIAGNOSIS: DID ps aux AND SAW THAT TWO confluence PROCESSES WERE RUNNING

SOLUTION: KILLED BOTH PROCESSES AND RESTARTED CONFLUENCE

    OK!



</entry>
<entry [Fri Nov 12 16:13:59 EST 2010] ADDED CSS TO Notes SPACE TO REMOVE SPACE AT TOP OF PAGE>

#main_wrapper {
margin-left: 2px !important;
}

#top_menu li a {
/* font-size: 12px !important; */
font-weight: bolder !important;
color: #000000 !important;
}

#quick-search-query {
position: absolute !important;
top:45px !important;
left: 20px !important;
background: #FFFFFF !important;
height: 30px !important;
}

#top {
height: 0px !important;
}

#top_logo_wrapper {
height: 0px !important;
}

</entry>
<entry [Thurs Nov 11 22:57:42 UTC 2010] BLOG POSTS MACRO>


http://www.stuartpyoung.com/confluence/admin/plugin-repository/plugins.action

Blog Posts Macro

DOES EXACTLY WHAT I WAS LOOKING FOR - USE CONFLUENCE AS A BLOG WITHIN A FLEXIBLE PAGE STRUCTURE

HOW TO USE:

1. CREATE A BLOG PAGE (INHERITS NEWS ITEM)

2. ADD LABEL newTopic

3. CREATE PAGE AND ADD



SEPARATED UP PAGE





</entry>
<entry [Tue Oct 12 14:57:42 UTC 2010] FULL360.COM CSS TERMINAL THEME FOR pre TAG>

/* http://longren.org/2006/09/27/wrapping-text-inside-pre-tags */

pre {
    /*  float: left; */
    width: 540px;
    padding: 0 0 0 5px; 
    color: #44FF00;
    background: #222;
    overflow: auto;
    font: normal 12px "bitstream vera sans mono", monaco "lucida console", "courier new", courier, serif;
    margin: 0.9em 0; padding: 8px;
}

pre {
    white-space: pre-wrap;
    white-space: -moz-pre-wrap !important;
    white-space: -pre-wrap;
    white-space: -o-pre-wrap;
    word-wrap: break-word;
}

pre a:hover {
    background: #FFC;
}
pre a:hover {
    background: #ABD86E;
}
pre a {
    color: #C94B00 !important ;
    outline-style: none;
    outline-width: medium;
    text-decoration: none;
}


</entry>
<entry [Fri Oct 08 16:58:02 EDT 2010] REMOVED CSS FROM Agua>

Space Admin --> Stylesheet


/* CENTER ROWS IN TABLES */
td.confluenceTd, table.confluenceTable td.confluenceTd {
    vertical-align: middle;
}

/* CENTER PAGE TITLE */
.pagetitle {
    text-align: center;
}


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



<entry [Thurs Oct 07 16:58:02 EDT 2010] REMOVED SearchNavigation AND TreeNavigation PAGES (NOW REDUNDANT AFTER INSTALL OF REFINEDWIKI)>




SearchNavigation
{livesearch:spaceKey=Agua}


TreeNavigation
{pagetree:root=Home|sort=position|excerpt=true|reverse=false|startDepth=3|expandCollapseAll=true|searchBox=true}


</entry>



<entry [Thurs Oct 07 16:58:02 EDT 2010] GOT FREE REFINEDWIKI LICENSE>


1. INSTALL PLUGIN THROUGH PLUGINS REPOSITORY

2. LOGIN TO www.refinedwiki.com AND GET LICENSE

GET SERVER ID

Go to Confluence administration page --> Select Theme license --> COPY SERVER ID

SERVER ID:
BFE9-Z3V6-PKYR-P33M


PASTE IN PAGE HERE:

http://refinedwiki.com/en/MyPage/Licenses.aspx


LICENSE

368036b67b27d6f9e27ceefca67bbc5830f9cf5a9a7333d10e825e37440b6ea535bb0c2304186e1c2b49a56beb3fa3f43987328e26e1b872a98297636281ba021011081c


COMES WITH SUPPORT AND UPGRADES UNTIL 2011-10-08



</entry>
<entry [Thurs Oct 07 15:58:02 EDT 2010] CONFLUENCE COMPLAINS ABOUT SERVER BASE URL NOT BEING CORRECT AFTER SETTING PROXY TO www.stuartpyoung.com/confluence>



http://www.stuartpyoung.com/confluence/admin/editgeneralconfig.action?autofocus=editbaseurl

Site Configuration
Configure the appearance and behaviour of the site as a whole. The most important is the Server Base URL, which must be set to the externally-accessible address of your Confluence site.

http://74.207.235.81:8080


SO SET TO

www.stuartpyoung.com/confluence



</entry>
<entry [Thurs Oct 07 15:58:02 EDT 2010] USE www.stuartpyoung.com/confluence INSTEAD OF www.stuartpyoung.com:8080>




http://confluence.atlassian.com/display/DOC/Using+Apache+with+mod_proxy#UsingApachewithmod_proxy-Summary


1. MODIFIED /etc/httpd/conf/httpd.conf

(HAVE TO HAVE THESE BUT DIDN'T CHANGE ANYTHING AS THEY WERE THERE ALREADY )
LoadModule proxy_module modules/mod_proxy.so
LoadModule proxy_http_module modules/mod_proxy_http.so

AND

# Put this in the main section of your configuration (or desired virtual host, if using Apache virtual hosts)
ProxyRequests Off
ProxyPreserveHost On

<Proxy *>
    Order deny,allow
    Allow from all
</Proxy>

ProxyPass /confluence http://localhost:8080/confluence
ProxyPassReverse /confluence http://localhost:8080/confluence
<Location /confluence>
    Order allow,deny
    Allow from all
</Location>


2. MODIFIED /usr/share/confluence-3.0.2-std/conf/server.xml  


ADDED 

proxyName="www.stuartpyoung.com" proxyPort="80"

AND

<Context path="/confluence" docBase="../confluence" debug="0" reloadable="true">


cat /usr/share/confluence-3.0.2-std/conf/server.xml  


    <Server port="8000" shutdown="SHUTDOWN" debug="0">
        <Service name="Tomcat-Standalone">
            <Connector className="org.apache.coyote.tomcat4.CoyoteConnector" port="8080" minProcessors="5"
                       maxProcessors="75"
                       enableLookups="false" redirectPort="8443" acceptCount="10" debug="0" connectionTimeout="20000"
                       useURIValidationHack="false" URIEncoding="UTF-8"
                       proxyName="www.stuartpyoung.com" proxyPort="80"
    />
    
            <Engine name="Standalone" defaultHost="localhost" debug="0">
    
                <Host name="localhost" debug="0" appBase="webapps" unpackWARs="true" autoDeploy="false">
    
    
                     <Context path="/confluence" docBase="../confluence" debug="0" reloadable="true">
    
    
                     <Alias>confluence.stuartpyoung.com</Alias>
    
                  <Resource name="mail/Session"
                        auth="Container"
                        type="javax.mail.Session"
                        mail.smtp.host="smtp.gmail.com"
                        mail.smtp.port="465"
                        mail.smtp.auth="true"
                        mail.smtp.user="stuartpyoung@gmail.com"
                        password="jabberwock"
                        mail.smtp.starttls.enable="true"
                        mail.smtp.socketFactory.class="javax.net.ssl.SSLSocketFactory"
                  />
    
                        <Manager pathname="" />
                    </Context>
                </Host>
    
            </Engine>
    
            <!--
                To run Confluence via HTTPS:
                 * Uncomment the Connector below
                 * Execute:
                     %JAVA_HOME%\bin\keytool -genkey -alias tomcat -keyalg RSA (Windows)
                     $JAVA_HOME/bin/keytool -genkey -alias tomcat -keyalg RSA  (Unix)
                   with a password value of "changeit" for both the certificate and the keystore itself.
                 * Restart and visit https://localhost:8443/
    
                 For more info, see http://confluence.atlassian.com/display/DOC/Adding+SSL+for+Secure+Logins+and+Page+Security
            -->
    <!--
            <Connector port="8443" maxHttpHeaderSize="8192"
                       maxThreads="150" minSpareThreads="25" maxSpareThreads="75"
                       enableLookups="false" disableUploadTimeout="true"
                       acceptCount="100" scheme="https" secure="true"
                       clientAuth="false" sslProtocol="TLS" SSLEnabled="true"
                       URIEncoding="UTF-8" keystorePass="<MY_CERTIFICATE_PASSWORD>"/>
    -->
        </Service>
    </Server>



3. RESTARTED APACHE AND CONFLUENCE

/usr/sbin/apachectl -k restart

export JRE_HOME=/root/base/apps/java/jre1.6.0_17
export JAVA_HOME=/root/base/apps/java/jdk1.6.0_17

/usr/share/confluence/bin/shutdown.sh
/usr/share/confluence/bin/startup.sh





NOTES
-----

Simple configuration
Set the context path
First, set your Confluence application path (the part after hostname and port) correctly. Say you want Confluence available at http://www.example.com/confluence/, and you currently have it running at http://localhost:8080/. The first step is to get Confluence available at http://localhost:8080/confluence/.

To do this in Tomcat (bundled with Confluence), edit conf/server.xml, locate the "Context" definition:

<Context path="" docBase="../confluence" debug="0" reloadable="true">
and change it to:

<Context path="/confluence" docBase="../confluence" debug="0" reloadable="true">
Then restart Confluence, and ensure you can access it at http://localhost:8080/confluence/

Configure mod_proxy
Now enable mod_proxy in Apache, and proxy requests to the application server by adding the example below to your Apache httpd.conf (note: the files may be different on your system; the JIRA docs describe the process for Ubuntu/Debian layout):

# Put this after the other LoadModule directives
LoadModule proxy_module /usr/lib/apache2/modules/mod_proxy.so
LoadModule proxy_http_module /usr/lib/apache2/modules/mod_proxy_http.so

# Put this in the main section of your configuration (or desired virtual host, if using Apache virtual hosts)
ProxyRequests Off
ProxyPreserveHost On

<Proxy *>
    Order deny,allow
    Allow from all
</Proxy>

ProxyPass /confluence http://localhost:8080/confluence
ProxyPassReverse /confluence http://localhost:8080/confluence
<Location /confluence>
    Order allow,deny
    Allow from all
</Location>
  Note to Windows Users
Set the URL for redirection
You will need to modify the server.xml file in your tomcat's conf directory and set the URL for redirection.

Locate this code segment

    <Connector port="8080" maxHttpHeaderSize="8192"
               maxThreads="150" minSpareThreads="25" maxSpareThreads="75"
               enableLookups="false" redirectPort="8443" acceptCount="100"
               connectionTimeout="20000" disableUploadTimeout="true" />
And append the following segment:

    <Connector port="8080" maxHttpHeaderSize="8192"
               maxThreads="150" minSpareThreads="25" maxSpareThreads="75"
               enableLookups="false" redirectPort="8443" acceptCount="100"
               connectionTimeout="20000" disableUploadTimeout="true"
               proxyName="www.example.com" proxyPort="80"/>
Replace www.example.com with the URL you wish to be redirected to


emacs /usr/share/confluence-3.0.2-std/conf/server.xml


SET SE Linux BOOLEAN
http://wiki.apache.org/httpd/13PermissionDenied

setsebool -P httpd_can_network_connect 1

(13)Permission denied: proxy: HTTP: attempt to connect to 127.0.0.1:8080 (localhost) failed

This error is not really about file permissions or anything like that. What it actually means is that httpd has been denied permission to connect to that IP address and port.

The most common cause of this is due to SELinux not permitting httpd to make network connections.

To resolve it, you need to change an SELinux boolean value (which will automatically persist across reboots). You may also want to restart httpd to reset the proxy worker status, although this isn't strictly required.


# setsebool -P httpd_can_network_connect 1
For more information on how SELinux can affect httpd, read the httpd_selinux man page



USE NETSTAT -na TO CHECK IF LISTENING ON PORT 8080

http://stackoverflow.com/questions/332651/forwarding-only-on-a-single-port-8080-to-localhost-windows-possible

Can you confirm if 8080 port is listening on webserver? use the command "netstat -na" to see if the port 8080 is listening.

Did you add 8080 port on apache config file as the same as the default 80 port?

Once you add port 8080 on apache config file to make it listen and double check if 8080 port is listening on webserver, then you will be able to access the page using port 8080. like http://mytestwebserver:8080/index.html or something like this....




RewriteEngine On
RewriteRule ^/tomcat/(.*) http://server:8080/$1





Make sure you have mod_proxy_html

These are the lines we added to our httpd.conf:

LoadModule headers_module modules/mod_headers.so
LoadModule proxy_module modules/mod_proxy.so
LoadModule proxy_http_module modules/mod_proxy_http.so

LoadModule proxy_html_module modules/mod_proxy_html/mod_proxy_html.so
Include modules/mod_proxy_html/proxy_html.conf

ProxyRequests Off
ProxyPreserveHost Off

<Proxy *>
   Order deny,allow
   Allow from all
</Proxy>
This is our VirtualHost:

<VirtualHost *:80>
    ServerName confluence
    
    # Make sure the requests are redirected
    ProxyPass / http://localhost:8080/confluence-2.7/
    ProxyPassReverse / http://localhost:8080/confluence-2.7/

    # Make sure all cookies are configured correctly
    ProxyPassReverseCookiePath /confluence-2.7 / 

    # Make sure the links in the html are corrected
    SetOutputFilter  proxy-html
    ProxyHTMLURLMap /confluence-2.7/ /
    
    ErrorLog "logs/confluence.log"
    CustomLog "logs/confluence-access.log" common
</VirtualHost>




ADD LOGS:

ErrorLog "logs/confluence.log"
CustomLog "logs/confluence-access.log" common
    
    
ADD TO <Location> SECTION IN httpd.conf

<Location /buggyappserver/>
ProxyPass http://buggyappserver:7001/foo/
SetEnv force-proxy-request-1.0 1
SetEnv proxy-nokeepalive 1
</Location>




MODIFIABLE ERROR PAGES
----------------------


On the confluence General Admin page, I changed the Server Base URL from http://localhost:8080/ to the public name of my site, since I found that sometimes localhost URLs were leaking out. I also modified the Confluence 404 page (edit the confluence/WEB-INF/classes/com/atlassian/confluence/core/ConfluenceActionSupport.properties) and customised the Apache vhost 404 error page (via the HTTP_NOT_FOUND.html.var file).

I hope this helps someone else.






Using Apache with virtual hosts and mod_proxy
http://confluence.atlassian.com/display/DOC/Using+Apache+with+virtual+hosts+and+mod_proxy


Added by Matt Ryall (Atlassian), last edited by Jean Fabricius Bondan [Atlassian] on May 11, 2010  (view change)


The Apache web server is often used in front of an application server to improve performance in high-load environments. Mod_proxy simply redirects requests for certain URLs to another web server, so it typically requires no additional configuration on the application server.

This page documents a very common configuration request: configuring JIRA and Confluence on two Apache virtual hosts, running on different application servers. This is just a special case of mod_proxy configuration.

You can use virtual hosts in your application server if you want to run JIRA and Confluence on the same application server. There is a sample configuration for Tomcat you can use after configuring Apache.

Apache configuration

For this configuration to work properly, the application paths must be the same on both the application servers and the web server. For both JIRA and Confluence below, this is /.


JIRA external URL	http://jira.example.com/
JIRA application server URL	http://jira-app-server.internal.example.com:8080/
Confluence external URL	http://confluence.example.com/
Confluence application server URL	http://confluence-app-server.internal.example.com:8080/




1. EDIT httpd.conf TO ADD VIRTUAL HOST INFO
 
 
emacs /etc/httpd/conf/httpd.conf

export JRE_HOME=/root/base/apps/java/jre1.6.0_17; \
export JAVA_HOME=/root/base/apps/java/jdk1.6.0_17; \
/usr/share/confluence/bin/shutdown.sh ; \
/usr/share/confluence/bin/startup.sh


Add the following to your Apache httpd.conf. Put this after the other LoadModule directives:

LoadModule proxy_module /usr/lib/apache2/modules/mod_proxy.so
LoadModule proxy_http_module /usr/lib/apache2/modules/mod_proxy_http.so



**** NB: NOT NEEDED AS WERE ALREADY PRESENT:

	LoadModule proxy_module modules/mod_proxy.so
	LoadModule proxy_balancer_module modules/mod_proxy_balancer.so
	LoadModule proxy_ftp_module modules/mod_proxy_ftp.so
	LoadModule proxy_http_module modules/mod_proxy_http.so



**** NB: ACTUAL LOCATIONS ARE IN lib64 DIR

/usr/lib64/httpd/modules/mod_proxy.so
/usr/lib64/httpd/modules/mod_proxy_balancer.so
/usr/lib64/httpd/modules/mod_proxy_http.so
/usr/lib64/httpd/modules/mod_proxy_ftp.so


**** SO THE ACTUAL FILE ENTRIES SHOULD BE:

LoadModule proxy_module /usr/lib64/httpd/modules/mod_proxy.so
LoadModule proxy_balancer_module /usr/lib64/httpd/modules/mod_proxy_balancer.so
LoadModule proxy_ftp_module /usr/lib64/httpd/modules/mod_proxy_ftp.so
LoadModule proxy_http_module /usr/lib64/httpd/modules/mod_proxy_http.so



AND ADDED THIS TO THE BOTTOM OF THE FILE:


NameVirtualHost *
<VirtualHost *>
    ServerName confluence.stuartpyoung.com

    ProxyRequests Off
        ProxyPreserveHost On

    <Proxy *>
        Order deny,allow
        Allow from all
    </Proxy>

    ProxyPass / http://localhost:8080/
    ProxyPassReverse / http://localhost:8080/
    <Location />
       Order allow,deny
        Allow from all
    </Location>
</VirtualHost>



####NameVirtualHost *
####<VirtualHost *>
####    ServerName confluence.stuartpyoung.com
####
####    ProxyRequests Off
####        ProxyPreserveHost On
####
####    <Proxy *>
####        Order deny,allow
####        Allow from all
####    </Proxy>
####
####    ProxyPass / http://127.0.0.1:8080/
####    ProxyPassReverse / http://127.0.0.1:8080/
####    <Location />
####       Order allow,deny
####        Allow from all
####    </Location>
####</VirtualHost>
####



##### Put this with your other VirtualHosts, or at the bottom of the file
####
####
####NameVirtualHost *
####<VirtualHost *>
####    ServerName confluence.stuartpyoung.com
####
####    ProxyRequests Off
####	ProxyPreserveHost On
####
####    <Proxy *>
####        Order deny,allow
####        Allow from all
####    </Proxy>
####
####    ProxyPass / http://www.stuartpyoung.com:8080/
####    ProxyPassReverse / http://www.stuartpyoung:8080/
####    <Location />
####        Order allow,deny
####        Allow from all
####    </Location>
####</VirtualHost>



2. MODIFY server.xml

emacs /usr/share/confluence-3.0.2-std/conf/server.xml

export JRE_HOME=/root/base/apps/java/jre1.6.0_17; \
export JAVA_HOME=/root/base/apps/java/jdk1.6.0_17; \
/usr/share/confluence/bin/shutdown.sh; \
/usr/share/confluence/bin/startup.sh


REPLACED

    <Context path="" docBase="../confluence" debug="0" reloadable="false">

WITH

    <Context path="/confluence" docBase="../confluence" debug="0" reloadable="true">


SO IT NOW READS:


<Server port="8000" shutdown="SHUTDOWN" debug="0">
    <Service name="Tomcat-Standalone">
        <Connector className="org.apache.coyote.tomcat4.CoyoteConnector" port="8080" minProcessors="5"
                   maxProcessors="75"
                   enableLookups="false" redirectPort="8443" acceptCount="10" debug="0" connectionTimeout="20000"
                   useURIValidationHack="false" URIEncoding="UTF-8"/>

        <Engine name="Standalone" defaultHost="localhost" debug="0">

            <Host name="localhost" debug="0" appBase="webapps" unpackWARs="true" autoDeploy="false">

<!--                <Context path="" docBase="../confluence" debug="0" reloadable="false">
-->

                 <Context path="/confluence" docBase="../confluence" debug="0" reloadable="true">


              <Resource name="mail/Session"
                    auth="Container"
                    type="javax.mail.Session"
                    mail.smtp.host="smtp.gmail.com"
                    mail.smtp.port="465"
                    mail.smtp.auth="true"
                    mail.smtp.user="stuartpyoung@gmail.com"
                    password="jabberwock"
                    mail.smtp.starttls.enable="true"
                    mail.smtp.socketFactory.class="javax.net.ssl.SSLSocketFactory"
              />


                    <!-- Logger is deprecated in Tomcat 5.5. Logging configuration for Confluence is specified in confluence/WEB-INF/classes/log4j.properti\
es -->
                    <Manager pathname="" />
                </Context>
            </Host>

        </Engine>

        <!--
            To run Confluence via HTTPS:
             * Uncomment the Connector below
             * Execute:
                 %JAVA_HOME%\bin\keytool -genkey -alias tomcat -keyalg RSA (Windows)
                 $JAVA_HOME/bin/keytool -genkey -alias tomcat -keyalg RSA  (Unix)
               with a password value of "changeit" for both the certificate and the keystore itself.
             * Restart and visit https://localhost:8443/

             For more info, see http://confluence.atlassian.com/display/DOC/Adding+SSL+for+Secure+Logins+and+Page+Security
        -->
<!--
        <Connector port="8443" maxHttpHeaderSize="8192"
                   maxThreads="150" minSpareThreads="25" maxSpareThreads="75"
                   enableLookups="false" disableUploadTimeout="true"
                   acceptCount="100" scheme="https" secure="true"
                   clientAuth="false" sslProtocol="TLS" SSLEnabled="true"
                   URIEncoding="UTF-8" keystorePass="<MY_CERTIFICATE_PASSWORD>"/>
-->
    </Service>
</Server>




THE PROXY WORKS IN THAT www.stuartpyoung.com/confluence CONNECTS TO CONFLUENCE BUT www.stuartpyoung.com HAS STOPPED WORKING.

THE APACHE ERROR LOG SHOWS:

tail -f -n 30 /var/log/httpd/error_log 

    [Wed Oct 06 22:43:53 2010] [error] (111)Connection refused: proxy: HTTP: attempt to connect to 127.0.0.1:8080 (localhost) failed
    [Wed Oct 06 22:43:53 2010] [error] ap_proxy_connect_backend disabling worker for (localhost)
    [Wed Oct 06 22:43:54 2010] [error] proxy: HTTP: disabled connection for (localhost)
    [Wed Oct 06 22:44:00 2010] [error] proxy: HTTP: disabled connection for (localhost)
    [Wed Oct 06 22:44:00 2010] [error] proxy: HTTP: disabled connection for (localhost)
    [Wed Oct 06 22:44:03 2010] [error] proxy: HTTP: disabled connection for (localhost)
    [Wed Oct 06 22:44:03 2010] [error] proxy: HTTP: disabled connection for (localhost)
    [Wed Oct 06 22:44:04 2010] [error] proxy: HTTP: disabled connection for (localhost)
    [Wed Oct 06 22:44:04 2010] [error] proxy: HTTP: disabled connection for (localhost)
    [Wed Oct 06 22:44:10 2010] [error] proxy: HTTP: disabled connection for (localhost)
    [Wed Oct 06 22:44:10 2010] [error] proxy: HTTP: disabled connection for (localhost)
    [Wed Oct 06 22:44:16 2010] [error] proxy: HTTP: disabled connection for (localhost)
    [Wed Oct 06 22:44:16 2010] [error] proxy: HTTP: disabled connection for (localhost)
    [Wed Oct 06 22:44:22 2010] [error] proxy: HTTP: disabled connection for (localhost)
    [Wed Oct 06 22:44:22 2010] [error] proxy: HTTP: disabled connection for (localhost)
    [Wed Oct 06 22:45:16 2010] [error] (111)Connection refused: proxy: HTTP: attempt to connect to 127.0.0.1:8080 (localhost) failed
    [Wed Oct 06 22:45:16 2010] [error] ap_proxy_connect_backend disabling worker for (localhost)





###http://www.scalix.com/forums/viewtopic.php?f=2&t=10869&start=0
###okay after searching a bit further here is my first solution that at least opens the 8080 port a gives me acces to the caldav URL: 
###
###Open the file /var/opt/scalix/<sx>/tomcat/conf/server.xml and uncomment the section for the 8080 ( around line 100 in my config ). 
###As I changed a automatically generated file when will this file be overriden, for example by the template in /etc/opt/scalix-tomcat/conf/server.xml.in? 
###And as I'm already asking questions here are some erroras that appear in the logs that I don't like: 
###


##SE LINUX PROBLEM
##http://www.dharwadkar.com/weblog/apache_fc6_01



WITH PROXY ENTRY ADDED TO httpd.conf AND CONTEXT LINE ADDED TO server.xml, www.stuartpyoung.com GIVES THIS:

    [Thu Oct 07 01:29:58 2010] [error] (111)Connection refused: proxy: HTTP: attempt to connect to 127.0.0.1:8080 (localhost) failed
    [Thu Oct 07 01:29:58 2010] [error] ap_proxy_connect_backend disabling worker for (localhost)
    [Thu Oct 07 01:29:58 2010] [error] proxy: HTTP: disabled connection for (localhost)
    
    
    [Thu Oct 07 01:30:28 2010] [error] proxy: HTTP: disabled connection for (localhost)
    [Thu Oct 07 01:30:28 2010] [error] proxy: HTTP: disabled connection for (localhost)





ADD THE NEW DOMAIN TO /etc/hosts


# Do not remove the following line, or various programs
# that require network functionality will fail.
127.0.0.1               localhost.localdomain localhost
::1             localhost6.localdomain6 localhost6





3. RESTART APACHE AND CONFLUENCE


RESTART APACHE

/usr/sbin/apachectl -k restart



RESTART CONFLUENCE

export JRE_HOME=/root/base/apps/java/jre1.6.0_17
export JAVA_HOME=/root/base/apps/java/jdk1.6.0_17

/usr/share/confluence/bin/shutdown.sh
/usr/share/confluence/bin/startup.sh


<!--

	NameVirtualHost *

	<VirtualHost *>

		ServerName confluence.example.com

	

		ProxyRequests Off

		<Proxy *>

			Order deny,allow

			Allow from all

		</Proxy>

	

		ProxyPass / http://confluence-app-server.internal.example.com:8080/

		ProxyPassReverse / http://confluence-app-server.internal.example.com:8080/

		<Location />

			Order allow,deny

			Allow from all

		</Location>

	</VirtualHost>

	<VirtualHost *>

		ServerName jira.example.com

	

		ProxyRequests Off

		<Proxy *>

			Order deny,allow

			Allow from all

		</Proxy>

	

		ProxyPass / http://jira-app-server.internal.example.com:8080/

		ProxyPassReverse / http://jira-app-server.internal.example.com:8080/

		<Location />

			Order allow,deny

			Allow from all

		</Location>

	</VirtualHost>

-->

Points to note:

1. ProxyPass and ProxyPassReverse directives send traffic from the web server to your application server.

2. The application path is the same on the application server and on the web server (both are /).

3. Because the above configuration uses name-based virtual hosting, you must configure your DNS server to point both names (jira.example.com, confluence.example.com) to your web server.


More information

For different ways to configure mod_proxy, see Using Apache with mod_proxy.




</entry>



