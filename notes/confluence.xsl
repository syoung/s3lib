confluence





<entry [Fri 2015:03:06 12:47:18 EST] TEST-BASED DEVELOPMENT JIRA PLUGINS>

https://answers.atlassian.com/questions/50645/zephyr-enterprise-tester-synapsert-user-experiences


If you just need a test case management solution for Jira, then Zephyr should suit your needs.
If you want requirements traceability in addition to test case management then SynapseRT may be a better fit.


synapseRT
---------

https://marketplace.atlassian.com/plugins/com.go2group.jira.plugin.synapse

Apr 10, 2013
We have used SynapseRT for a couple of months. It runs inside of JIRA, but is missing functionality that is fundamental to test management. For example, there's no way to create a test case with discreet steps, with each step having a desc, expected result and actual result. We're hoping for improvements in the near future.


Zephyr
------

Matthew BakerApr 10, 2013
I have no direct experience with either SynapseRT or Enterprise Tester, but we evaluated Zephyr on my last project and we had a pretty good experience with it. There were some things I felt it could do better, but they were mostly just productivity improvements. If you need to maintain a base of manual tests, or instructions on how to run semi-automated tests, it will definitely work for you. Use something like Bonfire or Jing to capture your exploratory testing runs, then play them back and document them in a tool like this to capture the essence of what you want to be able to verify in the future.

This as opposed to something like SynapseRT which tries to be both Requirements management/traceability and test case management.

Behave
------

https://marketplace.atlassian.com/plugins/com.hindsighttesting.behave.jira

Run Cucumber tests in JIRA


Cucumber Report
---------------

https://marketplace.atlassian.com/plugins/com.hindsighttesting.behave.cucumber-bamboo-plugin

Report Cucumber tests in Bamboo




</entry>
<entry [Thu 2015:03:05 10:40:07 EST] REPLACE LATER REMOVED 'Latest News' SECTION ON AGUA HOME PAGE>

Latest News

Blog Post MACRO
content = titles
timeframe= 100d
restrict to these authors: Stuart Young

	
</entry>
<entry [Fri 2014:10:31 01:43:05 EST] CUJO WEBSITE - GOOD EXAMPLE>


http://cujojs.com/

	
</entry>
<entry [Sat 2014:10:25 10:36:04 EST] FIXED AGUA 2.0 CSS - SET LEFT NAVBAR WIDTH>

ADDED TO custom.css

/* SET WIDTH OF LEFT NAVIGATION BAR */
#content-column-11 {
    width: 300px !important;
}

    
</entry>
<entry [Sat 2014:09:27 23:52:58 EST] AGUA 2.0 Custom Workflows>

1. CREATE APPS


Aspera
------

<!--

app create --name Aspera --param uuid --description "Download a file using Aspera (e.g., from the SRA)"

    ---
    description: 'Download a file using Aspera (e.g., from the SRA)'
    name: Aspera
    parameters: []

app addParam --appfile ./Aspera.app --param uuid --value SRA645668 --ordinal 1

    ---
    description: 'Download a file using Aspera (e.g., from the SRA)'
    name: Aspera
    parameters:
      -
        ordinal: '1'
        param: uuid
        value: SRA645668

app addParam --appfile ./Aspera.app --param outputdir --value /tmp --ordinal 2

-->

SraToBam
--------

<!--


rm -fr SraToBam.app; /a/bin/cli/app create --name SraToBam --param uuid --description "Download a file using Aspera (e.g., from the SRA)" --notes "Uses biobambam's fastqtobam" --owner admin --type converter; /a/bin/cli/app addParam --appfile ./SraToBam.app --param inputfile --argument '--inputfile' --description 'Input SRA file location' --value '/data/sra/aspera/<SAMPLE>/<SAMPLE>.sra'; reset;

/a/bin/cli/app addParam --appfile ./SraToBam.app --param outputfile --argument '--outputfile' --description 'Output BAM file location' --value '/data/sra/aspera/<SAMPLE>/<SAMPLE>.bam' --log 4


mkdir -p /home/syoung/flow
cd /home/syoung/flow

app create \
--name SraToBam \
--param uuid \
--description "Download a file using Aspera (e.g., from the SRA)" \
--notes "Uses biobambam's fastqtobam" \
--owner admin \
--type converter

app addParam \
--appfile ./SraToBam.app \
--param inputfile \
--argument '--inputfile' \
--description 'Input SRA file location' \
--value '/data/sra/aspera/<SAMPLE>/<SAMPLE>.sra'

app addParam \
--appfile ./SraToBam.app \
--param outputfile \
--argument '--outputfile' \
--description 'Output BAM file location' \
--value '/data/sra/aspera/<SAMPLE>/<SAMPLE>.bam'


app addParam \
--appfile ./SraToBam.app \
--argument '--reference' \
--description 'Reference sequence file location' \
--param reference \
--paramtype input \
--value /data/reference/genome.fa


    ---
    description: 'Download a file using Aspera (e.g., from the SRA)'
    name: SraToBam
    notes: "Uses biobambam's fastqtobam"
    owner: admin
    parameters:
      -
        argument: --inputfile
        description: 'Input SRA file location'
        param: inputfile
        value: /data/sra/aspera/<SAMPLE>/<SAMPLE>.sra
      -
        argument: --outputfile
        description: 'Output BAM file location'
        param: outputfile
        value: /data/sra/aspera/<SAMPLE>/<SAMPLE>.bam
      -
        argument: --reference
        description: 'Reference sequence file location'
        param: reference
        paramtype: input
        value: /data/reference/genome.fa
    type: converter


-->


2. ADD APPS TO WORKFLOW

work create --name GetBam --description "Download an SRA file and convert it to a BAM file"

work addApp --wkfile GetBam.work --appfile Aspera.app 
work addApp --wkfile GetBam.work --appfile SraToBam.app


3. UPLOAD WORKFLOW FILE TO PAGE

flow addWorkflow --project LoadSra --wkfile 1-LoadSamples.work --username admin
flow runWorkflow --project LoadSra --workflow LoadSamples


work create --workflow Download
work addApp --wkfile ./Download.work --appfile ./Aspera.app 




work deleteApp --wkfile ./Download.work --app Aspera --log 4


work desc --workflow Download
work desc --workflow Download --log 4



mq -NBe "select * from workflow"



    
</entry>
<entry [Mon 2014:09:22 17:02:11 EST] ATTEMPTED TO IMPORT API FILES TO AGUA 2.0>

*** DID NOT USE THIS ****

1. CREATE DOCS FILES

/a/bin/scripts/doc.pl --inputdir /a/bin --output /a/docs/bin


2. ZIP UP

cd /a/docs
tar cvfz bin.tar.gz bin


3. UPLOAD TO digi02

scp bin.tar.gz vesi@192.241.223.100:/a/docs


4. IMPORT FILES

Space Tools --> Content Tools --> Import

X   -   REMOVE SUFFIX
X   -   OVERWRITE EXISTING


5. BUT DISCOVERED THAT IMPORT NOW DOES NOT ACCEPT MARKUP

*** SO DID NOT USE THIS ****

    
</entry>
<entry [Fri 2014:09:19 23:35:37 EST] NEEDED OPEN-SOURCE LICENCES>

Bob Swift Atlassian Add-ons - HTML


</entry>
<entry [Fri 2014:09:19 14:48:55 EST] HOW TO MOVE aguadev.org FROM linode TO digi02>

SEE domain.xsl
[Fri 2014:09:19 01:49:25 EST] HOW TO CHANGE aguadev.com TO digi02

    
</entry>
<entry [Thu 2014:09:18 19:52:02 EST] LINK JIRA TO CONFLUENCE TO ENABLE HELPDESK SEARCH OF KNOWLEDGE BASE>

1. CREATE LINK IN HELPLDESK

Helpdesk --> Customer Portal --> Knowledge Base --> Link to a Knowledge Base --> Confluence



2. SET UP LINK AS TRUSTED

Trusted Applications --> skip defining IPs and URLs, go to bottom and Enable --> spend a long time cycling through logins on Confluence and JIRA...

    "Agua" (JIRA) is currently configured to make requests into "Agua" (Confluence) using Trusted Applications. 
    
    Status  Configured


    

NOTES
-----

NB: INITIALLY SET UP LINK AS BASIC BUT GOT THIS ERROR:

    Only Confluence application links configured with Trusted Applications or 2-legged Oauth authentication can be used with Service Desk.

    
https://confluence.atlassian.com/display/JIRA044/Configuring+Authentication+for+an+Application+Link

--> CAN USE BASIC HTTP, OAUTH OR TRUSTED APP


https://confluence.atlassian.com/display/FISHEYE025/Configuring+Trusted+Applications+Authentication+for+an+Application+Link


    
</entry>
<entry [Wed 2014:09:17 22:33:02 EST] AGUA 2.0 HOME PAGE CSS>


 .rwui_expandable_item_title.rwui_expand {  
    font-size: 24px;  
    color: #2085b3 !important;  
    font-family: Bitter, Georgia, Times, "Times New Roman," serif;  
    font-weight: 400;  
}  
.rwui_expandable_item_body,   
.rwui_expandable_item_body p {  
    background-color: #FFF;  
}  
  
.rwui_expandable_item {  
    background: #ebf2f9;  
}  
  
.rwui_expandable_item_title.rwui_expand:hover {  
    color: #ebf2f9 !important;  
    background-color: #2085b3 !important;  
}  
  
.brikit-header-backdrop {  
    margin: 0 0 0 0 !important;  
}  
  
.brikit-page-metadata {  
    visibility: invisible;  
    display: none;  
}  
  
.brikit-content-layer-table {  
    background-color: #FFF;  
}  
  
.brikit-content-layer-table {  
    border-width: 0px !important;  
}  
  
.wiki-content.brikit-draggable-area.brikit-content-layers {  
    background-color: #FFF;  
}  
  
.brikit-container.brikit-header-container,  
.brikit-header-backdrop,  
.aui-header {  
    background-color: #2085b3 !important;  
}  
  
#brikit-toggle-header-button {  
    position: absolute;  
    top: 52px;  
}  
  
#main-header.brikit-header {  
    position: relative;  
    height: 70px !important;  
    background-color: #2085b3;  
}  
  
h1 {  
     color: #2085b3;  
}  
       


</entry>
<entry [Sat 2014:09:13 01:24:31 EST] BRIKIT THEME - HIDE PAGE TITLE>
    
    
HIT '.' --> Page --> Layout Source --> Override Layout --> Page Title --> Hide


    
</entry>
<entry [Sat 2014:09:13 00:40:50 EST] CREATED agua BRIKIT THEME>

1. CREATE EDITABLE THEME agua

HIT '.' --> Theme --> Magnifying glass --> CLICK 'copy' --> INPUT 'agua'


2. SELECT agua AS DEFAULT THEME

HIT '.' --> Architect --> Space Theme --> Magnifying glass --> Select 'agua'


ARCHITECTURE TAB

The settings in the [Page] tab relate to the currently-viewed page. Theme Press allows you to design two types of pages:

generic Confluence page
Theme Press architect pages

The Designer Guide focuses on the latter.
Name of Tab
Icon

For an architect page, the name of this tab corresponds to the type of page you are viewing:
banner
header
menu
layout
footer


Access a [Page] Tab

As a page designer, you complete most of your Theme Press tasks in the [Page] tab. Use the following steps to access this tab.

Access the Theme Press Default space.

Open an architect page.

From the Tools dropdown menu, select Theme Press Designer. (Alternately, press the period (.) shortcut key.)
Prior to Theme Press 1.1.1
Icon
From the Administration (gear) icon, select Theme Press Designer.

The Theme Press Designer Opens.
Select the [Page] tab.



THEME TAB

The settings in the Theme tab relate to the theme applied to the currently-viewed space. This theme could be the default or an alternative.
Default Theme
Icon
Editing the default theme affects all spaces using that theme.
At the highest level, Theme Press groups the Theme tab into five sections.
Section
Description
Theme	upload, download, delete and copy themes; set the default theme
Content	define a color palette and font source; define styles for text, headings, links and images; upload and edit custom CSS or JavaScript
Confluence	define styles for Confluence features: banner, header toolbar
HTML Structure	define styles for your canvas, the core body of a Confluence page
Special Features	define styles for macros and other features; hide aspects of the page when printing

    
</entry>
<entry [Fri 2014:09:12 03:40:24 EST] BRIKIT THEME>

http://www.brikit.com/display/resources/Getting+More+From+Your+Confluence+Investment


INSTALL canvas AND indigo THEMES

http://help.brikit.com/display/PRESS/Theme+Gallery

You can install themes from the gallery to your Theme Press site. Complete the following procedures to do so.

HIT '.' TO ACCESS Theme Designer --> Theme TAB --> EXPAND Theme Gallery ACCORDION --> Click magnifying glass to the right of the Themes setting.
A popup window opens.
Select the appropriate theme.
Click the +Install button.
The Install Theme window opens.
Confirm the install by clicking the OK button.
Wait for the installation to complete.

Once complete, you can select the theme as a default or space theme.

    
</entry>
<entry [Fri 2014:09:12 03:10:57 EST] LIST OF INSTALLED PLUGINS>

Adaptavist ThemeBuilder - EditorINCOMPATIBLERequest update
Adaptavist Content Formatting Macros
Adaptavist ThemeBuilder - Engine
Balsamiq Mockups
Brikit Theme
Composition
Draw.io Confluence Plugin
Gliffy Confluence Plugin
RB Storage - Confluence
RB Storage - Core
RB Storage - Servlet
RB Support - Confluence
RB Support - Core
RefinedWiki Mobile Interface
RefinedWiki Original Theme
RefinedWiki UI Toolkit

    
</entry>
<entry [Fri 2014:09:12 02:59:50 EST] LEFT NAVBAR OF AGUA 1.0>
    
CONFLUENCE ADMIN --> REFINED WIKI --> Edit Global Space Layout
    
{divbox:id=rw_pagetree|class=no_icons}{pagetree2:root=@none|expandCollapseAll=true}{divbox}{space-news}

    
</entry>
<entry [Fri 2014:09:12 02:43:19 EST] CONFLUENCE OPEN SOURCE LICENCE>

Support Entitlement Number	SEN-L4559370
Server ID	BHXG-AKF2-7D59-YG1V 

AAABOw0ODAoPeNpVkFtrwjAYhu/zKwK7jjTV4gECc211MtfKqmPCYGTx0wXatOQg679fbCfoRW7yP
e+B92GhJS6gwTTEwWg2Gs6iCMfJFocBHaEEjNCysbJWLK7VsXSgBHzOcN6AwkXttAAUa+AXIuEW2
EVGgimhIfICy4XNeAWssI5ri/e1UyckvNPAX+QZmNUOrmT6ymXJTIc27QV9PFX+ayDqCqVnXrouh
x15aaB3WUsBysC2baDLyTdp9lXku7c4Rd5NWVDcN05/G6nba8GoK0h7h8xV36DzY1w6Y0Fn9QEMC
1CuT1xJ0wfOleJ+pdYDlUFFmjH/yHA8CSYTigrQZ9CrhD09fyzJ/GURknESTcl+Sd/Rf0F/Xa+SW
9Vd+M6ANozQK37T16lSVtLCAW382j/cwP3OFP0BGcCVxTAsAhQZKnmbOuKWTvUDFBiV6HfmuywH6
wIUZjgCuc8tUM3tyxA1EfYHnnaYdRc=X02fn
    
</entry>
<entry [Fri 2014:09:12 02:39:19 EST] REFINEDWIKI OPEN-SOURCE LICENCE GOOD TIL >
    
AAABUw0ODAoPeNqVkV9LwzAUxd/zKQI+Sku6Td0GAaXrm7Zj3RRBkNjddsE0Cfkz7bc37VoQ33zIy
z0395zfvVf7k8claJwkmJD1/Ha9WOB0s8czkizQBmxluHZcSbqDmks4vvBPjgvDGy6ZwPsTtIBrZ
XCqZC08yArCV0Ku8cGCsW9rXGiQuFTeBOWRVyAtoNy3H2CKeuihUYJSA6x32TAHtLeOyCpKQl1Jx
yqXsxZo6TwzDr8qL5tJyJ4YF9QOiu565b5pQymuVIuyMxN+GEtrJoJtKMbmgvEVMELTlDnWwgciG
7seKFYjXwzSgdGGW6DOeEDiAvAcYvdjZyj4hxbJwozsW3PTTQQ3I8H/PQMWP49+hWmY5PYC8SAl4
7jsrIPWojLLaXjR/G5JliuCxt3+SuGl4C13cJy0fadhWGWxzfL3sjjs0gxtw2VOzMLf1f8AxO671
jAtAhQeZqLyfdWErWHowJWEJgHYNP09dQIVAIN1DDjaKjKL9z0u/19uZvyf+SqTX02go


</entry>
<entry [Fri 2014:09:12 02:37:41 EST] iframe MACRO>

Add the macro to your page as follows:
{iframe:src=http://www.adaptavist.com}
text to show when browser does not support iframes
{iframe}
    
</entry>
<entry [Fri 2014:09:12 02:29:26 EST] INSTALLED GOOGLE ANALYTICS PLUGIN>

1. APPLIED FOR LICENCE

http://www.appfusions.com/display/GANLC/Live+demo+-+in+the+flesh#gaSearchVisits

Support Entitlement Number	SEN-L4559370
Server ID	BHXG-AKF2-7D59-YG1V 


2. DOWNLOAD AND INSTALL



    
</entry>
<entry [Fri 2014:09:12 01:57:50 EST] INSTALLED {style} MACRO WITH ADAPTAVIST CONTENT-FORMATTING PLUGIN>


http://www.adaptavist.com/doco/display/CFP/style+Macro


1. Copy your license key to the clipboard:

AAABDg0ODAoPeNqVkE1rwzAMhu/+FYadE/LRrqzgQ0lSGORjrF1Pu2iekhkSJ8hOWP/94qUsMHbZQ
SAk3kcPujuS4icceBjxIN5vd/v4nifpmUdBuGEpGklqsKrXIum1RW35sacOrFW64QVI6g2ve+Lzt
m5H1BJf9zyboB3BpVg5dm9IVf1ikIzwQpYQfm9SsCjcES948MKIrRlhaUQm+86HdxgsTMpYX/7wX
etEVo9Fw59nSAMpgwuhVRK1wct82FEjVoBySZgh2eeg6Lo6hIFzqKgBrcxicWhGYKesFHN5+Wa7i
6M4YPkC/Tv/f2eQVk033xv6fB2whA5FUhVF9pw8HnL2NJL8AIO/n/YFW4eZEDAtAhUAlixEvEfRj
lu5LB5PKrKr5GDPSaoCFFLcVlLGIKPIloW7KQfk/ZWm/lygX02dp


2. Download add-on

Download the Content Formatting Macros add-on to your local system:

Download
3. Install add-on in Confluence (Server)

Note: You must have administrative rights to install an add-on.

Open your Atlassian Confluence (Server) application and log in.
Navigate to the administration section. You may need to log in again (we're super secure).
Choose "Add-Ons", then navigate to "Manage Add-Ons" (the "Install" section in older versions).
Click the "Upload Add-On" link and upload this file.
4. Apply your license in Confluence (Server)

Navigate to the "Manage Add-Ons" page of your Confluence (Server) instance (the "Install" section in older versions).
Locate your installed Content Formatting Macros add-on in the list.
Click the add-on entry and copy and paste the license key into the license box for your add-on. All done!
    
</entry>
<entry [Fri 2014:09:12 01:24:08 EST] INSTALLED {blog-calendar} WITH THEMEBUILDER PLUGIN>

SEE HERE FOR USAGE

http://www.adaptavist.com/doco/display/Builder/blog-calendar+macro



https://my.atlassian.com/addon/success?type=try&addOnKey=com.adaptavist.confluence.themes.sitebuilder&addOnName=ThemeBuilder&addOnSen=L4573059&licenseId=4573059&parentName=Confluence+%28Server%29&referrer=pac&callback=&licensefieldname=


NB: FOR CONFLUENCE 5.3 - 5.5.6 AND HAVE 5.6.1 INSTALLED, BUT STILL WORKED!


1. Copy your license key to the clipboard:

AAABCA0ODAoPeNqVkE1rg0AQhu/7KxZ6VvyIlAgeUrVQ8KM0tqdeJpsxWdBVZnel+ffVGhooveQwp
5n3fR7m4Zkk3+PI/YB7YRyEcRjxNGt44PkblqEWJEcjB5U0Z+zxycruiMTbgXg6qLazqAR+xjyfo
LOwHLLK9gekun3XSDpxfJYS/mwyMJgsvY63dfyA3TKJIYtMDL0LRxgNTFIbV/z2u2Zha1dLg4fVw
AVh5IRrsJMClcaPmbeUBawEqQwqmLP51yjpckP73oKu6QRK6hW+O1lg+7xK5nGKTfQYetH2Phucc
TSS1FejYjX6H35dNpcRK+gxSeuyzN/Sl13BXi2JM2j8+6pvJkuP2jAsAhQLjOzpDVU0E74NItpfS
rWY1aPQ0AIUS+QYqrVaOp087ZzNL21Ax7c+MeM=X02dh


2. Download add-on

Download the ThemeBuilder add-on to your local system:

Download
3. Install add-on in Confluence (Server)

Note: You must have administrative rights to install an add-on.

Open your Atlassian Confluence (Server) application and log in.
Navigate to the administration section. You may need to log in again (we're super secure).
Choose "Add-Ons", then navigate to "Manage Add-Ons" (the "Install" section in older versions).
Click the "Upload Add-On" link and upload this file.
4. Apply your license in Confluence (Server)

Navigate to the "Manage Add-Ons" page of your Confluence (Server) instance (the "Install" section in older versions).
Locate your installed ThemeBuilder add-on in the list.
Click the add-on entry and copy and paste the license key into the license box for your add-on. All done!



    
</entry>
<entry [Thu 2014:09:11 03:57:57 EST] AGUA 1.0 STYLESHEET>

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


/* HIDE COMMENTS ON Home */ 
#comments-section {
    visibility: invisible;
    display: none;
}

/* QUICKSAND GOOGLE WEB FONT */
@font-face {
  font-family: 'Quicksand';
  font-style: normal;
  font-weight: 400;
  src: local('Quicksand Regular'), local('Quicksand-Regular'), url('http://themes.googleusercontent.com/static/fonts/quicksand/v2/sKd0EMYPAh5PYCRKSryvWz8E0i7KZn-EPnyo3HZu7kw.woff') format('woff');
}
@font-face {
  font-family: 'Quicksand';
  font-style: normal;
  font-weight: 300;
  src: local('Quicksand Light'), local('Quicksand-Light'), url('http://themes.googleusercontent.com/static/fonts/quicksand/v2/qhfoJiLu10kFjChCCTvGlHhCUOGz7vYGh680lGh-uXM.woff') format('woff');
}
@font-face {
  font-family: 'Quicksand';
  font-style: normal;
  font-weight: 700;
  src: local('Quicksand'), local('Quicksand-Bold'), url('http://themes.googleusercontent.com/static/fonts/quicksand/v2/32nyIRHyCu6iqEka_hbKsnhCUOGz7vYGh680lGh-uXM.woff') format('woff');
}

html, body,
.wiki-content,
.pagetree,
.prnnode, .node, 
.selnode, .selprnnode, 
.row, .selrow,
#category_menu_dynamic  {
    font-family: 'Quicksand', sans-serif !important;
    font-weight: 700 !important;
    font-size: 14px;
}

/* CODE AND PRE - BLACK ON MAUVE */
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
    margin: 12px 0;
    padding: 6px 9px 7px;
    font-size: 11px;
    border: 1px solid #CCC;
    background: #FFFFEB !important;
    color: #555 !important;
    border-left: none;
    border-right: none;
    overflow: auto;
}


pre, pre {
    font-family: "Lucida Grande";
}

p, blockquote, pre, pre, div, form, table {
    vertical-align: baseline;
}

pre, xmp, plaintext, listing {
    display: block;
    font-family: monospace;
    white-space: pre;
    margin: 1em 0px;
}

/* PRE - BLACK ON WHITE WITH BORDER */
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
    color: #48E !important ;
    outline-style: none;
    outline-width: medium;
    text-decoration: none;
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
    /*font-family: Helvetica !important;*/
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
<entry [Thu 2014:09:11 03:57:01 EST] AGUA 1.0 LEFT NAVBAR - RSS, BLOGS, NEWS, ETC.>


{divbox:class=nav_lsb}
{pagetree2:@home|selectionMode=row|sort=natural|branchStyle=plus-lines|iconStyle=computer|initialDepth=2}{divbox}


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

    
</entry>
<entry [Wed 2014:09:10 19:31:46 EST] INSTALL COMPOSITION PLUGIN>

1. INSTALL IN ADDONS MANAGER


2. GET SEN #

ADMIN --> LICENSE DETAILS

SEN-L4559370


3. 'PURCHASE' TRIAL LICENSE AT SERVICE ROCKET (CUSTOMWARE) SITE

http://marketplace.servicerocket.com/product/composition-plugin

    
</entry>
<entry [Wed 2014:09:10 15:49:29 EST] AGUA 1.0 MARKUP>


HOME

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
<entry [Wed 2014:09:10 04:59:09 EST] AGUA - HOW TO>

How To
This guide to using Agua contains the following sections:

Managing Projects
Running Workflows
Sharing Data
Agua API
Bioapps API

Managing projects
Managing projects and data files
The Agua data hierarchy is relatively straightforward:

1. Projects are directories within the user's 'agua' directory

*e.g.: /nethome/username/agua/Project1

2. Workflows are subdirectories inside a project directory

e.g.: /nethome/username/agua/Project1/Workflow1

3. Because the logical structure is tied to the file system, projects have unique names and workflow names are unique within a particular project. Users can browse the file system and upload/download data just as if it were on their local computer.

If you already know the basics of file management and want to know more about how to share your projects with others or selectively restrict access to your data, look out for the next version of Aqwa, which will contain this functionality. To create a new project or workflow, see Create workflows.

Open a Project tab
After logging into Agua, click on the 'Projects' button in the top menu to open a 'Project' tab. If it's your first time using Agua. You should see the default 'Project1' folder along with any 'Source' folders that you have access to:

< Image: Project tab showing '/Project1/Workflow1' and several 'Source' folders>

Just as in a desktop computer, right-clicking on a displayed object will display an option menu of actions you can perform. You can accomplish the following actions on the displayed file systems using the right-click menu options:

Download file
Upload file
Rename file



Running Workflows
Creating and running workflows with Agua
The following is a step-by-step guide to creating, configuring and running workflows in Agua. Agua is designed to allow you to create/remove workflows and projects, and drag and drop applications to populate workflows with the minimum of effort.

If you already know the basics of workflow management and want to know more about the individual applications available within Agua, right-click an application in the left hand sidebar to view its content menu then select the 'About' menu option.

Create a new workflow

Add applications to your workflow

Configure your applications

Run your workflow


Add applications
Add applications to your workflow
The applications available to users are displayed in the left sidebar. Applications are grouped according to their functionality. For example, the 'pipelines' group of applications are wrapper-like applications which run a series of complex tasks such as image analysis to ELAND alignment in a single workflow step. The 'utility' group includes applications that perform basic tasks such has simple data munging or to prepare inputs at different stages in a complex workflow. The 'converter' group is a group of utility-like applications that are specifically used for converting data between different file types.

< Image: Closeup of left pane applications>

To drag an application to your workflow, simply left-click on the application in the left pane and, while holding down the left mouse button, drag the application to the application 'drop zone' in the workflow area in the middle pane. Once the application is within the drop zone, the dragged icon will become green, at which point you can release the left mouse button and the application will be added to your workflow.

< Image: Drag of application to workflow>
    

Configure applications
Configuring applications
As in the example, if you drag the 'clusterMAQ' application to your workflow you should see the right pane become populated with the input and output information for the application.

< Image: Closeup of right pane showing inputs and outputs with green/red marking denoting presence and fulfillment of requirements>

The files and parameters of the inputs and outputs are color-coded according to their requirement by the application and their presence/absence on the file system. All files that are physically present and non-zero size are written in black type, whereas files that are absent or empty are written in grey type. Files or parameters that are required but not satisfied (e.g., the parameter value is empty or the file is absent) have a red background. Requirements that are satisfied have a green background.

Configure your workflow
< Image: File Manager with own projects and sources>

< Image: Closeup of File Manager context menu>

< Image: File upload 1, 2, 3 & 4>

1: click file upload button
2: browse local filesystem
3: 'file uploading...'
4: New file value is set in option  


Create workflows
Create a new workflow
After logging into Agua, click on the 'Workflows' button in the top menu to open a 'Workflow' tab. If it's your first time using Agua, you'll find a default Project and Workflow: the projects scrollbar in the middle pane of the workflow pane will read 'Project1' and the workflows scrollbar underneath it will show 'Workflow1'.

< Image: Default 'Project1, Workflow1' configuration in top middle pane.>

To save your new workflow, simply click within the workflow scrollbar (i.e., where it says 'Workflow1') and type the name of your new workflow. Hit the 'Return' key on your keyboard to save the workflow. You can now populate your new workflow with applications.


IMAGE: create-a-new-workflow.png




Run workflows

Once you have ensured that your applications are configured correctly and that all required inputs are satisfied, the 'Run Workflow' button will appear in bold (previously it was shaded out to indicate the workflow was not ready to run).



Agua API

The Agua applications are grouped in the following categories:
Agua - scripts
Agua - files
Agua - JBrowse
Agua - cluster
Agua - logic
Agua - sql
Sharing Data

Sharing Data
In order to meet the demands of virtual working groups and permit users to control access to his/her own analysis data, Agua allows the user to define their own virtual work groups composed of any combination of the user's own analysis data (i.e., *not* the read-only run archive data the user may have access to).
The user can freely add/remove other users or projects to existing groups and create new groups to govern access to the user's own data. These groups will persist until the user decides to delete them.
Users may copy to their own project folders workflows that have been 'shared' with them by other users and may use these copied workflows just as they would their own workflows.
Agua also permits the user to directly access his/her data in the same manner as they would on the Linux command line. Users may upload and download files to and from the workflows contained in the project folders in their data directory.

Bioapps API
Bioapps - expression
Bioapps - filters
Bioapps - index
Bioapps - readprep
Bioapps - snp
Bioapps - utils
Bioapps - venn
Bioapps - aligners
Bioapps - converters


    
</entry>
<entry [Wed 2014:09:10 04:51:03 EST] AGUA - GET IT>

1. AMI Launch Steps
Running Agua using the EC2 AMI
AMI stands for Amazon Machine Image, which is a frozen copy of a server's operating system and all the data on its hard disks. Agua's installation procedure has been tested on Ubuntu versions 10.04 and 11.04.

Other varieties of Linux may be supported in the future. In the meantime, for a trouble-free installation, it is advisable to use the currently supported varieties.

You will need a credit card and an internet connect for the next two steps.

1. Create an Amazon EC2 account
2. Generate Amazon EC2 credentials
3. Launch the Agua AMI.
    

1.1. Create EC2 account
Creating an Amazon EC2 account
https://help.ubuntu.com/community/EC2StartersGuide

Running Ubuntu Server Edition on Amazon Web Services requires you to go through the following steps:

Create your account on Amazon
Set up your credentials
Install Amazon EC2 API Tools
Instantiate your images(s)
Configure your instance

You can associate your new EC2 account with an existing Amazon account (if you already have one), or create a new account.

Go to http://aws.amazon.com, and select Sign-up Now. Sign in to your existing Amazon account or create a new one.
Go to http://aws.amazon.com/ec2, and select "Sign Up for Amazon EC2".
Enter your credit card information.
Complete your signup for the Amazon EC2 service.
After signing up, you should end up at the EC2 console
Create a key pair and download the private key
Click Key Pairs under Networking and Security in the Navigation pane and then click the Create Key Pair button (save it in e.g. ~/.ec2/ec2.pem). This private key is for making SSH connections to newly created instances.
You will also need to set up your Amazon API credentials. Go to Account->Security Credentials
click X.509 Certificates tab
Create a new Certificate
Download the private key and the certificate (save them in e.g. ~/.ec2/cert-XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX.pem and ~/.ec2/pk-XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX.pem).
Make your credential files private: chmod go-rwx ~/.ec2/*.pem
Scroll to the bottom of the page and note your account ID (a number of the form XXXX-XXXX-XXXX).
If at a later time you discover you need to generate a new X.509 certificate, click on "Your Account" at the top of the EC2 console page. You may need to click the small button with two down arrows near the top right of the EC2 console page to make the "Your Account" link visible. Then in the "Access Credentials" box, click the tab named "X.509 Certificates" and click "Create a New Certificate". Download the private key and certificate when prompted.


Sign up for EC2
You can associate your new EC2 account with an existing Amazon account (if you already have one), or create a new account.

Go to http://aws.amazon.com, and select Sign-up Now. Sign in to your existing Amazon account or create a new one.
Go to http://aws.amazon.com/ec2, and select "Sign Up for Amazon EC2".
Enter your credit card information.
Complete your signup for the Amazon EC2 service.
After signing up, you should end up at the EC2 console
Create a key pair and download the private key
Click Key Pairs under Networking and Security in the Navigation pane and then click the Create Key Pair button (save it in e.g. ~/.ec2/ec2.pem). This private key is for making SSH connections to newly created instances.
You will also need to set up your Amazon API credentials. Go to Account->Security Credentials
click X.509 Certificates tab
Create a new Certificate
Download the private key and the certificate (save them in e.g. ~/.ec2/cert-XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX.pem and ~/.ec2/pk-XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX.pem).
Make your credential files private: chmod go-rwx ~/.ec2/*.pem
Scroll to the bottom of the page and note your account ID (a number of the form XXXX-XXXX-XXXX).
If at a later time you discover you need to generate a new X.509 certificate, click on "Your Account" at the top of the EC2 console page. You may need to click the small button with two down arrows near the top right of the EC2 console page to make the "Your Account" link visible. Then in the "Access Credentials" box, click the tab named "X.509 Certificates" and click "Create a New Certificate". Download the private key and certificate when prompted.


1.2. Generate Credentials
Types of credentials

First, a note on the area of EC2 that most often confuses people: credentials. There are multiple different kinds of credential, Amazon uses slightly non-standard nomenclature, and it's not always clear which credential is required for a given application.

Signon credentials: These are the email address/password pair that you use when you sign up. You use these to sign on to the AWS console, and can be considered the "master" credentials as they allow you to regenerate all other types of credentials.
Access Credentials: There are three types: access keys, X.509 certificates and key pairs. The first and second type allow you to connect to the Amazon APIs. Which type of credential depends on which API and tool you are using. Some APIs and tools support both options, whereas others support just one. The third type is SSH public/private key pairs that are used for initial logins to newly created instances.
access keys: Symmetric key encryption. These are for making requests to AWS product REST or Query APIs. Can be obtained/regenerated from the Access Keys tab on the AWS Security Credentials page.
X.509 certificates: Public key encryption. Use X.509 certificates to make secure SOAP protocol requests to AWS service APIs. These are the credentials you will use when using the command-line ec2 api tools. Can be obtained/regenerated from the X.509 Certificates tab on the AWS Security Credentials page.
key pairs: SSH key pairs. When you create an instance, Amazon inserts the public key of your SSH key pair into your new instance so that you can log in using your private key. You can add new SSH key pairs through the AWS management console by clicking on Key Pairs under Networking and Security in the Navigation pane and then the Create Key Pair button. After specifying a name you will be prompted to download and save your private key. EC2 stores the public portion of your key pair, and inserts it into /home/ubuntu/.ssh/authorized_keys when you instantiate your instance. If you lose this private key, it cannot be downloaded again; you will need to regenerate a new key pair.


1.3. Launch Agua AMI
Launching the Agua AMI
You can launch an Agua AMI using a web application such as the AWS Control Panel or the Firefox browser plugin Elastic Fox. Alternately, you can launch the AMI on the command line using the Amazon EC2 API.

1. AWS Control Panel
In the AWS Control Panel, click on the 'EC2' tab then select the 'AMIs' link in the left navigation bar. Search for the Agua AMI by the AMI id (see Agua home page for the latest AMIs) or using the search term 'Agua'.

2. ElasticFox Firefox plugin
3. Command line using EC2 API
List all available AMIs:

Launch an AMI:

<!--

ec2-start-instances <AMI_ID> \
-K ... \
-C ... \
-availzone ... \
-s ... \
...

-->


2. Installation Steps
2.1. System Requirements page
Before you install Agua, check the System Requirements page make sure you have the required packages and hardware specifications to run Agua.

2.2 Install Perl modules
Please also confirm that the required are available on your system prior to installing Agua

2.3. Download Agua
For details on how to download a copy of the source code using a web browser or the command line tool git.

2.4. Installation instructions page.
Once you have downloaded and unzipped the source code, go to the



2.1. System requirements
Cluster environment
Agua supports Ubuntu 11.04 and 11.10 but will also work on common variants of Linux with minor tweaks. The system can be configured to run applications on a distributed cluster using the Open Grid/Sun Grid Engine (SGE) job scheduler. At the execution of every run command, Agua checks for the presence of the cluster type in the config file: default.conf. The config file is updated by the config.pl script and can also be manually edited. If the cluster is not specified, all run commands will be performed in series on the computer where Agua is installed.

File systems
Agua can be installed in a variety of file system architectures, with the simple caveat that input file systems must be readable and output locations must be writable. The default file system assumes a particular hierarchy of directory locations but these can configured during the installation process by passing arguments to config.pl or by manually editing the configuration file.

User authentication
Agua currently supports two modes of authentication, roughly corresponding to different installation scenarios (NB: Agua can use both authentication systems at the same time).

Intranet
User authentication via LDAP server, Agua is accessible only within the local network. In this scenario, Agua's users and system users are one and the same. Data is kept in user-owned accounts on the remote server and data access is restricted by user/group file permissions. Applications run on the cluster with the user identity of the initiating user and system resource constraints and disk usage quotas are managed by the system administrator.

Internet
User authentication using Agua database. Agua is accessible on the Internet users both inside and outside the local network. Data is kept in user-specific folders owned by the 'agua' user and jobs run on the cluster as the 'agua' user.

Persistent data and workflow configurations
User-generated analysis data and workflow configurations should be stored in a persistent and readily-accessible manner. User analysis data for each workflow is currently stored in the respective workflow folder within a project folder inside the user's data directory:

User's data directory
       |
       |
       \+-\- Project1
       |    |
       |    |
       |    \+--\- Workflow1
       |    |
       |    \+--\- Workflow2
       |
       |
       \+-\- Project2
       |    |
       |    |
       |    \+--\- Workflow1
       |    |
       |    \+--\- Workflow2
       :
Cluster resources
Agua contains optimized pipelines designed to process NextGen data on HPC clusters. The current configuration is based on a MOAB/PBS cluster but Agua will eventually support SGE and possibly other scheduling systems.

Data access
In both the internal and external web access modalities described above, Agua needs read-only access to some archived run folders. They need not necessarily be the same folders - i.e., the internally accessible run folders (e.g., HIHG run archives) may be physically and logically distinct from the externally accessible folders.
Agua must also be able to write user analysis data, either to a central repository or to a subfolder within the user's 'home folder'. For example, the analysis data of CCS users may stored in their /home/username/.Agua folder whereas the data of external users (e.g., in the case of external web access described above) may be stored in a user-specific folder generated within a central Agua repository.
General reference data, such as reference sequence files must also be available to all users (e.g., [Data sources|Agua:Data sources]).

Sharing
In order to meet the demands of virtual working groups and permit users to control access to his/her own analysis data, Agua allows the user to define their own virtual work groups composed of any combination of the user's own analysis data (i.e., **not** the read-only run archive data the user may have access to).
The user can freely add/remove other users or projects to existing groups and create new groups to govern access to the user's own data. These groups will persist until the user decides to delete them.
Users may copy to their own project folders workflows that have been 'shared' with them by other users and may use these copied workflows just as they would their own workflows.
Agua also permits the user to directly access his/her data in the same manner as they would on the Linux command line. Users may upload and download files to and from the workflows contained in the project folders in their data directory.


2.2. Install Perl modules
Before installing Agua, please make sure the following perl modules are installed.

JSON
Term::ReadKey

Installing Perl modules
You can use one of several ways to install perl modules:

1. CPAN
sudo perl -MCPAN -e shell
In the CPAN shell, type the following commands:

> install JSON
> install Term::ReadKey
2. cpanminus
Cpanminus is a simplified version of CPAN which runs directly on the command line. On Ubuntu, you can install cpanminus with the following command:

sudo apt-get install cpanminus
You can install the modules as follows:

cpanm install JSON
cpanm install Term::ReadKey
3. Install from downloaded source file
Download the source file (e.g., from search.cpan.org) into an empty temporary directory and do the following:

tar xvfz *gz        #### UNZIP THE FILES
cd *                #### GO INTO THE UNZIPPED FOLDER
perl Makefile.PL    #### CREATE THE Makefile
make                #### RUN THE make
make test           #### RUN THE TESTS
sudo make install   #### INSTALL TO SYSTEM


2.3. Download Agua
Before installing Agua on your server you must download it to your server using one of two methods:

Method 1 Download the source code from the Agua site on Github
1. Click the 'Tags' link (in grey next to the 'Downloads' link) at the right hand side of the page to download the latest source *.gz file. Save the file to your '/' directory.

2. Issue the following Linux commands to unzip the file

cd /

tar xvfz agua.*.tar.gz

Method 2 Alternately, download the source code using git*
1. Install git

2. Issue the following Linux commands to download and unzip the source code file:

cd /

git clone https://github.com/agua/agua.git

cd agua

Once you have downloaded and unzipped the source code, go to the Installation instructions page.



2.4. Install Agua
Install Agua
Once you have downloaded Agua, unzip and untar the distribution and move into the bin directory. You can then install and configure Agua with the 'install.pl' and 'config.pl' scripts. They are found in this directory:

INSTALLDIR/bin/scripts

To install Agua, you must run AS ROOT the following two scripts in succession:

1. install.pl Installs dependencies and sets up directory hierarchy

sudo ./install.pl
2. config.pl 
This script executes all of the configuration tasks: it configures the Agua database, configures the automatic load balancer monitor and creates Agua's 'admin' user. If you you're not which mode to use, use this:

config.pl --mode config 
Once configuration is complete, you are ready to initialise Agua by adding your EC2 credentials in Agua's Initialization Page.

NB: The above command tells config.pl to execute a series of tasks, which can be run separately using the following commands:

Install the Agua mysql database and DB user

config.pl --mode mysql    
Enable Agua's automated StarCluster load balancer monitor

config.pl --mode cron     
Create Agua's 'admin' user

config.pl --mode user     
Then, run the config utility:

tar xvfz agua*.tar.gz
cd agua*
cd bin
[syoung@ngsdev bin]$ rm -fr /data/agua/branches/theme/theme1
[syoung@ngsdev bin]$ ./config.pl 
Welcome the Agua configuration utility (config.pl)
The standard install requires permissions to create
the following directories (e.g., root):
    INSTALL DIR : /usr/share/agua
    HTML DIR    : /var/www/html/agua
    CGI DIR     : /var/www/cgi-bin/agua
    URL         : http://localhost/agua
Type 'Y' for the standard installation or type 'N' for custom installation
n
Custom install selected!
Base directory [/usr/share/agua]:
/data/agua/branches/theme/theme1
Web directory [/var/www/html/agua]:
/var/www/html/agua/theme/theme1
CGI directory [/var/www/cgi-bin/agua]:
/var/www/cgi-bin/agua/theme/theme1
Web URL [http://localhost/agua]:
http://ngsdev.ccs.miami.edu/agua/theme/theme1

Using these parameters for installation:
basedir: /data/agua/branches/theme/theme1
webdir: /var/www/html/agua/theme/theme1
cgidir: /var/www/cgi-bin/agua/theme/theme1
url: http://ngsdev.ccs.miami.edu/agua/theme/theme1

Checking if base directory already exists...
Base directory does not exist. Creating base directory...

Copying folders to base directory: bin cgi-bin conf fileroot html lib t
.......
done

Linking directories: html cgi-bin cgi-bin/lib cgi-bin/conf
....
done

Copying install config to default config: /data/agua/branches/theme/theme1/conf/default.json
Type Y to use the default application paths or type N to set custom application paths
y
Downloading dojo...
--16:14:52--  http://download.dojotoolkit.org/release-1.2.2/dojo-release-1.2.2.tar.gz
Resolving download.dojotoolkit.org... 69.89.78.153
Connecting to download.dojotoolkit.org|69.89.78.153|:80... connected.
HTTP request sent, awaiting response... 200 OK
Length: 1715186 (1.6M) [application/x-gzip]
Saving to: `dojo-release-1.2.2.tar.gz'

100%[===================================================================================================================>] 1,715,186    681K/s   in 2.5s   

16:14:55 (681 KB/s) - `dojo-release-1.2.2.tar.gz' saved [1715186/1715186]

Download completed.
Unzipping dojo release...
Unzip completed
done.

*******************************************************
*******************************************************
Agua has been installed to this directory:
    /data/agua/branches/theme/theme1
Browse to Agua here:
    http://ngsdev.ccs.miami.edu/agua/theme/theme1
*******************************************************
*******************************************************




MARKUP

h3. Install Agua

Once you have downloaded Agua, unzip and untar the distribution and move into the bin directory. You can then install and configure Agua with the 'install.pl' and 'config.pl' scripts. They are found in this directory:

INSTALLDIR/bin/scripts


To install Agua, you must run AS ROOT the following two scripts in succession:

1. install.pl   Installs dependencies and sets up directory hierarchy

{code}
sudo ./install.pl
{code}

2. config.pl    
This script executes all of the configuration tasks: it configures the Agua database, configures the automatic load balancer monitor and creates Agua's 'admin' user. If you you're not which mode to use, use this:
{code}
config.pl --mode config 
{code}

Once configuration is complete, you are ready to initialise Agua by adding your EC2 credentials in Agua's [Initialization Page|Initializing Agua]. 


NB: The above command tells config.pl to execute a series of tasks, which can be run separately using the following commands:

*Install the Agua mysql database and DB user*
{code}
config.pl --mode mysql    
{code}

*Enable Agua's automated StarCluster load balancer monitor*
{code}
config.pl --mode cron     
{code}

*Create Agua's 'admin' user*
{code}
config.pl --mode user     
{code}


Then, run the config utility:

{code}
tar xvfz agua*.tar.gz
cd agua*
cd bin
{code}

{code}
[syoung@ngsdev bin]$ rm -fr /data/agua/branches/theme/theme1
[syoung@ngsdev bin]$ ./config.pl 
Welcome the Agua configuration utility (config.pl)
The standard install requires permissions to create
the following directories (e.g., root):
    INSTALL DIR : /usr/share/agua
    HTML DIR    : /var/www/html/agua
    CGI DIR     : /var/www/cgi-bin/agua
    URL         : http://localhost/agua
Type 'Y' for the standard installation or type 'N' for custom installation
n
Custom install selected!
Base directory [/usr/share/agua]:
/data/agua/branches/theme/theme1
Web directory [/var/www/html/agua]:
/var/www/html/agua/theme/theme1
CGI directory [/var/www/cgi-bin/agua]:
/var/www/cgi-bin/agua/theme/theme1
Web URL [http://localhost/agua]:
http://ngsdev.ccs.miami.edu/agua/theme/theme1

Using these parameters for installation:
basedir: /data/agua/branches/theme/theme1
webdir: /var/www/html/agua/theme/theme1
cgidir: /var/www/cgi-bin/agua/theme/theme1
url: http://ngsdev.ccs.miami.edu/agua/theme/theme1

Checking if base directory already exists...
Base directory does not exist. Creating base directory...

Copying folders to base directory: bin cgi-bin conf fileroot html lib t
.......
done

Linking directories: html cgi-bin cgi-bin/lib cgi-bin/conf
....
done

Copying install config to default config: /data/agua/branches/theme/theme1/conf/default.json
Type Y to use the default application paths or type N to set custom application paths
y
Downloading dojo...
--16:14:52--  http://download.dojotoolkit.org/release-1.2.2/dojo-release-1.2.2.tar.gz
Resolving download.dojotoolkit.org... 69.89.78.153
Connecting to download.dojotoolkit.org|69.89.78.153|:80... connected.
HTTP request sent, awaiting response... 200 OK
Length: 1715186 (1.6M) [application/x-gzip]
Saving to: `dojo-release-1.2.2.tar.gz'

100%[===================================================================================================================>] 1,715,186    681K/s   in 2.5s   

16:14:55 (681 KB/s) - `dojo-release-1.2.2.tar.gz' saved [1715186/1715186]

Download completed.
Unzipping dojo release...
Unzip completed
done.

*******************************************************
*******************************************************
Agua has been installed to this directory:
    /data/agua/branches/theme/theme1
Browse to Agua here:
    http://ngsdev.ccs.miami.edu/agua/theme/theme1
*******************************************************
*******************************************************
{code} 







</entry>
<entry [Wed 2014:09:10 03:37:13 EST] AGUA - ABOUT>


What is Agua?

Agua aims to accelerate scientific discovery by taking the effort out of creating and running workflows, thereby enabling researchers to focus on the important questions. Agua is a configuration-based bioinformatics workflow platform that enables users to run workflows on a local machine, cloud or cluster using a simple command-line or web interface. Agua provides a transparent mechanism for workflow configuration and sharing that makes experiments truly reproducible. 


Key features

Simple installation
    Download from Github, execute install scripts

Configurable workflows
    Use human-readable, plain text files to describe workflows
    Describe the applications and data in the workflow as items in an indented list
    No software skills required

Easy-to-run workflows
    Run a preconfigured workflow with a simple command
    Select from commonly-used preconfigured workflows
        Broad GATK Best Practices (DNA-seq)
            Pre-processing
            Variant calling
            Annotation
        Extract mapped/unmapped reads from CGHub samples (Moores Cancer Center)
        Variant calling
            FreeBayes
            Mutect
            Varscan
    Monitor progress status and runtime durations
    View outputs and error messages
        
Easy-to-create workflows
    Use the command line or drag-n-drop web interface to quick create of modify workflows
    Copy and modify a whole pipeline in seconds

Load workflow packages
    Version-specific installation of analysis tools
    Dependencies and applications installed automatically
    Workflow configurations loaded automatically into database
    
Publish your workflows
    Sync workflow files to Github or Bitbucket repository
    Add documentation, notes and analysis results
    Workflows are automatically versioned and easily reproducible

    


What is Hudson?

Hudson monitors the execution of repeated jobs, such as building a software project or jobs run by cron. Among those things, currently Hudson focuses on the following two jobs:
Building/testing software projects continuously, just like CruiseControl or DamageControl. In a nutshell, Hudson provides an easy-to-use so-called continuous integration system, making it easier for developers to integrate changes to the project, and making it easier for users to obtain a fresh build. The automated, continuous build increases productivity.
Monitoring executions of externally-run jobs, such as cron jobs and procmail jobs, even those that are run on a remote machine. For example, with cron, all you receive is regular e-mails that capture the output, and it is up to you to look at them diligently and notice when it broke. Hudson keeps those outputs and makes it easy for you to notice when something is wrong.
Features

Hudson offers the following features:

Easy installation: Just java -jar hudson.war for testing. Use a native package or deploy it in a servlet container for production use. No additional install, no database.
Easy configuration: Hudson can be configured entirely from its friendly web GUI with extensive on-the-fly error checks and inline help. There's no need to tweak XML manually anymore, although if you'd like to do so, you can do that, too.
Change set support: Hudson can generate a list of changes made into the build from SCM systems like CVS, Subversion, Git and many others. This is done in a fairly efficient fashion, to reduce the load on the repository.
Permanent links: Hudson gives you clean readable URLs for most of its pages, including some permalinks like "latest build"/"latest successful build", so that they can be easily linked from elsewhere.
RSS/E-mail/IM Integration: Monitor build results by RSS or e-mail to get real-time notifications on failures.
After-the-fact tagging: Builds can be tagged long after builds are completed
JUnit/TestNG test reporting: JUnit test reports can be tabulated, summarized, and displayed with history information, such as when it started breaking, etc. History trend is plotted into a graph.
Distributed builds: Hudson can distribute build/test loads to multiple computers. This lets you get the most out of those idle workstations sitting beneath developers' desks.
File fingerprinting: Hudson can keep track of which build produced which jars, and which build is using which version of jars, and so on. This works even for jars that are produced outside Hudson, and is ideal for projects to track dependency.
Plugin Support: Hudson can be extended via 3rd party plugins. You can write plugins to make Hudson support tools/processes that your team uses.
Industry standard products supported by Hudson

Hudson supports hundreds of standard products via plugins. To name a few

SCM vendors: Git, CVS, SVN, Perforce, Mercurial, Team Foundation
Build tools: Ant, maven, gradle, MSBuild, Nant, Rake
Unit Testing frameworks: JUnit, NUnit, Selenium, CppUnit, TestNg, XUnit
Code Coverage tools: Clover, Cobertura, Emma, Serenity, Sonar, NCover, Jacoco
Code Analysis Tools: Checkstyle, PMD, Dry, Findbugs, Warnings, CCM, Violations
Security Tools: LDAP, Active Directory, Crowd, OpenID
Applications servers: Weblogic, Glassfish, Tomcat, JBoss, IIS, JRebel
Virtual Environment: EC2, Virtual Box, VmWare, JCloud
Social communication: E-mail, IRC, Jabber, SMS, Twitter
Hudson Best Practices

Continuous Integration with automated test execution has seen broad adoption in recent years. The ideas behind Continuous Integration have changed how companies look at Build Management, Release Management, Deployment Automation, and Test Orchestration. This section provides a set of best practices for Hudson - A Continuous Integration Solution to provide executives, business managers, software developers and architects a better sense of the development progress and code quality of projects throughout the development lifecycle. (View Hudson Best Practices)

Introductory Articles

Short Introductory Video on Hudson by Susan Duncan
http://linsolas.developpez.com/articles/hudson/ (French)
http://www.slideshare.net/carlo.bonamico/continuous-integration-with-hudson/
Installation

Hudson provides native packages as well as a simple war file to install in a servlet container or run from directly. Check out Installing Hudson for more details.
    
</entry>
<entry [Wed 2014:09:10 03:03:36 EST] INSTALL BAMBOO>

1. CREATE DATABASE

sudo -s -H -u postgres

# Create the Bamboo user:
/opt/PostgreSQL/8.4/bin/createuser -S -d -r -P -E bamuser

# Create the Bamboo database:
/opt/PostgreSQL/8.4/bin/createdb --owner bamuser --encoding utf8 bamboo


2. INSTALL BAMBOO

mkdir -p ~/software/atlassian
cd ~/software/atlassian
wget http://www.atlassian.com/software/bamboo/downloads/binary/atlassian-bamboo-5.6.1.tar.gz

(warning) Please use the Bamboo version specified in this documentation. If the download centre shows a Bamboo version later than 5.3, click downloads archive and get Bamboo 5.3. 
Why? We have tested the integration suite with this version. There is a chance that you will have problems integrating the other applications if you use a different version.
Unpack the tar.gz archive into a directory of your choice, avoiding spaces in the directory name.
Tell Bamboo where to put its Bamboo Home directory:
Edit the properties file at {BAMBOO_INSTALLATION}/atlassian-bamboo/WEB-INF/classes/bamboo-init.properties.
Insert the property 'bamboo.home' with an absolute path to your Bamboo Home directory. For example:
bamboo.home=/var/bamboo-home
Save the file.
Because Bamboo will be running on the same machine as JIRA, you need to ensure that the URL paths are different for Bamboo and JIRA. Change the default Bamboo path as follows:
Edit the server.xml file in your {BAMBOO_INSTALLATION}\conf folder.
Set the path attribute to /bamboo in the context  element:

<!--

<Context path="/bamboo" docBase="${catalina.home}/atlassian-bamboo" reloadable="false" useHttpOnly="true">

-->


Start your Bamboo server by going to {BAMBOO_INSTALLATION} and running ./bin/start-bamboo.sh.


</entry>
<entry [Tue 2014:09:09 20:59:33 EST] LINODE aguadev.org CONTENT>



Agua is a workflow and genomic visualization platform for running highly scalable high performance computing analyses in the Amazon Elastic Compute Cloud (EC2). Agua features pre-configured analysis pipelines for Next Generation Sequencing (NGS) data and enables users to easily and rapidly create custom analyses. For an overview of Agua, please see the Introduction.


AGUA

What is Agua?
Agua is a workflow and genomic visualization platform for running highly scalable high performance computing analyses in the Amazon Elastic Compute Cloud (EC2). Agua features pre-configured analysis pipelines for Next Generation Sequencing (NGS) data. Custom analyses can also be easily configured. See the Introduction for more details.

Who is it for?
Agua is about empowering two types of people:

Non-technical Users who want to run complex analyses without having to set up a bioinformatics/IT department

Advanced Users who need to save time constructing new pipelines and managing/maintaining existing ones

For further information regarding Agua and its functionality, please see Frequently Asked Questions . The How To section describes how to use Agua and the Developers section describes how to modify and contribute to it.

How do I get it?
Please see the Get It section of this website.


INTRODUCTION
Introduction
The increasingly data-driven nature of the life sciences provides the motivation for harnessing the computational power of cloud computing to tackle important biological questions. Cloud computing allows the user to start up as many computers as needed for an analysis, pay for them by by the hour and then switch them off when the work is done. However, this democratization of computational access is hindered by the technical hurdles of setting up and managing cloud resources. Agua simplifies cloud computing by integrating an intuitive, drag-and-drop web interface with a framework for running workflows on instantly created private clusters within the EC2 cloud.

Workflows
Workflows can be created and run using simple drag and drop controls. Users can create new pipelines using Agua's pre-installed application components and can add their own custom applications to workflows. Custom workflows can be easily created and Agua also enables workflow sharing for improved verification of bioinformatics procedures.

Applications
Users can add new applications easily to the existing suite of applications. These custom applications can be configured to 'recognize' their inputs from the outputs of preceding applications in a workflow. Agua's Input/Output model allows users to fashion coherent and flexible input-output rules for almost any collection of applications.

Groups
Teams of users can share pipelines in the EC2 cloud and manage data access with user-defined groups. Users can flexibly create groups, add members to groups and share data analysis pipelines and results with group members. Multi-level access privileges can be allocated to group members and to users in the general public.

Cloud computing
Agua workflows can be run locally on the head node (where Agua is installed) or on StarCluster cloud node clusters. Once a cluster workflow is started, the StarCluster begins to auto-scale itself, adding new nodes to the cluster when the number and average duration of jobs is high and removing nodes when demand slacks off. The user can preconfigure the minimum and maximum number of nodes for each StarCluster tailored to each workflow. The user can also change the minimum and maximum number of nodes while the workflow is in progress to best suit their budget and time constraints.

Genomic Viewer
Using Agua's default pipelines, Next Generation Sequencing data can be processed and viewed in the built-in JBrowse genome viewer. JBrowse employs the same technology as Google-Maps to allow the user to scan through the genome, zooming in and out in real time.

FAQ

Frequently Asked Questions
Can I install a local copy of Agua?

Agua is designed for use on a computing cluster using a job scheduler: either LSF (Load Sharing Facility), PBS (Portable Batch System) or SGE (Sun Grid Engine), and will also run on a single host. You can download the source code and run the config.pl file inside the bin/scripts directory to configure the installation step-by-step for single-host or cluster mode.

System requirements are minimal: Apache and MySQL on Linux, approximately 512MB of RAM, 1GB of disk space for Agua and an additional 1. Agua's full functionality is supported on Centos 5.4 but it will also work on other flavors of Linux such as MacOSX and Ubuntu, and will also work on Windows.

Can I customize the applications available for workflows?

The administrative user inside the Agua account system can add additional applications that have been made available to the 'aqua' user account on the operating system. During the Agua installation process, you will be prompted for the name of the Administrator account (default: 'admin'). The Administrator can add/remove/edit workflow applications as desired by using the 'Apps' pane of the 'Admin' page.

What kind of sequences can you use? 
The most commonly used NGS sequencing platforms are supported: Illumina/Solexa, AB/SOLiD and Roche/454.

How do I share my data?
In the 'Access' tab of the Admin pane, you can configure sharing of your workflows and data with other users.

What license is Agua released under?
All Agua components are open source and free for academic/non-profit organisations.

What is the maximum amount of data I can have in my Agua account?

Your Agua data is stored in the '.Agua' directory inside your CCS home folder. The maximum amount of data you can store in your CCS home folder depends on which group you belong to. Non-MIHG users belong to a CCS group (the Group Name in the New User form).

For non-MIHG users, the standard quota for a group is 1 TB shared among all members of the group, which means that the amount of data you can store depends on how much the other members of your group have in their home folders. Once the total data for a group has exceeded 1 TB (the soft limit), the group has 7 days to reduce the total below 1 TB, after which data will be arbitrarily removed if the total amount exceeds 1 TB. The total data storage for a group cannot exceed 1.1 TB even temporarily (hard limit). You can check your disk usage status by typing on the command line: mmlsquota -g GROUPNAME, where GROUPNAME is the name of your group.

All MIHG users are treated as one group and have their home directories in the /mihg/users partition. Storage for the whole group is limited to the available space in that partition.

Maximum file size
What is the maximum size of data files?

There is no restriction on the size of data files provided the total data size does not exceed the limits described above.

Saved workflows
How long will my workflows and data be stored in Agua?

When you run workflows in Agua, your generated data and the workflow configurations you used are stored to the database. You can recall stored workflows and analysis data and these will be stored in Agua unless you delete them. Your data is stored in your home folder and can only be deleted by you on the command line, or in Agua by yourself or by users who you have allowed 'write' access (on a group-by-group basis) using the 'Access' pane of the 'Admin' page.

If you delete a workflow using the 'Delete' menu option in the 'Workflow' page, the workflow and history and all of its associated data will be instantly removed from disk. You then have 30 days within which to retrieve your deleted data from the data backup tape archive, which generates a backup of all home folders every night.

Why is it called 'Agua'?
It's an acronym: Automated Genomics Utilities Agent


PURPOSE AND AIMS

Due to exponentially increasing data volumes from NextGen (next generation) sequencing technologies there is a bioinformatics bottleneck at the analysis stage of biomedical research. There is an urgent need for easy-to-use and widely-accessible tools to accomplish complex bioinformatics tasks that are increasingly composed of multiple interdependent steps. Visualization tools are also needed that are capable of handling the millions of reads produced by NextGen and integrating databases of genomic features.

Figure 1 shows the capabilities and limitations of currently available genome viewers and bioinformatics workflow tools compared to the current and future versions of Agua. Current genome viewers are limited by their technologies. For example, mainstream genome browsers by such as the UCSC Genome Browser, Ensembl Genome Browser and the Generic Genome Browser (GBrowse) employ the traditional thin client-server paradigm with its inherent speed and interactivity constraints. For these browsers, every time the user selects a different view of a genome, the browser must download a new image file from the server so the user experience is highly dependent on Internet connectivity and transfer speeds. Using image files also brings with it implicit constraints on interactivity with the graphical representation and its underlying data set. Alongside these drawbacks, both UCSC and Ensembl provide access to large and diverse sets of genome features which are integrated into the genome view.


IMAGE: Genome-viewers-and-workflow-tools.v1.PNG

Figure 1. Functionalities of genome browsers and workflow tools

The Java-based Integrative Genome Viewer (IGV) has slightly improved interactivity but depends on having a Java runtime environment installed on the client. The Java-based genome annotation package, Apollo, also has better interactivity than traditional web page genome browsers but only limited capability for web-based data sharing and access and for integrating external genome feature sets.

AJAX GBrowse breaks with tradition by using asynchronous data transport (where the web page is not reloaded), on-demand loading and nested container lists for quick searching to provide a fast-rendering DHTML display of genomic features. The DHTML paradigm lends itself to much greater interactivity, because it allows access to the DOM (Document Object Model) using Javascript. Furthermore, AJAX GBrowse is based on the open-source and well-supported Dojo Javascript Toolkit which contains many useful tools for rapid web application development.

Functional requirements
The following list of requirements encompasses the functionality envisaged for the workflow and genome view tool, henceforth referred to as Agua (Automated Query and Workflow Agent).
Functional Requirements

Low barriers to usage
Web access
Intuitive interface
Plug 'n play applications for rapid deployment
Searchable project annotations
Workflows
Predefined workflows (transcriptome, variation annotation, gene networks, file conversion utilities, ID conversion utilities, etc.)
Customizable workflows
Drag 'n drop workflows
Persistent data and workflow configurations
Loops, conditional branching
Reports - customizable report extraction from workflow output
Views
Customizable genomic views of report data
Interactive display with rich context menu
Integrated, extensible genomic features
Multiple feature views - nucleotide level to aggregate high-level view
Fast view update
User can filter view based on data
Genomic feature-level annotation by user
Sharing
User-defined groups with customizable permissions
Workflow, report and view sharing among groups
Input/Output and execution
Import external biological data and genomic features into workflow
Integration with external software (e.g., Cytoscape, R, GeneSet Analyzer)
Programmatic remote access (API and Web Service)
Cluster execution
Grid execution
Maintain state (action history)
Data management - direct user access to input and output files
Information regarding data provenance (Simmhan, 2005) is retained in the system to identify the source of data throughout the workflow such as the owner, author application, creation and modification dates, and content type. In addition, a log is kept of all project changes and updates. The user can also annotate the project at all levels and search these annotations. Agua is similar to the laboratory notebook paradigm employed by the BCJ (Bioinformatics Computational Journal) workflow tools (Feagan, 2007) but has a wider the range of functionality. Agua's functional requirements largely encompass those for a proposed 'genome wiki'9Salzberg, 2007) intended to facilitate cooperative genome annotation by a community of experts, reflecting Agua's utility to the wider genomics community as an accurate, continually updated source of genome annotation. Agua's genome viewer functionality incorporates the AJAX-enabled JBrowse genome viewer (http://jbrowse.org) to provide a fast, fluid and responsive genome browser interface. 
(Figure 2).

IMAGE: SDD-view-browse.PNG

References

Simmhan Y, Plale B, Gannon D. A survey of data provenance in e-science. SIGMOD Record. 2005;34(3):31 - 6.

Feagan L, Rohrer J, Garrett A, Amthauer H, Komp E, Johnson D, et al. Bioinformatics process management: information flow via a computational journal. Source Code for Biology and Medicine. 2007;2(1):9.

Salzberg S. Genome re-annotation: a wiki solution? Genome Biology. 2007;8(1):102.



    
</entry>
<entry [Tue 2014:09:09 17:50:07 EST] CONFIGURE CONFLUENCE 5.6.1 ON digi01>

1. JIRA FOR USER MANAGEMENT

    OK

 
2. SET NAVIGATION BAR




    
</entry>
<entry [Tue 2014:09:09 15:46:14 EST] ADD SWAP TO digi01>

https://www.digitalocean.com/community/tutorials/how-to-add-swap-on-ubuntu-12-04

How To Add Swap on Ubuntu 12.04

About Linux Swapping

Linux RAM is composed of chunks of memory called pages. To free up pages of RAM, a “linux swap” can occur and a page of memory is copied from the RAM to preconfigured space on the hard disk. Linux swaps allow a system to harness more memory than was originally physically available.

However, swapping does have disadvantages. Because hard disks have a much slower memory than RAM, virtual private server performance may slow down considerably. Additionally, swap thrashing can begin to take place if the system gets swamped from too many files being swapped in and out.

1. VERIFY NO SWAP FILES PRESENT




An empty list will confirm that you have no swap files enabled:

Filename				Type		Size	Used	Priority


2. VERIFY SPACE AVAILABLE

SWAP FILE SIZE: 4 GB

df -ah

    Filesystem      Size  Used Avail Use% Mounted on
    /dev/vda1        40G  4.1G   34G  11% /
    proc               0     0     0    - /proc
    sysfs              0     0     0    - /sys
    none            4.0K     0  4.0K   0% /sys/fs/cgroup
    none               0     0     0    - /sys/fs/fuse/connections
    none               0     0     0    - /sys/kernel/debug
    none               0     0     0    - /sys/kernel/security
    udev            991M  4.0K  991M   1% /dev
    devpts             0     0     0    - /dev/pts
    tmpfs           201M  352K  200M   1% /run
    none            5.0M     0  5.0M   0% /run/lock
    none           1001M     0 1001M   0% /run/shm
    none            100M     0  100M   0% /run/user
    none               0     0     0    - /sys/fs/pstore
    systemd            0     0     0    - /sys/fs/cgroup/systemd


3. CREATE SWAP


# CREATE SWAPFILE
sudo dd if=/dev/zero of=/swapfile bs=1024 count=4000k
    4096000+0 records in
    4096000+0 records out
    4194304000 bytes (4.2 GB) copied, 24.2201 s, 173 MB/s

# SET LINUX SWAP
sudo mkswap /swapfile
    Setting up swapspace version 1, size = 4095996 KiB
    no label, UUID=07ed0a05-cb38-485f-9432-34598d2e36a9


# ACTIVATE SWAP
sudo swapon /swapfile


# VERIFY SWAP
swapon -s
    Filename				Type		Size	Used	Priority
    /swapfile                               file		4095996	0	-1

# MAKE SWAP PERMANENT
EDIT /etc/fstab ADD LINE

/swapfile       none    swap    sw      0       0 

4. SET SWAPPINESS 10
(swap acts as an emergency buffer, preventing out-of-memory crashes)

cat /proc/sys/vm/swappiness
    60
    
echo 10 | sudo tee /proc/sys/vm/swappiness

cat /proc/sys/vm/swappiness
    10

cat /etc/sysctl.conf
    ...
    # Digital Ocean Recommended Settings:
    net.core.wmem_max=12582912
    net.core.rmem_max=12582912
    net.ipv4.tcp_rmem= 10240 87380 12582912
    net.ipv4.tcp_wmem= 10240 87380 12582912


echo vm.swappiness = 10 | sudo tee -a /etc/sysctl.conf

    
cat /etc/sysctl.conf
    ...
    # Digital Ocean Recommended Settings:
    net.core.wmem_max=12582912
    net.core.rmem_max=12582912
    net.ipv4.tcp_rmem= 10240 87380 12582912
    net.ipv4.tcp_wmem= 10240 87380 12582912
    
    vm.swappiness = 10


5. SET PERMISSIONS

sudo chown root:root /swapfile 
sudo chmod 0600 /swapfile


6. USE SWAP

START JIRA (CONFLUENCE ALREADY STARTED AND USING MOST OF MEMORY)

/opt/atlassian/jira/6.3.4/bin/start-jira.sh
    
    OK
    
VERIFY SWAP USAGE

top

    %Cpu(s): 66.3 us,  2.8 sy,  0.0 ni, 30.7 id,  0.2 wa,  0.0 hi,  0.0 si,  0.0 st
    KiB Mem:   2050032 total,  1984568 used,    65464 free,     1576 buffers
    KiB Swap:  4095996 total,   115752 used,  3980244 free.    36344 cached Mem

    
</entry>
<entry [Tue 2014:09:09 14:32:13 EST] INSTALL CONFLUENCE 5.6.1 ON digi01>


1. CREATE confluence DATABASE AND USER
2. INSTALL CONFLUENCE 5.3.4
3. CONFIGURE CONFLUENCE IN BROWSER


1. CREATE confluence DATABASE AND USER

#### DROP confluence DATABASE IF EXISTS
sudo -u postgres dropdb confluence

#### DROP confuser USER IF EXISTS
sudo -u postgres dropuser confuser

#### CREATE CONFLUENCE USER
sudo -u postgres createuser -S -d -r -P -E confuser

  -S, --no-superuser        role will not be superuser (default)
  -d, --createdb            role can create new databases
  -r, --createrole          role can create new roles
  -P, --pwprompt            assign a password to new role
  -E, --encrypted           encrypt stored password

  
**** IMPORTANT, MUST DO THIS EVEN THOUGH SET PASSWORD IN PREVIOUS STEP ****
#### SET CONFLUENCE USER PASSWORD 
sudo -u postgres psql postgres
\password confuser
    r@spberry1
\q

	
#### CONFIRM confuser ROLE
sudo -u postgres psql -tAc "SELECT 1 FROM pg_roles WHERE rolname='confuser'"
    1

sudo -u postgres psql -tAc "SELECT * FROM pg_roles WHERE rolname='confuser'"
	confuser|f|t|t|t|f|t|f|-1|********|||18489



#### CREATE CONFLUENCE DATABASE
sudo -u postgres createdb --owner confuser --encoding utf8 confluence





2. INSTALL CONFLUENCE 5.3.4

INSTALLATION SETTINGS

Installation Directory: /opt/atlassian/confluence/5.3.4 
Home Directory: /var/atlassian/application-data/confluence 
HTTP Port: 8090 
RMI Port: 8000 


DOWNLOAD AND INSTALL

mkdir -p ~/software/atlassian
cd ~/software/atlassian
wget http://www.atlassian.com/software/confluence/downloads/binary/atlassian-confluence-5.6.1.tar.gz
tar xvfz atlassian-confluence-5.6.1.tar.gz

mkdir -p /opt/atlassian/confluence
mv atlassian-confluence-5.6.1 /opt/atlassian/confluence/5.6.1



3. CHANGE PORT IF CLASH WITH JIRA ON 8080

JIRA IS ALREADY INSTALLED AND USES PORT 8080

CHECKED IF NEED TO EDIT CONFLUENCE server.xml TO CHANGE THE DEFAULT PORT BUT WAS ALREADY SET AT 8000 AND 8090 SO NO CONFLICT WITH JIRA

emacs /opt/atlassian/confluence/5.6.1/conf/server.xml

<!--

<Server port="8000" shutdown="SHUTDOWN" debug="0">
    <Service name="Tomcat-Standalone">
        <Connector className="org.apache.coyote.tomcat4.CoyoteConnector" port="8090" minProcessors="5"
                   maxProcessors="75"
                   enableLookups="false" redirectPort="8443" acceptCount="10" debug="0" connectionTimeout="20000"
                   useURIValidationHack="false" URIEncoding="UTF-8"/>

-->


4. SPECIFY CONFLUENCE HOME DIRECTORY IN FILE confluence/WEB-INF/classes/confluence-init.properties

MAKE CONFLUENCE HOME (DATA) DIR

mkdir -p /var/atlassian/application-data/confluence/5.6.1

EDIT FILE

/opt/atlassian/confluence/5.6.1/confluence/WEB-INF/classes/confluence-init.properties

ADD LINE

confluence.home=/var/atlassian/application-data/confluence/5.6.1


.... TO AVOID THIS ERROR WHEN BROWSE TO CONFLUENCE WEB PAGE

	Confluence Home directory specified: 
	There was an error creating the Confluence Home directory. The most common cause is you haven't specified it. To fix this, simply specify a directory in the file /confluence/WEB-INF/classes/confluence-init.properties.


START CONFLUENCE

#/opt/atlassian/confluence/5.6.1/bin/shutdown.sh
/opt/atlassian/confluence/5.6.1/bin/startup.sh

	To run Confluence in the foreground, start the server with start-confluence.sh -fg
	executing as current user
	If you encounter issues starting up Confluence Standalone, please see the Installation guide at http://confluence.atlassian.com/display/DOC/Confluence+Installation+Guide

	Server startup logs are located in /opt/atlassian/confluence/5.6.1/logs/catalina.out
	Using CATALINA_BASE:   /opt/atlassian/confluence/5.6.1
	Using CATALINA_HOME:   /opt/atlassian/confluence/5.6.1
	Using CATALINA_TMPDIR: /opt/atlassian/confluence/5.6.1/temp
	Using JRE_HOME:        /usr/share/jdk1.7.0_45
	Using CLASSPATH:       /opt/atlassian/confluence/5.6.1/bin/bootstrap.jar
	Using CATALINA_PID:    /opt/atlassian/confluence/5.6.1/work/catalina.pid






6. CONFIGURE CONFLUENCE IN BROWSER

http://184.169.161.14:8090

GENERATE LICENSE

	AAABBw0ODAoPeNptkMlOwzAQQO/+CkucjRw3LRDJh+BENFIWaMoFcTFhCpYSJ/ISkb8nbSlQxGGkW
	d7ojeai9hqX/YhZiGkQLVdRcIVFvcWMBguUgG2MGpzqNRe93rUedAPPEU5H2Xq57yNh4JAk0gHfb
	5EgICxEzcxfysapEbgzHtDPzrE+ALlqQFvYTgOUsgMuqqJINyKLc1RIpR1oORvTj0GZ6ZeBfRtK3
	72AqXai9daBKftXsJyiyrxJrexRF2stFa6nGegsqsGMYLKE326oIOsyviPx8mFFntbXFNVpyecg+
	YLdUEZD9HXgjOdZcjY50z9aMJaT4MT/f/G9N827tPD3V5/5fnxzMC0CFFNI7fJWrz6HMLuf4unyV
	FOkOWrxAhUAikdgkcXYqZt65hpSF5EZZ0tmrWM=X02dh

'Choose Installation Type' --> Production Installation

'Choose a Database Configuration' --> PostgreSQL database --> External Database

'External Database' --> PostgreSQL --> External Database

'Configure Database' --> Direct JDBC Connection


Enter the following information:

Driver Class Name:      org.postgresql.Driver – This is the default value.

Database URL:           jdbc:postgresql://localhost:5432/confluence – This is the default value.

Username:               confuser – This is the user you created in step 1 (above).

Password                – Enter the password that you chose in step 1 (above).

Click the Next button. You might need to wait a few minutes while Confluence sets up its database.



'Load Content'	--> Example Site


'User Management Setup' --> Connect to JIRA.

JIRA Server Location – http://184.169.161.14:8080
JIRA Administrator Login Username: jirauser
Password – r@spberry1

Leave the other fields (the 'advanced options') at their default values:

Confluence Base 	URL	http://184.169.161.14:8090
This is a required field JIRA will use this URL to access your Confluence server. If Confluence is behind a proxy, you may need to change the URL given here.

User Groups 		jira-users
Users in these groups will have access to Confluence. Comma-separated.


Admin Groups		jira-administrators


'Load users and groups from JIRA' screen - informing you that Confluence has created an administrative account for Charlie, to match his JIRA account. Click Next.


The 'Confluence Setup Successful' screen will appear. Click Start using Confluence.
If the 'What's new in Confluence' popup window appears, select Don't show again and click Close.
The home page of the Confluence 'Demonstration Space' will appear.


Finally, you need to change your Confluence base URL to the full web address at which Confluence is running, and enable the remote API:

Open the Browse menu at the top of the screen and select Confluence Admin. Confirm your password when prompted. This is Charlie's password in Confluence, and is the same as his password in JIRA.
The 'Administration Console' screen will appear. Click General Configuration under 'Configuration' in the left-hand panel.


The 'General Configuration' screen will appear. Click any of the Edit links.
In the Server Base Url field, enter the full website address at which Confluence is running. This address should not be 'localhost'. For example, if your computer name is 'coopers' then the server base URL should be: http://coopers:8090/confluence. Alternatively, specify a website address such as http://www.foobar.com:8090/confluence.
Click the check box next to Remote API (XML-RPC & SOAP), to enable the remote API.
Scroll down to the end of the page and click Save.

    OK


    
</entry>
<entry [Tue 2014:09:09 14:09:55 EST] INSTALL JIRA CAPTURE ON digi01>

1. BROWSE TO JIRA

http://107.170.219.63:8080


2. INSTALL JIRA CAPTURE

TOP MENU --> Add-ons  --> Find new addons--> JIRA Capture --> Free Trial

ENTER Atlassian ID details to obtain and apply an evaluation license from Atlassian.

CLICK Get Started --> Get the JIRA Capture Extension


3. CONFIGURE CONNECTION TO JIRA

**** NOT IN 'CONFIGURE' OPTION IN PLUGIN PANEL ****


JIRA Capture icon  -->  ??? WHERE IS THIS ICON ????


server url  http://107.170.219.63:8080
username    aguaadmin
password    r@spberry1



https://confluence.atlassian.com/display/ATLAS/Dragons+Stage+2+-+JIRA+Add-Ons#DragonsStage2-JIRAAdd-Ons-Step3.InstallJIRACapture

    
</entry>
<entry [Tue 2014:09:09 14:02:52 EST] CONFIGURE JIRA 6.3.4 GENERAL SETTINGS ON digi01>

1. SET JIRA GENERAL CONFIGURATION

TOP RIGHT admin COG --> System

    CAPTCHA on signup	ON
    Base URL	http://107.170.219.63:8080
    Accept remote API calls		YES
    Allow unassigned issues 	YES
    Enable HTML in project descriptions YES




2. UPDATE AGILE PLUGIN

Manage addons --> Agile --> Update

    OK


8. ADD USER GROUPS
Add the groups that you will need later for Confluence and Bamboo

(TOP RIGHT) ADMINISTRATION COG --> (TOP LEFT) User Management --> (LEFT) Groups

Add Group -->
	
confluence-users
confluence-administrators
bamboo-admin

MAKE SUPERUSER/ADMIN AN administrator in Confluence and Bamboo by adding him to the relevant groups:

(TOP RIGHT) Bulk Edit Group Members --> Left-hand box - select three groups:

bamboo-admin
confluence-administrators
confluence-users

Right-hand box under Add members to selected group(s), enter the username:

admin

Click 'ADD SELECTED USERS'.

SUPERUSER/ADMIN name will appear in the middle box as a group member of the selected groups.


9. CREATE A JIRA PROJECT (INSTALL JIRA AGILE)

(TOP LEFT) Projects --> Create Project --> INSTALL JIRA AGILE 



In this step you will create some data in JIRA, including a project and an issue, for use in the subsequent stages of this integration procedure. Then you will create your own JIRA dashboard with a couple of gadgets. For this procedure, you need to be logged in as JIRA Admin.

CREATE PROJECT

Click Projects > Projects in the top menu.

PROJECT: TEST
KEY: TEST

Hint: Try JIRA's quick search instead of the menus. Press g g on your keyboard then start typing 'projects' into the Administration Search box. If you like, you can use the quick search from this point onwards.


ADD VERSION

(TOP LEFT) Versions --> Create Version

Name: 1.0
Description: Version 1.0

Name: 2.0
Description: Version 2.0


CREATE AN ISSUE FOR THE PROJECT

(TOP LEFT) Issues --> Create Issue

Project: TEST
Issue Type: Bug
Summary: test issue
Affects Version/s: 1.0
Assignee – Click Assign to Me (SUPERUSER/ADMIN)
Original Estimate: 1d


CREATE A DASHBOARD FOR THE PROJECT
Create a new dashboard for all your TEST PROJECT-related tasks, issues and general fire fighting

(TOP LEFT) Dashboards --> Manage Dashboards --> Create New Dashboard

Name: Test dashboard
Description: Description of test dashboard

Leave the other fields at their default values


ADD A GADGET TO THE DASHBOARD

(TOP LEFT) Dashboards --> Manage Dashboards

Click on the dashboard name to edit it. You can now add gadgets.

	The 'Gadget Directory' will appear, showing a list of the available gadgets
	Enter 'projects' into the search box at top right of the gadget directory.
	The list of gadgets will change, to show only the gadgets that match your search term
	Find the 'Projects' gadget and click Add it Now.
	Find and add the 'Assigned To Me' gadget in the same way.

	
	

	Drag the 'Assigned to Me' gadget to the top right of your dashboard

	Configure the 'Projects' gadget to point to your 'TEST' project: 
		Select 'TEST' from the Projects list --> SAVE
		Leave the default values as configured for View and Number of Columns.
		Click the dropdown arrow next to Refresh Interval and select Every 15 Minutes.
		Click Save.

	Configure the 'Assigned to Me' gadget:
		Leave the default values for Number of Results and Fields to display.
		Refresh Interval --> Every 15 Minutes.
		Click Save.



    

    
</entry>
<entry [Tue 2014:09:09 11:37:39 EST] CONFIGURE JIRA 6.3.4 ON digi01>

1. BROWSE TO JIRA

107.170.219.63:8080

    
Application Title   Annai Systems
Mode                Public
Base URL            http://ec2-204-236-179-50.us-west-1.compute.amazonaws.com:8080


2. CONFIGURE DATABASE

Choose your server language.
Enter the following information to configure the database connection:
Database Connection: External
Database Type: PostgreSQL
Hostname – localhost
Port – Enter the default port that you set up for PostgreSQL: 5432
Database – This is the name of the database that you created in step 3 above: jira
Username – This is the user you created in step 3 above: jirauser
Password – Enter the password you chose in step 3 above.
Schema – Leave this at the default setting: public
Click the Test Connection button to test the connection settings.


3. USER DETAILS AND LICENCE

    Application Title: 		Agua
    Mode – Accept the default mode: Public
    Base URL – 107.170.219.63:8080

Enter the full website address at which JIRA is running, not just 'localhost'. For example, if your computer name is 'coopers' then the base URL should be: http://coopers:8080. Or specify a website address, such as http://www.foobar.com:8080.

License Key – If you do not already have a JIRA license, follow the prompts on the setup wizard screen to get an evaluation license key.

ADDING YOUR LICENSE KEY

SERVER ID

BBHQ-VR03-W70E-1CTN

LICENSE KEY (*** OUT OF DATE ***)

#        AAABTg0ODAoPeNplUVtLwzAUfs+vCPiiDxlptyobBHRtwMpsZ9tNBEFidzYjbVrSZLh/by8rDnzIy
#        8n5rucqs4BTqDGdY2e6mDkL6mE/yLBLnRkKoMm1rI2sFHsKkwd8nYI+gr7BG1XIUhrY4U0Dunlf4
#        LgGhdPK6hzwSuagGkC+BtGBA2GAdYyEzolDkV8pI3ITiRJYaqzQBr9VVh3Qt9RickbzneyFeZTxZ
#        J2EKR9x/FnIgjU9sD51wPtD2Y4meVUifhSF7VXZXhStiUvO7FRDrxqvefSRxpvE58NCSyuPwIy2g
#        IphedsG62hc1OopA0qoHPhPLfVpDDQldEZcimJ9EEo2g+z/RJEtP0HH+74rRhyU8oi1j7iud+t4H
#        hpqDQO2XD6+kG1Cp+T1jnLi+FmEzt7b31UYXKLGov4s2fEsaN0e4ks0MDp1z05/AamPpP4wLQIVA
#        JbtXvUz+nu4C4SpfNr85OHSM+P6AhRRpGp6jrkIx3ynTKh3n0aO3rmjrw==X02gk


EVALUATION LICENSE (*** DID NOT ACCEPT ***)

AAABCg0ODAoPeNptkD9vgzAQxXd/Cktd2oEKUkgaJAYEHqj4EwHt1MWlF2KJGOuMUfPtCyFR2qrDL
fd7997T3dUGaAWK2lvqPPnexnc3NIprurIdl8SgGxRqEL0MXpIypGErOqD3FeAI+ED3PdJ5/+5TN
vLO8FlJcnP8ACz2rxpQB5ZDIoQzifkAwWxs2VvLscntJhjQAGkRQB56pQAfU9GA1MA+xZmzvGblr
kwqRrqFvE3mM1mRjAs5gOSyAfalBJ5uOY495/z0hUmKCoWGJbPAlkuhlxZha/gvNW8GMV6UFcuDa
azU9bzn9dol14r/Zl5gfVKQ8yMEUZFlrIySMCU7g82Ba/j7jm/Lr4J5MCwCFDgw0ezZvnBYmvkxW
uwchHe6hKt9AhRrVyAWsWFukQwaMdqtW5pag9Kakw==X02dl


4. SUPERUSER/ADMIN ACCOUNT 
Specify the administrator account. This will be your JIRA super user:

    Username: aguaadmin
    Password: r@spberry1
    Full name: Stuart Young
    Email:	stuarty@annaisystems.com



6. SET UP EMAIL

    CONFIRMED aguadev@gmail.com



7. CONFIRM NEW INSTALLATION --> PROCEED UNDER EVALUATION TERMS



8. RESTART JIRA

/opt/atlassian/jira/6.3.4/bin/stop-jira.sh
/opt/atlassian/jira/6.3.4/bin/start-jira.sh




</entry>
<entry [Mon 2014:09:08 13:50:15 EST] INSTALL JIRA 6.3.4 ON digi01>

1. INSTALL JAVA


MANUAL DOWNLOAD jdk-7u40-linux-x64.tar.gz

http://www.oracle.com/technetwork/java/javase/downloads/jdk7-downloads-1880260.html

mkdir -p ~/software/java
cd ~/software/java
tar xvfz jdk*
mv jdk1.7.0_45 /usr/share


#### UPLOAD TO digi
cd ~/software/java
scp jdk-7u67-linux-x64.tar.gz vesi@107.170.219.63:


#### ON digi
mv jdk-7u67-linux-x64.tar.gz /usr/share


2. SET JAVA_HOME ON digi

digi
emacs ~/.profile

export JAVA_HOME=/usr/share/jdk1.7.0_67


3. INSTALL POSTGRESQL
http://www.ubuntugeek.com/how-to-install-postgresql-9-2-on-ubuntu-server-using-ppa.html

#### INSTALL DEPENDENCIES
sudo apt-get install -y libpq-dev

#### CREATE FILE
emacs -nw  /etc/apt/sources.list.d/pgdg.list
deb http://apt.postgresql.org/pub/repos/apt/ trusty-pgdg main

#### IMPORT REPO KEY
sudo apt-get install wget ca-certificates
wget --quiet -O - https://www.postgresql.org/media/keys/ACCC4CF8.asc | sudo apt-key add -
sudo apt-get update


#### INSTALL POSTGRESQL
sudo apt-get upgrade
sudo apt-get install postgresql-9.3 pgadmin3


#### SET PASSWORD
sudo -u postgres psql postgres

\password postgres
    r@spberry1

#### EXIT postgres PROMPT
Control + D


4. CREATE JIRA DATABASE

##LOGIN 
##sudo -s -H -u postgres

#### DROP jirauser USER IF ALREADY CREATED
sudo -u postgres dropuser jirauser
sudo -u postgres dropuser jirauser

#### CREATE JIRA USER
sudo -u postgres createuser -S -d -r -P -E jirauser

Enter password:
    r@spberry1

  -S, --no-superuser        role will not be superuser (default)
  -d, --createdb            role can create new databases
  -r, --createrole          role can create new roles
  -P, --pwprompt            assign a password to new role
  -E, --encrypted           encrypt stored password


#### CONFIRM JIRA ROLE
sudo -u postgres psql -tAc "SELECT 1 FROM pg_roles WHERE rolname='jirauser'"
    1

sudo -u postgres psql -tAc "SELECT * FROM pg_roles WHERE rolname='jirauser'"
    jirauser|f|t|t|t|f|t|f|-1|********|||16384


#### DROP jira DATABASE IF EXISTS
sudo -u postgres dropdb jira

#### CREATE jira DATABASE
sudo -u postgres createdb --owner jirauser --encoding utf8 jira


4. DOWNLOAD AND INSTALL JIRA

#### CREATE JIRA_HOME AND INSTALLATION DIRECTORY
mkdir -p /var/atlassian/application-data/jira
mkdir -p /opt/atlassian/jira

mkdir -p /home/vesi/software/atlassian
cd /home/vesi/software/atlassian

wget http://www.atlassian.com/software/jira/downloads/binary/atlassian-jira-6.3.4.tar.gz
tar xvfz atlassian-jira-6.3.4.tar.gz
mv atlassian-jira-6.3.4-standalone /opt/atlassian/jira/6.3.4


	INSTALL DIR: 		/opt/atlassian/jira 
	HOME (DATA) DIR: 	/var/atlassian/application-data/jira 
	HTTP Port: 			8080 
	RMI Port: 			8005 


#### SET JIRA_HOME AND JAVA_HOME
emacs ~/.profile

export JAVA_HOME=/usr/share/jdk1.7.0_67
export JIRA_HOME=/var/atlassian/application-data/jira


#### LINK JAVA
ln -s /usr/share/jdk1.7.0_67/bin/java /usr/bin/java


#### START JIRA

/opt/atlassian/jira/6.3.4/bin/start-jira.sh

    OK

WHICH POPULATES THE INSTALLATION DIR:

ll /var/atlassian/application-data/jira
    
    drwxr-xr-x 3 root root 4096 Sep  9 09:36 caches
    drwxr-xr-x 3 root root 4096 Sep  9 09:36 data
    drwxr-xr-x 2 root root 4096 Sep  9 09:36 export
    drwxr-xr-x 4 root root 4096 Sep  9 09:36 import
    -rw-r--r-- 1 root root    0 Sep  9 09:36 .jira-home.lock
    drwxr-xr-x 2 root root 4096 Sep  9 09:36 log
    drwxr-xr-x 5 root root 4096 Sep  9 09:36 plugins
    drwxr-xr-x 3 root root 4096 Sep  9 09:36 tmp

    

#### IF PORT CONFLICT ON 8080, CHANGE JIRA's PORT IN FILE

conf/server.xml



5. BROWSE TO JIRA AND CONFIGURE


http://107.170.219.63:8080/secure/SetupDatabase.jspa

Hostname: localhost




    
</entry>
<entry [Mon 2014:09:08 13:50:12 EST] ALTERNATIVE TO {style} MACRO IN ANNOUNCEMENT BANNER>
<!--

<LINK href="http://jiraserver/includes/my_css_files/mystyle.css" rel="stylesheet" type="text/css">
	
-->


</entry>
<entry [Fri 2014:09:05 12:45:12 EST] FIXED 'Error reading from remote server' AND RESTARTED aguadev.org CONFLUENCE>

PROBLEM

tail -f /var/log/http/error.log

    proxy: Error reading from remote server returned by /confluence/display/PTA/2013/08/30/lybcwgw+sflgkjg
    [Sat Sep 06 05:26:59 2014] [error] [client 120.37.226.80] (70007)The timeout specified has expired: proxy: error reading status line from remote server localhost
    [Sat Sep 06 05:26:59 2014] [error] [client 120.37.226.80] proxy: Error reading from remote server returned by /confluence/display/PTA/2013/08/30/ocwvpsr+jscfyel


DIAGNOSIS

em /etc/httpd/conf/httpd.conf

<!--
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

-->




SOLUTION

EDIT httpd.conf

CHANGE localhost TO 173.230.142.248

ProxyPass /confluence http://173.230.142.248:8080/confluence
ProxyPassReverse /confluence http://173.230.142.248:8080/confluence


RESTART

/usr/share/confluence/bin/shutdown.sh
/usr/share/confluence/bin/startup.sh




</entry>
<entry [Fri 2014:05:23 08:03:07 EST] ENABLE PUBLIC SIGNUP WITH CAPTCHA>

https://confluence.atlassian.com/display/JIRA/Enabling+Public+Signup+and+CAPTCHA

IN JIRA

Administration  --> System --> General Configuration --> Edit Settings

Mode --> Public
CAPTCHA --> On
	
</entry>
<entry [Fri 2014:05:23 01:08:47 EST] CONNECTED CONFLUENCE TO JIRA FOR USER MANAGEMENT>
	
https://confluence.atlassian.com/display/DOC/Connecting+to+Crowd+or+JIRA+for+User+Management
	
Connecting Confluence to JIRA for User Management

1. IN JIRA

Administration --> User Management --> JIRA User Server --> Add Application

127.0.0.1
::1
132.249.227.68


Enter the application name and password that Confluence will use when accessing JIRA.

confluence
Open4@nnai


2. IN CONFLUENCE

Administration --> User Directories --> Atlassian JIRA --> Add 

USE SETTINGS IN 1


3. GIVE JIRA USERS PERMISSION TO USE CONFLUENCE

CREATE GROUPS

confluence-users
confluence-administrators

IN CONFLUENCE

Administration --> Global Permissions --> SET 'can use' FOR JIRA GROUPS

Add your own username as a member of both of the above groups.
Choose one of the following methods to give your existing JIRA users access to Confluence:

Option 1: In JIRA, find the groups that the relevant users belong to. Add the groups as members of one or both of the above Confluence groups.

Option 2: Log in to Confluence using your JIRA account and go to the Confluence Administration Console. Click 'Global Permissions' and assign the 'can use' permission to the relevant JIRA groups.


4. ADD Confluence URL TO JIRA Whitelist

IN JIRA:

Administration --> System --> Security --> Whitelist

e.g., ADD https://confluence.atlassian.com
	
	
	
</entry>
<entry [Thu 2014:05:22 15:22:32 EST] FINAL Documentation SITE CONFIGURATION>

EXPANDED NAVIGATION BAR

1. In OnDemand: Space Adminstration --> Look and Feel --> Themes --> Documentation Theme --> Configure Theme

2. Unselect "Page Tree" --> Paste into 'Navigation'

	{pagetreesearch}
	{pagetree:startDepth=5}


HOME PAGE CSS

1. In OnDemand: Space Adminstration --> Look and Feel --> Themes --> Documentation Theme --> Configure Theme

2. Paste into 'header'

	{style}
	
	.page-metadata,
	.content-metadata-attachments,
	.page-metadata-modification-info {
	  display: none;
	  visibility: invisible;
	}
	
	.sectionMacroWithBorder {
	  margin-top: 0px !important;
	}
	.sectionMacroWithBorder .columnMacro {
	  border-style: solid !important;
	}
	#Home-Search, 
	h2,
	#Home-Search h2 {
	  -webkit-margin-before: 0;
	  -webkit-margin-after: 0;
	}
	.search-macro-medium {
	  margin-left: auto !important;
	  margin-right: auto !important;
	  width: 100% !important;
	}
	.search-macro-fields {
	  width: 100% !important;
	}
	.search-macro-query {
	  width: 100% !important;
	}
	
	.search-macro-button {
	  position: relative !important;
	  left: -5px !important;
	  width: 100% !important;
	  top: 10px;
	}
	
	
	{style}


	
</entry>
<entry [Thu 2014:05:22 14:40:50 EST] INSERT CSS INTO ONDEMAND>

FIXED SEARCH BOX AND BUTTON STYLE FOR Documentation WIKI

Confluence Admin --> Themes --> Documentation --> Configure theme --> Paste into 'header'

{style}

.search-macro-fields {
  width: 400px !important;
}
.search-macro-query {
  width: 350px !important;
}

.search-macro-button {
  position: relative !important;
  left: -5px !important;
  width: 350px !important;
  top: 10px;
}

{style}


	
</entry>
<entry [Thu 2014:05:22 14:25:45 EST] HOW TO CREATE A TEMPLATE>

Give your authors a helping hand by using templates in your documentation space. You will need Space Administrator permissions to create templates.
To create a template:
Go to "Space Tools" in the sidebar, select "Content Tools" and create a new template.
Click "Page Layout" and add sections and columns to your page.
Add headings and sub-headings as needed.
Choose "Instructional Text" from the "Template" menu and add text that is only visible in the editor.
Save your template.
Your template will become available in the Create dialog for this space.
	
</entry>
<entry [Thu 2014:05:22 13:15:01 EST] STYLING FOR Annai Documentation SITE>

.search-macro-fields {
  width: 400px !important;
}
.search-macro-query {
  width: 350px !important;
}

.search-macro-button {
  position: relative !important;
  left: 10px !important
}

	
</entry>
<entry [Thu 2014:05:22 11:19:17 EST] LOCATION OF JIRA PLUGIN DIRECTORY>

Framework 1 (i.e. 'Plugins 1' plugins):

/opt/atlassian/jira/atlassian-jira/WEB-INF/lib


'Plugins 2' plugins:

/var/atlassian/application-data/jira/plugins/installed-plugins

	
</entry>
<entry [Thu 2014:05:22 10:54:04 EST] ANNOUNCEMENT BANNER CSS AND JAVASCRIPT DISABLED IN ONDEMAND>

https://jira.atlassian.com/browse/JRA-27864

APRIL 2012

Recently we tightened up security in all JIRA OnDemand instances by not allowing arbitrary HTML in the announcement banner. We fixed this vulnerability by only allowing plain text or wiki markup in the announcement banner.

We would like to come up with a compromise if possible that still allows customers to accomplish what they were previously using the announcement banner for in a secure way. In order for that to happen we would like to know how you were using the announcement banner. Please comment on this issue to let us know how you have been using HTML in the announcement banner.

	
</entry>
<entry [Thu 2014:05:22 05:06:11 EST] SET ANNOUNCEMENT BANNER BACKGROUND COLOUR>

<!--

<script>
.generalAdminHeading {
    background-color: red;
}

</script>


<script>
(function($){
   $(document).ready(function(){
      $(".alertHeader").css("background-color","red");
   });  
})(AJS.$);
</script>
	
-->

</entry>
<entry [Sat 2014:04:12 13:57:23 EST] COLOURED CODE BLOCKS>

https://confluence.atlassian.com/display/DOC/Code+Block+Macro
	
</entry>
<entry [Thu 2014:04:03 19:45:47 EST] ADD IMAGE USING MARKUP>

ADD IMAGE WITH COLOURED BORDER

!fish.gif|align=right,border=2,bordercolor=blue!


REMOTE IMAGE

!http://www.atlassian.com/images/confluence_feature.gif!


display TEXT when hovering over an image

!fish.gif|title="I am a fish"


ADD IMAGE FROM OTHER SPACE:

!OTHERSPACE:page_in_other_space^image.jpg!


SIZE, ALIGN, BORDER, TITLE:

align — available values are 'left', 'right', 'center'.

border — specify the width of the border (in pixels).

bordercolor — use this with the above 'border' tag to specify the colour of the image border. Specify the colours by name or by hex value. See more information about web colours. (Available with Confluence 2.6.2 and later.)

hspace — specify the amount of whitespace to be inserted to the left and right of the image (in pixels).
vspace — specify the amount of whitespace to be inserted above and below the image (in pixels).

width — specify the width of the image (in pixels). This will override the natural width of the image.
height — specify the height of the image (in pixels). This will override the natural height of the image.

title — specify alternative text for the image, which is displayed when the pointer hovers over the image

alt — specify alternative text, which is included in the HTML code. This text is retrievable via search, and contributes to accessibility of the page for text-only viewing.


</entry>
<entry [Thu 2014:04:03 19:43:05 EST] CLICKABLE MACRO FOR IMAGES>


{clickable:BioCompute Farm|BioCompute Farm}

BioCompute Farm

{clickable}


#### DOCUMENTATION IS NOT QUITE RIGHT
	- TOOLTIP AND LINK ARE THE SAME: THE FIRST ARGUMENT
	-	BUT BOTH ARGUMENTS MUST BE GIVEN

{clickable:tooltip|link}body content{clickable}



	
</entry>
<entry [Sat 2014:03:15 21:36:21 EST] JIRA SERVICE DESK>

https://www.atlassian.com/software/jira/service-desk

SLAs
MOBILE INTERFACE
CUSTOMER PORTAL
QUEUES
REPORTS
KNOWLEDGE BASE

	
</entry>
<entry [Fri 2014:03:14 15:24:15 EST] SETUP EMAIL NOTIFICATION>

https://confluence.atlassian.com/display/JIRA/Creating+Issues+and+Comments+from+Email
https://confluence.atlassian.com/display/JIRA/Creating+a+Notification+Scheme

1. SET UP EMAIL ACCOUNT

JIRA Admin --> System --> Incoming Mail --> Add POP / IMAP mail server


2. SET UP MAIL HANDLER

JIRA Admin --> System --> Incoming Mail --> Add incoming mail handler


3. SET UP NOTIFICATION SCHEME

JIRA Admin --> Issues --> Notification Schemes

Keyboard shortcut: g + g + start typing notification schemes

	
</entry>
<entry [Fri 2014:03:14 15:02:28 EST] BULK MOVE ISSUES IN JIRA>

1. GO TO MAIN PROJECT PAGE (NOT AGILE)

2. Issues --> All Issues --> Actions (top right) --> Bulk Change

	
</entry>
<entry [Fri 2014:03:14 15:01:19 EST] LINK JIRA TO FISHEYE>

INSTALL CONFLUENCE-SALESFORCE CONNECTOR
https://marketplace.atlassian.com/plugins/net.customware.confluence.plugin.salesforce.confluence-salesforce-plugin

SECTION 9 - CONNECT TO JIRA
https://confluence.atlassian.com/display/DOC/Confluence+Setup+Guide


LINK JIRA TO FISHEYE
https://confluence.atlassian.com/display/APPLINKS/Quick+Start%3A+Application+Links
	
</entry>
<entry [Fri 2014:03:14 11:55:49 EST] GOOGLE ANALYTICS WITH CONFLUENCE>

google analytics on confluence pages
confluence analytics confluence-development page
Upvote
0
Downvote
1
srinivas%20patruni
srinivas patruni asked this question · 1,281 karma · Sep 24 '12 at 05:08 PM


Can we gather analytics (via Google) on Confluence usage by pasting the javascript below into the page template header for any pages we want to track.

Can I do this within Confluence?

<!--

<script type="text/javascript">
 
  var _gaq = _gaq || [];
  _gaq.push(['_setAccount', 'UA-35048994-1']);
  _gaq.push(['_trackPageview']);
 
  (function() {
    var ga = document.createElement('script'); ga.type = 'text/javascript'; ga.async = true;
    ga.src = ('https:' == document.location.protocol ? 'https://ssl' : 'http://www') + '.google-analytics.com/ga.js';
    var s = document.getElementsByTagName('script')[0]; s.parentNode.insertBefore(ga, s);
  })();
 
</script>

-->

Adrien Ragot · 1,978 karma · Sep 29 '13 at 05:23 PM

Hi Srinivas, Please tick the right answer if it worked for you. Thanks!

Like · Continue discussion... 
4 Answers:

Upvote
4
Downvote
Giuliano%20Campos%20%5BAtlassian%5D
Giuliano Campos [Atlassian] · 1,496 karma · Sep 25 '12 at 03:05 PM

Yes, you can perform it within Confluence. Please, refer to the following path:

Browse > Confluence Admin > 'Look and Feel' - Custom HTML > Edit

Through this page, insert your javascript where you want. In this case, at 'end of the HEAD'.

Kind Regards

Comment 
srinivas%20patruni
srinivas patruni · 1,281 karma · Sep 25 '12 at 04:11 PM

Interesting.. i will try this way.

Thanks, Srinivas

Like · Continue discussion... 
Upvote
3
Downvote
Bernardo%20Acevedo%20%5BAtlassian%5D
Bernardo Acevedo [Atlassian] · 1,734 karma · Sep 25 '12 at 03:14 PM

Also you can check this plugin:

https://marketplace.atlassian.com/plugins/me.davidsimpson.confluence.plugins.googleanalytics

This plugin displays reports for an external Confluence website, or a particular space...please check if this plugin suits for you.

Comment 
srinivas%20patruni
srinivas patruni · 1,281 karma · Sep 25 '12 at 04:13 PM

Yes. I already tried that. This requires a license though :)

</entry>
<entry [Sat 2014:03:08 18:14:02 EST] BIOCOMPUTE FARM THEME CSS>


/* resize fonts */

.aui-header-logo.aui-header-logo-custom,
.aui-header-logo.aui-header-logo-custom a ,
.aui-header-logo.aui-header-logo-custom a href,
#wiki {
    background-color: red !important;
}

.wiki-content p {
    font-size: 12px;
}
.wiki-content h1 { 
    border-bottom: 1px solid #98bddd !important; 
}
a.blogHeading {
    font-size: 14pt !important;
}
.blog-post-listing .wiki-content {
    color: #637687 !important;
}


    
</entry>
<entry [Sat 2014:03:08 17:18:04 EST] STYLE ONDEMAND>

{style}


/* resize fonts */
.wiki-content p {
    font-size: 12px;
}
.wiki-content h1 { 
    border-bottom: 1px solid #98bddd !important; 
}
a.blogHeading {
    font-size: 14pt !important;
}
.blog-post-listing .wiki-content {/Users/syoung/Library/Application Support/KomodoEdit/8.5/tools/tools/find_conflict_line.komodotool
    color: #637687 !important;
}

{style}
    


</entry>
<entry [Wed 2014:01:15 17:57:20 EST] REINDEX MESSAGE IN ONDEMAND>


This version of JIRA Agile requires sprints on Scrum boards to be migrated. Read more about the migration or hide this message.
System Administrator made configuration changes in section 'Plugins' at 14/Jan/14 7:56 PM. It is recommended that you perform a re-index. For more information please see the JIRA Documentation.
To perform the re-index now, please go to the 'Indexing' section.
Note: So that you only have to re-index once, you may wish to complete any other configuration changes before performing the re-index.
    
</entry>
<entry [Wed 2014:01:15 17:53:16 EST] RESTRICT HITACHI USERS TO SPECIFIC SPACE>


1. CREATE NEW GROUP hitachi

Confluence Admin --> Groups --> hitachi --> Add Group


2. ADD 'Browsers' PERMISSION SCHEME TO THE GROUP

JIRA Admin --> Administration 'Cog' --> Issues-->Permission Schemes --> Default Permission Scheme --> Permissions --> Browse Projects --> Add --> Group --> hitachi

    Click "Permissions" corresponding to the Scheme you want to add this permission.
    Add the desired group to "Browse Projects" category.It will be reflected in groups scheme

3. ADD 'JIRA Users' PERMISSION

JIRA Admin --> User Management --> Global Permissions --> Add Permission --> JIRA Users --> hitachi


3. CONFIGURE ACCESS PER SPACE

https://confluence.atlassian.com/display/DOC/Assigning+Space+Permissions

Space Admin > Permissions --> Edit Permissions

    
Matthew J. Horn · 6,830 karma · Oct 02 '12 at 05:24 PM

There's some additional tips here:

http://davidsimpson.me/2009/04/16/4-useful-tips-on-google-analytics-reporting-for-confluence/


Adrien%20Ragot
Adrien Ragot · 1,978 karma · Oct 01 '13 at 05:55 PM

Go to:

Global Administration
Custom HTML
At the end of HEAD
Paste your script.
It works pretty well, I'm sure ;)

</entry>
<entry [Wed 2014:02:05 03:02:32 EST] FIXED JIRA catalina.out ERROR ON START>

tail -f /opt/atlassian/jira/6.1.2/logs/catalina.out

	Caused by: org.ofbiz.core.entity.GenericDataSourceException: Unable to establish a connection with the database. (Connection refused. Check that the hostname and port are correct and that the postmaster is accepting TCP/IP connections.)

	
	
</entry>
<entry [Fri 2014:01:17 11:36:01 EST] UNIFIED NAVIGATION PLUGIN>


https://marketplace.atlassian.com/plugins/nl.tweeenveertig.navigator-plugin

	
</entry>
<entry [Thu 2014:01:16 02:17:30 EST] RESTRICT ACCESS TO ONE PROJECT>


WARNING
Anonymous users will not be able to view this space, because they have not been granted the global ‘Use Confluence’ permission. You can grant anonymous access to Confluence from global permissions.

	
</entry>
<entry [Tue 2014:01:14 21:54:43 EST] EXPANDED NAVIGATION TREE IN CONFLUENCE OnDemand>

PROBLEM

The sidebar of confluence on-demand limits the tree view to the top level pages. 

SOLUTION

1. In OnDemand: Space Adminstration --> Look and Feel --> Themes --> Documentation Theme.

2. Documentation Theme --> Configure Theme

3. Unselect "Page Tree" --> Add the following to Navigation:


{pagetreesearch}
{pagetree:startDepth=5}


NB: Documentation for the page tree macro

https://confluence.atlassian.com/display/DOC/Page+Tree+Macro

	
</entry>
<entry [Tue 2014:01:07 13:15:05 EST] FIXED JIRA ERROR: 'There is insufficient memory for the Java Runtime Environment to continue'>

PROBLEM

ON START JIRA GET THIS ERROR IN logs/catalina.out

	There is insufficient memory for the Java Runtime Environment to continue.
	# Native memory allocation (malloc) failed to allocate 268435456 bytes for committing reserved memory.


SOLUTION

REBOOT


</entry>
<entry [Wed 2013:12:18 14:39:53 EST] FIXED: JIRA DUPLICATE PERMISSIONS>


JIRA

Admin --> System --> Integrity Checker --> Check for Duplicate Permissions

	Check the permissions are not duplicated
	
	ERROR: Duplicate Permission: SchemePermissions (ID:10307)

	
</entry>
<entry [Wed 2013:12:18 13:59:28 EST] JIRA STARTUP SLOW>

[atlassian.plugin.util.WaitUntil] Plugins that have yet to be enabled: [com.pyxis.greenhopper.jira], 34 seconds remaining


Admin --> System --> Integrity Check

	
Dec 18, 2013 10:30:45 PM org.apache.jasper.compiler.TldLocationsCache tldScanJar
INFO: At least one JAR was scanned for TLDs yet contained no TLDs. Enable debug logging for this logger for a complete list of JARs that were scanned but no TLDs were found in them. Skipping unneeded JARs during scanning can improve startup time and JSP compilation time.


	
</entry>
<entry [Sun 2013:12:15 05:12:19 EST] JIRA AND CONFLUENCE PLUGINS>

Git Integration
View Git Commits in JIRA Issues and Projects + Code Review Inside JIRA
https://marketplace.atlassian.com/plugins/com.xiplink.jira.git.jira_git_plugin

Snippets for Stash
https://marketplace.atlassian.com/plugins/com.simplenia.stash.plugins.snippets

Awesome Graphs for Stash
https://marketplace.atlassian.com/plugins/com.stiltsoft.stash.graphs

Pathfinder GRAPHICAL ISSUES LINKS
https://marketplace.atlassian.com/plugins/com.kitologic.pathfinder

BEHAVE PRO TESTING (Cucumber)
https://marketplace.atlassian.com/plugins/pro.behave.hosted

SQL SPREADSHEETS
https://marketplace.atlassian.com/plugins/com.playsql.playsql-plugin?utm_source=marketplace-12-days-of-add-ons-email&utm_medium=email&utm_campaign=marketplace-12-days-of-add-ons
PRICING
https://documentation.play-sql.com/display/PUBLIC/Pricing

NB: SQLZOO
http://sqlzoo.net/wiki/Main_Page

SQL PLUGIN
https://marketplace.atlassian.com/plugins/org.swift.confluence.sql?utm_source=marketplace-12-days-of-add-ons-email&utm_medium=email&utm_campaign=marketplace-12-days-of-add-ons
INTRODUCTION
https://confluence.atlassian.com/pages/viewpage.action?pageId=200213342


folio COST MANAGEMENT
https://marketplace.atlassian.com/plugins/com.greffon.folio?utm_source=marketplace-12-days-of-add-ons-email&utm_medium=email&utm_campaign=marketplace-12-days-of-add-ons

Git Addon EMBED IN CONFLUENCE
https://marketplace.atlassian.com/plugins/nl.avisi.confluence.plugins.git-plugin?utm_source=marketplace-12-days-of-add-ons-email&utm_medium=email&utm_campaign=marketplace-12-days-of-add-ons


jjupin JIRA SCRIPTING
https://marketplace.atlassian.com/plugins/com.keplerrominfo.jira.plugins.jjupin?utm_source=marketplace-12-days-of-add-ons-email&utm_medium=email&utm_campaign=marketplace-12-days-of-add-ons

protoshare MOCKUPS
https://marketplace.atlassian.com/plugins/com.protoshare.jira.plugins.protoshare-jira?utm_source=marketplace-12-days-of-add-ons-email&utm_medium=email&utm_campaign=marketplace-12-days-of-add-ons
	
zephr TESTING 
https://marketplace.atlassian.com/plugins/com.thed.zephyr.je?utm_source=marketplace-12-days-of-add-ons-email&utm_medium=email&utm_campaign=marketplace-12-days-of-add-ons
	
arsenale REPORTS

https://marketplace.atlassian.com/plugins/com.arsenalesystems.dataplane?utm_source=marketplace-12-days-of-add-ons-email&utm_medium=email&utm_campaign=marketplace-12-days-of-add-ons

	
</entry>
<entry [Thu 2013:12:12 22:55:41 EST] INSTALLED LUCIDCHART>

http://support.lucidchart.com/entries/21672404-Step-1-Install-the-Lucidchart-Plugin-for-Confluence

NB: USER PREFERENCES FOR ONLINE CHART
https://www.lucidchart.com/users/preferences


1. DOWNLOADED LUCIDCHART *.jar FILE



2. UPLOADED TO CONFLUENCE

Confluence Admin --> Add-Ons --> Upload

NB: MUST BROWSE TO ELASTIC IP (WHICH IS SPECIFIED AS THE baseUrl)


3. ON LUCIDCHART Team Page, GENERATE API 'key' AND 'secret':

REGISTER FOR LUCIDCHART

LOG IN

CLICK 'Team' IN TOP MENU

https://www.lucidchart.com/teams#users?group_id=104983519&browser=icon&sort=name-asc

Applications --> Manage Confluence --> Generate New API Keypair

API Key:
22d106960778473b0e343a0ee2e1d8f2ec225e42

API Secret:
0713346c1b2311909ce77b7ba42fc0a4390f14af


4. IN CONFLUENCE, ACTIVATE LUCIDCHART PLUGIN WITH KEYPAIR

Confluence Admin --> Add-Ons --> LucidChart --> Configure

TAKES YOU TO HERE

https://184.169.161.14:8443/admin/plugins/lucidchart/configure.action

INPUT KEY AND SECRET GENERATED ABOVE


5. CREATE 'DOCSPACE' PAGE FOR TESTING


6. CREATE PAGE Getting Started --> LucidChart 

Edit --> Insert --> Other Macros --> LucidChart --> Start Using LucidChart


	
</entry>
<entry [Tue 2013:12:10 19:50:07 EST] CONFLUENCE PLUGINS>
	
	
</entry>
<entry [Tue 2013:11:26 12:50:14 EST] CONVERTED >

EPICS
Block storage on BCF
Openstack Grizzly
Openstack Havana
BCF Performance benchmarking
BCF Staging System (for Openstack specifically)
Support of Other Analysis Tools
Online account access
Network Architecture Simplification
Integration with other workflow tools
Job scheduling functionality
Web based GUI for command line tools
eCommerce


ORANGE
Dream Challenge
Pan Cancer
UCSC/CGHub
Pharma

GREEN
Research
Hospital



Log's referral number: 5fd1bd5f-07b6-44ae-901f-b6cefa9d08f0
If you need further assistance, please:
Expand the section "Technical details" below
Copy the content from it
Send it with the log's referral number (above) to your JIRA Administrator
Technical details


Referer URL: https://184.169.161.14:8444/plugins/servlet/upm/manage/paid-via-atlassian
com.bit.jira.CustomFieldsNotFoundException
com.bit.jira.CustomFieldsNotFoundException
	at com.bit.jira.JIRACustomFieldHelper.getCustomFields(JIRACustomFieldHelper.java:180)
	at com.bit.jira.JIRACustomFieldHelper.getCustomFieldValue_Epic(JIRACustomFieldHelper.java:205)
	at com.bit.jira.entities.BitIssue.< init>(BitIssue.java:32)
	at com.bit.jira.JIRAHelper.getIssues(JIRAHelper.java:665)
	at com.bit.jira.JIRAHelper.proceedIssueXML(JIRAHelper.java:717)
	at com.bit.agile.storymap.servlet.AgileServlet.doGet(AgileServlet.java:143)
	at javax.servlet.http.HttpServlet.service(HttpServlet.java:621)
	at javax.servlet.http.HttpServlet.service(HttpServlet.java:722)
	at com.atlassian.plugin.servlet.DelegatingPluginServlet.service(DelegatingPluginServlet.java:42)
	at javax.servlet.http.HttpServlet.service(HttpServlet.java:722)
	at com.atlassian.plugin.servlet.ServletModuleContainerServlet.service(ServletModuleContainerServlet.java:52)
	at javax.servlet.http.HttpServlet.service(HttpServlet.java:722)
	at org.apache.catalina.core.ApplicationFilterChain.internalDoFilter(ApplicationFilterChain.java:305)
	at org.apache.catalina.core.ApplicationFilterChain.doFilter(ApplicationFilterChain.java:210)
	at com.atlassian.jira.web.filters.steps.ChainedFilterStepRunner.doFilter(ChainedFilterStepRunner.java:87)
	at org.apache.catalina.core.ApplicationFilterChain.internalDoFilter(ApplicationFilterChain.java:243)
	at org.apache.catalina.core.ApplicationFilterChain.doFilter(ApplicationFilterChain.java:210)
	at com.atlassian.jira.web.filters.XContentTypeOptionsNoSniffFilter.doFilter(XContentTypeOptionsNoSniffFilter.java:22)
	at com.atlassian.core.filters.AbstractHttpFilter.doFilter(AbstractHttpFilter.java:31)
	at org.apache.catalina.core.ApplicationFilterChain.internalDoFilter(ApplicationFilterChain.java:243)
	at org.apache.catalina.core.ApplicationFilterChain.doFilter(ApplicationFilterChain.java:210)
	at com.atlassian.core.filters.HeaderSanitisingFilter.doFilter(HeaderSanitisingFilter.java:44)
	at org.apache.catalina.core.ApplicationFilterChain.internalDoFilter(ApplicationFilterChain.java:243)
	at org.apache.catalina.core.ApplicationFilterChain.doFilter(ApplicationFilterChain.java:210)
	at com.atlassian.plugin.servlet.filter.IteratingFilterChain.doFilter(IteratingFilterChain.java:46)
	at com.atlassian.plugin.servlet.filter.DelegatingPluginFilter$1.doFilter(DelegatingPluginFilter.java:66)
	at com.atlassian.jira.tzdetect.IncludeResourcesFilter.doFilter(IncludeResourcesFilter.java:39)
	at com.atlassian.plugin.servlet.filter.DelegatingPluginFilter.doFilter(DelegatingPluginFilter.java:74)
	at com.atlassian.plugin.servlet.filter.IteratingFilterChain.doFilter(IteratingFilterChain.java:42)
	at com.atlassian.plugin.servlet.filter.DelegatingPluginFilter$1.doFilter(DelegatingPluginFilter.java:66)
	at com.atlassian.jira.baseurl.IncludeResourcesFilter.doFilter(IncludeResourcesFilter.java:38)
	at com.atlassian.core.filters.AbstractHttpFilter.doFilter(AbstractHttpFilter.java:31)
	at com.atlassian.plugin.servlet.filter.DelegatingPluginFilter.doFilter(DelegatingPluginFilter.java:74)
	at com.atlassian.plugin.servlet.filter.IteratingFilterChain.doFilter(IteratingFilterChain.java:42)
	at com.atlassian.plugin.servlet.filter.DelegatingPluginFilter$1.doFilter(DelegatingPluginFilter.java:66)
	at com.atlassian.applinks.core.rest.context.ContextFilter.doFilter(ContextFilter.java:25)
	at com.atlassian.plugin.servlet.filter.DelegatingPluginFilter.doFilter(DelegatingPluginFilter.java:74)
	at com.atlassian.plugin.servlet.filter.IteratingFilterChain.doFilter(IteratingFilterChain.java:42)
	at com.atlassian.plugin.servlet.filter.DelegatingPluginFilter$1.doFilter(DelegatingPluginFilter.java:66)
	at com.atlassian.mywork.client.filter.ServingRequestsFilter.doFilter(ServingRequestsFilter.java:37)
	at com.atlassian.plugin.servlet.filter.DelegatingPluginFilter.doFilter(DelegatingPluginFilter.java:74)
	at com.atlassian.plugin.servlet.filter.IteratingFilterChain.doFilter(IteratingFilterChain.java:42)
	at com.atlassian.plugin.servlet.filter.DelegatingPluginFilter$1.doFilter(DelegatingPluginFilter.java:66)
	at com.atlassian.prettyurls.filter.PrettyUrlsDispatcherFilter.doFilter(PrettyUrlsDispatcherFilter.java:60)
	at com.atlassian.plugin.servlet.filter.DelegatingPluginFilter.doFilter(DelegatingPluginFilter.java:74)
	at com.atlassian.plugin.servlet.filter.IteratingFilterChain.doFilter(IteratingFilterChain.java:42)
	at com.atlassian.plugin.servlet.filter.DelegatingPluginFilter$1.doFilter(DelegatingPluginFilter.java:66)
	at com.atlassian.prettyurls.filter.PrettyUrlsSiteMeshFilter.doFilter(PrettyUrlsSiteMeshFilter.java:92)
	at com.atlassian.plugin.servlet.filter.DelegatingPluginFilter.doFilter(DelegatingPluginFilter.java:74)
	at com.atlassian.plugin.servlet.filter.IteratingFilterChain.doFilter(IteratingFilterChain.java:42)
	at com.atlassian.plugin.servlet.filter.DelegatingPluginFilter$1.doFilter(DelegatingPluginFilter.java:66)
	at com.atlassian.prettyurls.filter.PrettyUrlsMatcherFilter.doFilter(PrettyUrlsMatcherFilter.java:56)
	at com.atlassian.plugin.servlet.filter.DelegatingPluginFilter.doFilter(DelegatingPluginFilter.java:74)
	at com.atlassian.plugin.servlet.filter.IteratingFilterChain.doFilter(IteratingFilterChain.java:42)
	at com.atlassian.plugin.servlet.filter.DelegatingPluginFilter$1.doFilter(DelegatingPluginFilter.java:66)
	at com.atlassian.labs.botkiller.BotKillerFilter.doFilter(BotKillerFilter.java:36)
	at com.atlassian.plugin.servlet.filter.DelegatingPluginFilter.doFilter(DelegatingPluginFilter.java:74)
	at com.atlassian.plugin.servlet.filter.IteratingFilterChain.doFilter(IteratingFilterChain.java:42)
	at com.atlassian.plugin.servlet.filter.ServletFilterModuleContainerFilter.doFilter(ServletFilterModuleContainerFilter.java:77)
	at com.atlassian.plugin.servlet.filter.ServletFilterModuleContainerFilter.doFilter(ServletFilterModuleContainerFilter.java:63)
	at org.apache.catalina.core.ApplicationFilterChain.internalDoFilter(ApplicationFilterChain.java:243)
	at org.apache.catalina.core.ApplicationFilterChain.doFilter(ApplicationFilterChain.java:210)
	at com.atlassian.jira.web.filters.accesslog.AccessLogFilter.executeRequest(AccessLogFilter.java:103)
	at com.atlassian.jira.web.filters.accesslog.AccessLogFilter.doFilter(AccessLogFilter.java:87)
	at org.apache.catalina.core.ApplicationFilterChain.internalDoFilter(ApplicationFilterChain.java:243)
	at org.apache.catalina.core.ApplicationFilterChain.doFilter(ApplicationFilterChain.java:210)
	at com.atlassian.jira.security.xsrf.XsrfTokenAdditionRequestFilter.doFilter(XsrfTokenAdditionRequestFilter.java:54)
	at org.apache.catalina.core.ApplicationFilterChain.internalDoFilter(ApplicationFilterChain.java:243)
	at org.apache.catalina.core.ApplicationFilterChain.doFilter(ApplicationFilterChain.java:210)
	at com.opensymphony.sitemesh.webapp.SiteMeshFilter.obtainContent(SiteMeshFilter.java:181)
	at com.opensymphony.sitemesh.webapp.SiteMeshFilter.doFilter(SiteMeshFilter.java:85)
	at com.atlassian.jira.web.filters.SitemeshPageFilter.doFilter(SitemeshPageFilter.java:123)
	at org.apache.catalina.core.ApplicationFilterChain.internalDoFilter(ApplicationFilterChain.java:243)
	at org.apache.catalina.core.ApplicationFilterChain.doFilter(ApplicationFilterChain.java:210)
	at com.atlassian.jira.web.filters.steps.ChainedFilterStepRunner.doFilter(ChainedFilterStepRunner.java:87)
	at org.apache.catalina.core.ApplicationFilterChain.internalDoFilter(ApplicationFilterChain.java:243)
	at org.apache.catalina.core.ApplicationFilterChain.doFilter(ApplicationFilterChain.java:210)
	at com.atlassian.plugin.servlet.filter.IteratingFilterChain.doFilter(IteratingFilterChain.java:46)
	at com.atlassian.plugin.servlet.filter.DelegatingPluginFilter$1.doFilter(DelegatingPluginFilter.java:66)
	at com.atlassian.prettyurls.filter.PrettyUrlsCombinedMatchDispatcherFilter.doFilter(PrettyUrlsCombinedMatchDispatcherFilter.java:61)
	at com.atlassian.plugin.servlet.filter.DelegatingPluginFilter.doFilter(DelegatingPluginFilter.java:74)
	at com.atlassian.plugin.servlet.filter.IteratingFilterChain.doFilter(IteratingFilterChain.java:42)
	at com.atlassian.plugin.servlet.filter.ServletFilterModuleContainerFilter.doFilter(ServletFilterModuleContainerFilter.java:77)
	at com.atlassian.plugin.servlet.filter.ServletFilterModuleContainerFilter.doFilter(ServletFilterModuleContainerFilter.java:63)
	at org.apache.catalina.core.ApplicationFilterChain.internalDoFilter(ApplicationFilterChain.java:243)
	at org.apache.catalina.core.ApplicationFilterChain.doFilter(ApplicationFilterChain.java:210)
	at com.atlassian.seraph.filter.SecurityFilter.doFilter(SecurityFilter.java:234)
	at org.apache.catalina.core.ApplicationFilterChain.internalDoFilter(ApplicationFilterChain.java:243)
	at org.apache.catalina.core.ApplicationFilterChain.doFilter(ApplicationFilterChain.java:210)
	at com.atlassian.security.auth.trustedapps.filter.TrustedApplicationsFilter.doFilter(TrustedApplicationsFilter.java:98)
	at org.apache.catalina.core.ApplicationFilterChain.internalDoFilter(ApplicationFilterChain.java:243)
	at org.apache.catalina.core.ApplicationFilterChain.doFilter(ApplicationFilterChain.java:210)
	at com.atlassian.seraph.filter.BaseLoginFilter.doFilter(BaseLoginFilter.java:169)
	at com.atlassian.jira.web.filters.JiraLoginFilter.doFilter(JiraLoginFilter.java:70)
	at org.apache.catalina.core.ApplicationFilterChain.internalDoFilter(ApplicationFilterChain.java:243)
	at org.apache.catalina.core.ApplicationFilterChain.doFilter(ApplicationFilterChain.java:210)
	at com.atlassian.plugin.servlet.filter.IteratingFilterChain.doFilter(IteratingFilterChain.java:46)
	at com.atlassian.plugin.servlet.filter.DelegatingPluginFilter$1.doFilter(DelegatingPluginFilter.java:66)
	at com.atlassian.oauth.serviceprovider.internal.servlet.OAuthFilter.doFilter(OAuthFilter.java:55)
	at com.atlassian.plugin.servlet.filter.DelegatingPluginFilter.doFilter(DelegatingPluginFilter.java:74)
	at com.atlassian.plugin.servlet.filter.IteratingFilterChain.doFilter(IteratingFilterChain.java:42)
	at com.atlassian.plugin.servlet.filter.DelegatingPluginFilter$1.doFilter(DelegatingPluginFilter.java:66)
	at com.atlassian.prettyurls.filter.PrettyUrlsCombinedMatchDispatcherFilter.doFilter(PrettyUrlsCombinedMatchDispatcherFilter.java:61)
	at com.atlassian.plugin.servlet.filter.DelegatingPluginFilter.doFilter(DelegatingPluginFilter.java:74)
	at com.atlassian.plugin.servlet.filter.IteratingFilterChain.doFilter(IteratingFilterChain.java:42)
	at com.atlassian.plugin.servlet.filter.ServletFilterModuleContainerFilter.doFilter(ServletFilterModuleContainerFilter.java:77)
	at com.atlassian.plugin.servlet.filter.ServletFilterModuleContainerFilter.doFilter(ServletFilterModuleContainerFilter.java:63)
	at org.apache.catalina.core.ApplicationFilterChain.internalDoFilter(ApplicationFilterChain.java:243)
	at org.apache.catalina.core.ApplicationFilterChain.doFilter(ApplicationFilterChain.java:210)
	at com.atlassian.util.profiling.filters.ProfilingFilter.doFilter(ProfilingFilter.java:99)
	at com.atlassian.jira.web.filters.JIRAProfilingFilter.doFilter(JIRAProfilingFilter.java:19)
	at org.apache.catalina.core.ApplicationFilterChain.internalDoFilter(ApplicationFilterChain.java:243)
	at org.apache.catalina.core.ApplicationFilterChain.doFilter(ApplicationFilterChain.java:210)
	at com.atlassian.johnson.filters.AbstractJohnsonFilter.doFilter(AbstractJohnsonFilter.java:71)
	at org.apache.catalina.core.ApplicationFilterChain.internalDoFilter(ApplicationFilterChain.java:243)
	at org.apache.catalina.core.ApplicationFilterChain.doFilter(ApplicationFilterChain.java:210)
	at org.tuckey.web.filters.urlrewrite.RuleChain.handleRewrite(RuleChain.java:176)
	at org.tuckey.web.filters.urlrewrite.RuleChain.doRules(RuleChain.java:145)
	at org.tuckey.web.filters.urlrewrite.UrlRewriter.processRequest(UrlRewriter.java:92)
	at org.tuckey.web.filters.urlrewrite.UrlRewriteFilter.doFilter(UrlRewriteFilter.java:394)
	at org.apache.catalina.core.ApplicationFilterChain.internalDoFilter(ApplicationFilterChain.java:243)
	at org.apache.catalina.core.ApplicationFilterChain.doFilter(ApplicationFilterChain.java:210)
	at com.atlassian.gzipfilter.GzipFilter.doFilterInternal(GzipFilter.java:80)
	at com.atlassian.gzipfilter.GzipFilter.doFilter(GzipFilter.java:51)
	at com.atlassian.jira.web.filters.gzip.JiraGzipFilter.doFilter(JiraGzipFilter.java:55)
	at org.apache.catalina.core.ApplicationFilterChain.internalDoFilter(ApplicationFilterChain.java:243)
	at org.apache.catalina.core.ApplicationFilterChain.doFilter(ApplicationFilterChain.java:210)
	at com.atlassian.plugin.servlet.filter.IteratingFilterChain.doFilter(IteratingFilterChain.java:46)
	at com.atlassian.plugin.servlet.filter.DelegatingPluginFilter$1.doFilter(DelegatingPluginFilter.java:66)
	at com.atlassian.prettyurls.filter.PrettyUrlsCombinedMatchDispatcherFilter.doFilter(PrettyUrlsCombinedMatchDispatcherFilter.java:61)
	at com.atlassian.plugin.servlet.filter.DelegatingPluginFilter.doFilter(DelegatingPluginFilter.java:74)
	at com.atlassian.plugin.servlet.filter.IteratingFilterChain.doFilter(IteratingFilterChain.java:42)
	at com.atlassian.plugin.servlet.filter.DelegatingPluginFilter$1.doFilter(DelegatingPluginFilter.java:66)
	at com.sysbliss.jira.plugins.workflow.servlet.JWDSendRedirectFilter.doFilter(JWDSendRedirectFilter.java:25)
	at com.atlassian.plugin.servlet.filter.DelegatingPluginFilter.doFilter(DelegatingPluginFilter.java:74)
	at com.atlassian.plugin.servlet.filter.IteratingFilterChain.doFilter(IteratingFilterChain.java:42)
	at com.atlassian.plugin.servlet.filter.ServletFilterModuleContainerFilter.doFilter(ServletFilterModuleContainerFilter.java:77)
	at com.atlassian.plugin.servlet.filter.ServletFilterModuleContainerFilter.doFilter(ServletFilterModuleContainerFilter.java:63)
	at org.apache.catalina.core.ApplicationFilterChain.internalDoFilter(ApplicationFilterChain.java:243)
	at org.apache.catalina.core.ApplicationFilterChain.doFilter(ApplicationFilterChain.java:210)
	at com.atlassian.jira.web.filters.steps.ChainedFilterStepRunner.doFilter(ChainedFilterStepRunner.java:87)
	at org.apache.catalina.core.ApplicationFilterChain.internalDoFilter(ApplicationFilterChain.java:243)
	at org.apache.catalina.core.ApplicationFilterChain.doFilter(ApplicationFilterChain.java:210)
	at com.atlassian.core.filters.cache.AbstractCachingFilter.doFilter(AbstractCachingFilter.java:33)
	at com.atlassian.core.filters.AbstractHttpFilter.doFilter(AbstractHttpFilter.java:31)
	at org.apache.catalina.core.ApplicationFilterChain.internalDoFilter(ApplicationFilterChain.java:243)
	at org.apache.catalina.core.ApplicationFilterChain.doFilter(ApplicationFilterChain.java:210)
	at com.atlassian.core.filters.encoding.AbstractEncodingFilter.doFilter(AbstractEncodingFilter.java:41)
	at com.atlassian.core.filters.AbstractHttpFilter.doFilter(AbstractHttpFilter.java:31)
	at com.atlassian.jira.web.filters.PathMatchingEncodingFilter.doFilter(PathMatchingEncodingFilter.java:49)
	at com.atlassian.core.filters.AbstractHttpFilter.doFilter(AbstractHttpFilter.java:31)
	at org.apache.catalina.core.ApplicationFilterChain.internalDoFilter(ApplicationFilterChain.java:243)
	at org.apache.catalina.core.ApplicationFilterChain.doFilter(ApplicationFilterChain.java:210)
	at com.atlassian.jira.startup.JiraStartupChecklistFilter.doFilter(JiraStartupChecklistFilter.java:78)
	at org.apache.catalina.core.ApplicationFilterChain.internalDoFilter(ApplicationFilterChain.java:243)
	at org.apache.catalina.core.ApplicationFilterChain.doFilter(ApplicationFilterChain.java:210)
	at com.atlassian.jira.web.filters.steps.ChainedFilterStepRunner.doFilter(ChainedFilterStepRunner.java:87)
	at com.atlassian.jira.web.filters.JiraFirstFilter.doFilter(JiraFirstFilter.java:57)
	at org.apache.catalina.core.ApplicationFilterChain.internalDoFilter(ApplicationFilterChain.java:243)
	at org.apache.catalina.core.ApplicationFilterChain.doFilter(ApplicationFilterChain.java:210)
	at org.apache.catalina.core.StandardWrapperValve.invoke(StandardWrapperValve.java:225)
	at org.apache.catalina.core.StandardContextValve.invoke(StandardContextValve.java:123)
	at org.apache.catalina.authenticator.AuthenticatorBase.invoke(AuthenticatorBase.java:472)
	at org.apache.catalina.core.StandardHostValve.invoke(StandardHostValve.java:168)
	at org.apache.catalina.valves.ErrorReportValve.invoke(ErrorReportValve.java:98)
	at org.apache.catalina.core.StandardEngineValve.invoke(StandardEngineValve.java:118)
	at org.apache.catalina.valves.AccessLogValve.invoke(AccessLogValve.java:927)
	at org.apache.catalina.connector.CoyoteAdapter.service(CoyoteAdapter.java:407)
	at org.apache.coyote.http11.AbstractHttp11Processor.process(AbstractHttp11Processor.java:1001)
	at org.apache.coyote.AbstractProtocol$AbstractConnectionHandler.process(AbstractProtocol.java:585)
	at org.apache.tomcat.util.net.JIoEndpoint$SocketProcessor.run(JIoEndpoint.java:310)
	at java.util.concurrent.ThreadPoolExecutor.runWorker(ThreadPoolExecutor.java:1145)
	at java.util.concurrent.ThreadPoolExecutor$Worker.run(ThreadPoolExecutor.java:615)
	at java.lang.Thread.run(Thread.java:744)
Go back to the previous page

</entry>
<entry [Tue 2013:11:26 12:36:58 EST] USE JIRA AND CONFLUENCE FOR ROADMAP MANAGMENT>


http://www.youtube.com/watch?v=AYZ2NDRNJFM

USE RESOURCE ALLOCATION (BURNDOWNS ARE DECEPTIVE)


1. CREATE 'ROADMAP' PROJECT



2. CREATE VERSION (=PROJECT)



3.


	
</entry>
<entry [Tue 2013:11:26 12:33:39 EST] CONFLUENCE-4 INSTALLED PLUGIN: Agile User Story Map>


https://marketplace.atlassian.com/plugins/com.bit.agile.bit-storymap

... BUT FAILS WITH ERROR:

tail logs/catalina.out

	2013-11-26 21:14:29,962 http-bio-8444-exec-2 INFO sysadmin 1274x293x2 1awb15 67.111.83.82 /plugins/servlet/bit/REQUEST.storymap [fields.layout.field.AbstractFieldLayoutManager] Field layout contains non-orderable field with id 'customfield_10107'.

AFTER RESTART SHOWS THIS ERROR:

	2013-11-26 21:19:04,285 localhost-startStop-1 INFO      [atlassian.jira.startup.ClusteringChecklistLauncher] JIRA clustering startup checks completed successfully.
	2013-11-26 21:19:04,287 localhost-startStop-1 INFO      [atlassian.jira.startup.JiraStartupLogger] 
	
	___ Starting the JIRA Plugin System _________________
	
	2013-11-26 21:19:04,288 localhost-startStop-1 INFO      [atlassian.plugin.manager.DefaultPluginManager] Initialising the plugin system
	2013-11-26 21:19:09,730 localhost-startStop-1 WARN      [atlassian.jira.security.GlobalPermissionsCache] Could not add permission Permission: [type=0][scheme=null][group=administrators][permType=group] - it already existed?
	

</entry>
<entry [Tue 2013:11:26 12:12:39 EST] CONFLUENCE-4 INSTALLED PLUGIN: GlIFFY>

... AND RESTARTED JIRA (THREE TIMES, WITH kill -9 AND shutdown.sh)

	OK

</entry>
<entry [Tue 2013:11:26 12:11:54 EST] CONFLUENCE-4 INSTALLED PLUGIN: GIT INTEGRATION>

TO DO: CONFIGURE AUTHENTICATION ON CONFLUENCE-4 FOR BITBUCKET

https://184.169.161.14:8444/secure/GitPluginInfo.jspa


	
</entry>
<entry [Tue 2013:11:26 02:27:52 EST] CREATED IMAGE OF CONFLUENCE-4>

AMI ID			ami-cc083989
AMI Name		CONFL-4-JIRA-LINKED-CONF-HTTPS
Description		CONFLUENCE-4 JIRA+data linked Confluence+data HTTPS ports 8443 and 8444

	
</entry>
<entry [Tue 2013:11:26 02:07:27 EST] ENABLED HTTPS FOR JIRA>

https://confluence.atlassian.com/display/JIRA/Running+JIRA+over+SSL+or+HTTPS

https://confluence.atlassian.com/display/JIRA/Changing+JIRA%27s+TCP+Ports


/opt/atlassian/jira/6.1.2/bin# ./config.sh
Loading application properties from /opt/atlassian/jira/6.1.2/atlassian-jira/WEB-INF/classes/jira-application.properties
jira-home not configured - no database settings can be loaded.
No graphics display available; using console.
----------------------
JIRA Configurator v1.1
----------------------

--- Main Menu ---
  [H] Configure JIRA Home
  [D] Database Selection
  [W] Web Server (incl. HTTP/HTTPs configuration)
  [A] Advanced Settings
  [S] Save and Exit
  [X] Exit without Saving

Main Menu> w

--- Web Server Configuration ---
  Control Port  : 8005
  Profile       : HTTP only
  HTTP Port     : 8080

  [P] Change the Profile (enable/disable HTTP/HTTPs)
  [H] Configure HTTP Port
  [X] Return to Main Menu

Web Server> p

To change the web server profile, please select one of the following options. The current profile is: HTTP only.

  [1] Disabled
  [2] HTTP only
  [3] HTTP and HTTPs (redirect HTTP to HTTPs)
  [4] HTTPs only
Profile (leave blank to exit)> 3

The next steps gather all required information to set up the HTTPs port (HTTP over SSL encryption). First of all, you need provide a so called key store containing the private key and the signed certificate. This can be either self-signed or obtained from a certified authority (CA). For more information, please see the link below. In order to verify the entered information, this tool will access the key store and print the certificate found.

https://confluence.atlassian.com/display/JIRA/Running+JIRA+over+SSL+or+HTTPS

Please select the keystore from the options below. It must contain the certificate and the private key to be used.
  [S] The system-wide Java keystore (/usr/share/jdk1.7.0_45/jre/lib/security/cacerts)
  [U] User-defined location
Keystore> u
Keystore Path (leave blank to exit)> /root/.keystore
Keystore Password> 
Key Alias> tomcat

The following certificate was found:

SerialNumber: 682355052
IssuerDN: CN=Stuart Young, OU=Bioinformatics, O=Annai Systems, L=San Diego, ST=CA, C=US
Start Date: Tuesday, November 26, 2013
Final Date: Monday, February 24, 2014
SubjectDN: CN=Stuart Young, OU=Bioinformatics, O=Annai Systems, L=San Diego, ST=CA, C=US

Do you want to use this certificate?  ([Y]/N)? > y
HTTPs Port> 8443

HTTP Port> 8080

Updated the profile to 'HTTP and HTTPs (redirect HTTP to HTTPs)'. Remember to save the changes on exit.

--- Web Server Configuration ---
  Control Port  : 8005
  Profile       : HTTP and HTTPs (redirect HTTP to HTTPs)
  HTTP Port     : 8080
  HTTPs Port    : 8444
  Keystore Path : /root/.keystore
  Key Alias     : tomcat

  [P] Change the Profile (enable/disable HTTP/HTTPs)
  [H] Configure HTTP Port
  [S] Configure SSL Encryption (requires an installed X509 certificate)
  [X] Return to Main Menu

Web Server> x

--- Main Menu ---
  [H] Configure JIRA Home
  [D] Database Selection
  [W] Web Server (incl. HTTP/HTTPs configuration)
  [A] Advanced Settings
  [S] Save and Exit
  [X] Exit without Saving

Main Menu> s

*** Please set a value for jira-home.

--- Main Menu ---
  [H] Configure JIRA Home
  [D] Database Selection
  [W] Web Server (incl. HTTP/HTTPs configuration)
  [A] Advanced Settings
  [S] Save and Exit
  [X] Exit without Saving

Main Menu> h
Current JIRA Home: 
New JIRA Home> /opt/atlassian/jira/6.1.2

--- Main Menu ---
  [H] Configure JIRA Home
  [D] Database Selection
  [W] Web Server (incl. HTTP/HTTPs configuration)
  [A] Advanced Settings
  [S] Save and Exit
  [X] Exit without Saving

Main Menu> s
Storing database configuration in /opt/atlassian/jira/6.1.2/dbconfig.xml
Settings saved successfully.

	
	
</entry>
<entry [Tue 2013:11:26 01:13:38 EST] ENABLED HTTPS FOR CONFLUENCE>

http://confluence.atlassian.com/display/DOC/Adding+SSL+for+Secure+Logins+and+Page+Security

1. CREATE SSL CERTIFICATE

$JAVA_HOME/bin/keytool -genkey -alias tomcat
-keyalg RSA

PASSWORD:
open4annai

	Enter keystore password:  
	Re-enter new password: 
	What is your first and last name?
	  [Unknown]:  Annai Systems
	What is the name of your organizational unit?
	  [Unknown]:  Annai Systems
	What is the name of your organization?
	  [Unknown]:  Annai Systems
	What is the name of your City or Locality?
	  [Unknown]:  San Diego
	What is the name of your State or Province?
	  [Unknown]:  California
	What is the two-letter country code for this unit?
	  [Unknown]:  US
	Is CN=Annai Systems, OU=Annai Systems, O=Annai Systems, L=San Diego, ST=California, C=US correct?
	  [no]:  yes
	
	Enter key password for < tomcat>
		(RETURN if same as keystore password):  

		RETURN	


WHICH CREATES THIS FILE

/root/.keystore



NB: DELETE ALIAS COMMAND

$JAVA_HOME/bin/keytool -delete -alias tomcat




2. ADD SSL CERTIFICATE PASSWORD TO conf/server.xml

<!--
        <Connector port="8443" maxHttpHeaderSize="8192"
                   maxThreads="150" minSpareThreads="25" maxSpareThreads="75"
                   enableLookups="false" disableUploadTimeout="true"
                   acceptCount="100" scheme="https" secure="true"
                   clientAuth="false" sslProtocol="TLS" SSLEnabled="true"
                   URIEncoding="UTF-8" keystorePass="open4annai"/>
-->


3. CHANGE BASE URL

Confluence Admin --> General --> Server Base URL -->  HTTPS


4. RESTART CONFLUENCE AND BROWSE TO HTTPS

https://184.169.161.14:8443


5. REDIRECT HTTP TO HTTPS

EDIT FILE 
(NB: NOT conf/web.xml)

confluence/WEB-INF/web.xml

AT END OF THE FILE, BEFORE THE FINAL TAG:
<!--
</web-app>
-->

ADD:

<!--

<security-constraint>
  <web-resource-collection>
    <web-resource-name>Restricted URLs</web-resource-name>
    <url-pattern>/</url-pattern>
  </web-resource-collection>
  <user-data-constraint>
    <transport-guarantee>CONFIDENTIAL</transport-guarantee>
  </user-data-constraint>
</security-constraint>

-->

NB: Check whether your Confluence site uses the RSS macro. If your site has the RSS macro enabled, you may need to configure the URL redirection with a firewall rule, rather than by editing the web.xml file. Skip the steps below and follow the steps on the RSS Feed Macro page instead.


6. RESTART CONFLUENCE

bin/shutdown.sh
bin/startup.sh


7. BROWSE TO HTTP TO CONFIRM REDIRECT TO HTTPS

http://184.169.161.14:8090

SHOULD GO TO

https://184.169.161.14:8443

	OK


	
</entry>
<entry [Tue 2013:11:26 00:39:07 EST] CREATED IMAGE ami-6a09382f OF CONFLUENCE-4 - JIRA+DATA LINKED TO CONFLUENCE+DATA>

AMI ID			ami-6a09382f
AMI Name		CONFL-4-JIRA-LINKED-CONFLUENCE
Description		CONFLUENCE-4 JIRA+data linked to Confluence+data
	
</entry>
<entry [Mon 2013:11:25 23:20:56 EST] CONFLUENCE-4 - CONFIGURING TRUSTED APPLICATION LINKS (CONFLUENCE - JIRA)>

https://confluence.atlassian.com/display/JIRA044/Configuring+Trusted+Applications+Authentication+for+an+Application+Link


1. ADD CONFLUENCE TO APPLICATION LINKS IN JIRA

Jira Admin --> Add-Ons --> Application Links

	There are existing Trusted Applications or OAuth relationships that should be upgraded to Application Links. Click here to upgrade.


2. CLICK TO UPGRADE

3. ADD CONFLUENCE URL http://184.169.161.14:8090

4. INPUT sysadmin USERNAME AND PASSWORD

	Created a two-way link to 'JIRA' using OAuth.

	OK

5. BROWSE TO CONFLUENCE TO VERIFY APPLICATION LINK TO JIRA

Confluence Admin --> Application Link



After that you should link a Confluence Space to a JIRA Project. You can do this from the Confluence Space admin page.


	
</entry>
<entry [Mon 2013:11:25 20:34:55 EST] CONFLUENCE-4 - FIXED APPLICATION LINKS TO JIRA>

https://confluence.atlassian.com/display/CONFKB/Application+Link+configuration+cannot+be+deleted+via+the+UI+and+appeared+as+system+link


PROBLEM

CAN'T DELETE OLD APPLICATION LINKS ENTRY FOR JIRA ON CONFLUENCE-4 (CONFLUENCE 5.3-OD-12)

OLD ENTRY FOR JIRA (annaisystems.atlassian.net)	SAYS:

	system link	JIRA	system links cannot be edited


SOLUTION

1. MANUALLY SEARCH IN CONFLUENCE bandana TABLE FOR 'applink' ENTRIES FOR OLD URL:

	annaisystems.atlassian.net

	

sudo -u postgres psql confluence -tAc "SELECT * FROM bandana WHERE bandanakey LIKE '%applink%'"

EXCERPTS:

<!--
18120705|_GLOBAL|applinks.application.0287f62d-4c9d-3380-90df-1ba3b710e28b.system|<string>true</string>
1015817|_GLOBAL|applinks.admin.0287f62d-4c9d-3380-90df-1ba3b710e28b.providerKeys|<list>
  <string>com.atlassian.applinks.api.auth.types.TrustedAppsAuthenticationProvider</string>
</list>
1015816|_GLOBAL|applinks.admin.0287f62d-4c9d-3380-90df-1ba3b710e28b.auth.6d155ed3bad9279f47057a0913e2596e|<properties/>
1015812|_GLOBAL|applinks.admin.0287f62d-4c9d-3380-90df-1ba3b710e28b.rpc.url|<string>https://annaisystems.atlassian.net</string>
1015811|_GLOBAL|applinks.admin.0287f62d-4c9d-3380-90df-1ba3b710e28b.display.url|<string>https://annaisystems.atlassian.net</string>
1015810|_GLOBAL|applinks.admin.0287f62d-4c9d-3380-90df-1ba3b710e28b.name|<string>JIRA (annaisystems.atlassian.net)</string>
1015809|_GLOBAL|applinks.admin.0287f62d-4c9d-3380-90df-1ba3b710e28b.type|<string>jira</string>
16941059|_GLOBAL|applinks.admin.0287f62d-4c9d-3380-90df-1ba3b710e28b.system|<string>true</string>
-->


2. DELETE ALL THE OLD URL ENTRIES


DELETE FROM BANDANA WHERE BANDANAKEY LIKE '%applink%';

sudo -u postgres psql confluence -tAc "DELETE FROM BANDANA WHERE BANDANAKEY LIKE '%applink%'"
DELETE 104


3. SET BASE URL IN JIRA


4. RESTARTED CONFLUENCE AND JIRA


5. CREATE A JIRA LINK IN CONFLUENCE

	OK



NOTES
-----

DELETING JUST A SELECTION OF ENTRIES FROM THE bandana TABLE DID NOT WORK:


sudo -u postgres psql confluence -tAc "DELETE FROM bandana WHERE bandanaid IN (18120705,1015817,1015816,1015812,1015811,1015810,1015809,16941059)"



sudo -u postgres psql confluence	

	\d bandana
				   Table "public.bandana"
		 Column     |          Type          | Modifiers 
	----------------+------------------------+-----------
	 bandanaid      | bigint                 | not null
	 bandanacontext | character varying(255) | not null
	 bandanakey     | character varying(100) | not null
	 bandanavalue   | text                   | 
	Indexes:
		"bandana_pkey" PRIMARY KEY, btree (bandanaid)
		"bandana_unique_key" UNIQUE CONSTRAINT, btree (bandanacontext, bandanakey)
		"band_cont_key_idx" btree (bandanacontext, bandanakey)
		"band_context_idx" btree (bandanacontext)



3. UPDATE THE applinks.global.application.ids ENTRY IN THE bandana TABLE 

sudo -u postgres psql confluence -tAc "SELECT bandanavalue FROM bandana WHERE bandanakey = 'applinks.global.application.ids'"

<!--
1015813|_GLOBAL|applinks.global.application.ids|<list>
  <string>0287f62d-4c9d-3380-90df-1ba3b710e28b</string>
  <string>4c25aa51-96a9-3645-b80a-07029693ca07</string>
  <string>06eb0d02-ec02-3cfb-a303-6ad9e6121226</string>
</list>
-->

REMOVE OLD URL ID:

<!--
sudo -u postgres psql confluence -tAc "UPDATE bandana SET
bandanavalue = '<list>
  <string>26640197-3a9f-30dd-b0f7-97947cdfb7df</string>
  <string>034974ba-a91a-33aa-a715-aa15aa133374</string>
 </list>'
WHERE bandanakey = 'applinks.global.application.ids'"
-->

CONFIRM REMOVAL OF OLD URL ID:

sudo -u postgres psql confluence -tAc "SELECT bandanavalue FROM bandana WHERE bandanakey = 'applinks.global.application.ids'"

<!--
<list>
  <string>26640197-3a9f-30dd-b0f7-97947cdfb7df</string>
  <string>034974ba-a91a-33aa-a715-aa15aa133374</string>
 </list>
-->


4. RESTART CONFLUENCE

NB: If you would prefer or wanted to delete all of the existing application link configurations, run the following query instead and restart the server afterwards:

DELETE FROM BANDANA WHERE BANDANAKEY LIKE '%applink%';



5. BROWSE TO CONFLUENCE

Confluence Admin --> Application Links


https://confluence.atlassian.com/display/CONFKB/(Invocation+of+method+'getOrphanedTrustCertificates')+NullPointerException+When+Trying+to+List+Application+Links

PROBLEM

'Application Links' PAGE ERRORS OUT:

getOrphanedTrustCertificates' in class com.atlassian.applinks.ui.velocity.ListApplicationLinksContex

DIAGNOSIS

The com.atlassian.oauth.serviceprovider.ServiceProviderConsumerStore.allConsumerKeys BANDANAVALUE is corrupted in BANDANA (a table in the Confluence Database).


SOLUTION

1. Obtain the current BANDANAVALUE for that particular row via this query:

sudo -u postgres psql confluence -tAc "SELECT * FROM BANDANA WHERE BANDANAKEY = 'com.atlassian.oauth.serviceprovider.ServiceProviderConsumerStore.allConsumerKeys'"

<!--
	38633477|_GLOBAL|com.atlassian.oauth.serviceprovider.ServiceProviderConsumerStore.allConsumerKeys|<string>jira%3A453389/lucidchart-app</string>
-->


FLUSH ALL CACHE STATISTICS


OR SIMPLY







Example of output:

<!--
<string>jira%3A5326876/MIGfMA0GCSqGSIb3DQEBAQUAA4GNADCBiQKBgQCnwU6SzPcDiF++cF7MAlyrW0M9CfT3sJaQisUOCKt6wnMpzIHPYpjIYIYY%2BvWP0X++IdJPx8j%2FdXvwdpesLEc%2BDnZdUHonaPF%2FsBeWX2BrKTngYtSLvb++Lme6S%2BG7tF3ODAFpoC8qKEZnflA308SqqA2Tqzg675eo6YaUt3/MIGfMA0GCSqGSIb3DQEBAQUAA4GNADCBiQKBgQCnwU6SzPcDiF++cF7MAlyrW0M9CfT3sJaQisUOCKt6wnMpzIHPYpjIYIYY%2BvWP0X++IdJPx8j%2FdXvwdpesLEc%2BDnZdUHonaPF%2FsBeWX2BrKTngYtSLvb++Lme6S%2BG7tF3ODAFpoC8qKEZnflA308SqqA2Tqzg675eo6YaUt3++7Ystw%2FDQUwIDAQAB</string>

Notice that the key itself is appended after the application ID? You will need to remove all values after the application ID, which is marked by the front slash, '/'

Extract the Application ID out of the BANDANAVALUE, and update it this way. Example:

UPDATE bandana SET BANDANAVALUE = '<string>jira%3A5326876</string>' WHERE BANDANAKEY = 'com.atlassian.oauth.serviceprovider.ServiceProviderConsumerStore.allConsumerKeys';

-->


Flush all the caches in Confluence Admin >> Cache Statistics and you are good to go






NOTES
-----

FULL OUTPUT:

sudo -u postgres psql confluence -tAc "SELECT * FROM bandana WHERE bandanakey LIKE '%applink%'"

<!--2981893|_GLOBAL|applinks.local.SYSARCH.confluence_space.primary.jira.project|<properties>
  <property name="key" value="SYSARCH"/>
  <property name="applicationId" value="0287f62d-4c9d-3380-90df-1ba3b710e28b"/>
</properties>
2981892|_GLOBAL|applinks.local.SYSARCH.confluence_space.linked.entities|<list>
  <string>{&quot;typeI18n&quot;:&quot;applinks.jira.project&quot;,&quot;name&quot;:&quot;SYSARCH&quot;,&quot;applicationId&quot;:&quot;0287f62d-4c9d-3380-90df-1ba3b710e28b&quot;,&quot;type&quot;:&quot;jira.project&quot;,&quot;key&quot;:&quot;SYSARCH&quot;}</string>
</list>
5406727|_GLOBAL|applinks.local.REQUEST.confluence_space.linked.entities|<list>
  <string>{&quot;typeI18n&quot;:&quot;applinks.jira.project&quot;,&quot;name&quot;:&quot;REQUEST&quot;,&quot;applicationId&quot;:&quot;0287f62d-4c9d-3380-90df-1ba3b710e28b&quot;,&quot;type&quot;:&quot;jira.project&quot;,&quot;key&quot;:&quot;REQUEST&quot;}</string>
</list>
5406728|_GLOBAL|applinks.local.REQUEST.confluence_space.primary.jira.project|<properties>
  <property name="key" value="REQUEST"/>
  <property name="applicationId" value="0287f62d-4c9d-3380-90df-1ba3b710e28b"/>
</properties>
37257220|_GLOBAL|applinks.admin.4c25aa51-96a9-3645-b80a-07029693ca07.type|<string>remote.plugin.container</string>
37257230|_GLOBAL|applinks.admin.4c25aa51-96a9-3645-b80a-07029693ca07.providerKeys|<list>
  <string>com.atlassian.applinks.api.auth.types.OAuthAuthenticationProvider</string>
</list>
37257233|_GLOBAL|applinks.application.4c25aa51-96a9-3645-b80a-07029693ca07.oauth.incoming.consumerkey|<string>lucidchart-app</string>
37257223|_GLOBAL|applinks.admin.4c25aa51-96a9-3645-b80a-07029693ca07.rpc.url|<string>https://www.lucidchart.com/ondemand</string>
37257224|_GLOBAL|applinks.admin.4c25aa51-96a9-3645-b80a-07029693ca07.primary|<string>true</string>
37257221|_GLOBAL|applinks.admin.4c25aa51-96a9-3645-b80a-07029693ca07.name|<string>Lucidchart</string>
37257222|_GLOBAL|applinks.admin.4c25aa51-96a9-3645-b80a-07029693ca07.display.url|<string>https://www.lucidchart.com/ondemand</string>
37257227|_GLOBAL|applinks.application.4c25aa51-96a9-3645-b80a-07029693ca07.IS_ACTIVITY_ITEM_PROVIDER|<string>false</string>
37257228|_GLOBAL|applinks.application.4c25aa51-96a9-3645-b80a-07029693ca07.system|<string>true</string>
37257225|_GLOBAL|applinks.application.4c25aa51-96a9-3645-b80a-07029693ca07.plugin-key|<string>lucidchart-app</string>
37257226|_GLOBAL|applinks.admin.4c25aa51-96a9-3645-b80a-07029693ca07.propertyKeys|<list>
  <string>plugin-key</string>
  <string>IS_ACTIVITY_ITEM_PROVIDER</string>
  <string>system</string>
  <string>oauth.incoming.consumerkey</string>
</list>
36339749|_GLOBAL|applinks.local.~ThomasS.confluence_space.linked.entities|<list/>
36339747|_GLOBAL|applinks.local.~SerenaF.confluence_space.linked.entities|<list/>
36339748|_GLOBAL|applinks.local.~StuartY.confluence_space.linked.entities|<list/>
36339745|_GLOBAL|applinks.local.MP.confluence_space.linked.entities|<list/>
36339746|_GLOBAL|applinks.local.~michael_penley.confluence_space.linked.entities|<list/>
36339743|_GLOBAL|applinks.local.~dan_maltbie.confluence_space.linked.entities|<list/>
36339744|_GLOBAL|applinks.local.PANCAN.confluence_space.linked.entities|<list/>
36339740|_GLOBAL|applinks.application.938a99a6-a42a-38a3-8454-71a158b1bef3.system|<string>true</string>
10125339|_GLOBAL|applinks.local.TRAIN.confluence_space.primary.fecru.repository|<properties>
  <property name="key" value="TRAIN"/>
  <property name="applicationId" value="f85c7cf8-c1f7-3a5b-aae8-c4f16e146a18"/>
</properties>
10125340|_GLOBAL|applinks.local.CTCA.confluence_space.primary.fecru.project|<properties>
  <property name="key" value="CR-CTCA"/>
  <property name="applicationId" value="f85c7cf8-c1f7-3a5b-aae8-c4f16e146a18"/>
</properties>
10125337|_GLOBAL|applinks.local.REQUEST.confluence_space.primary.fecru.repository|<properties>
  <property name="key" value="REQUEST"/>
  <property name="applicationId" value="f85c7cf8-c1f7-3a5b-aae8-c4f16e146a18"/>
</properties>
10125338|_GLOBAL|applinks.local.GTXFER.confluence_space.primary.fecru.repository|<properties>
  <property name="key" value="GTXFER"/>
  <property name="applicationId" value="f85c7cf8-c1f7-3a5b-aae8-c4f16e146a18"/>
</properties>
10125335|_GLOBAL|applinks.local.FRED.confluence_space.primary.fecru.repository|<properties>
  <property name="key" value="FRED"/>
  <property name="applicationId" value="f85c7cf8-c1f7-3a5b-aae8-c4f16e146a18"/>
</properties>
10125336|_GLOBAL|applinks.local.CGHUB.confluence_space.primary.fecru.repository|<properties>
  <property name="key" value="CGHUB"/>
  <property name="applicationId" value="f85c7cf8-c1f7-3a5b-aae8-c4f16e146a18"/>
</properties>
10125333|_GLOBAL|applinks.local.CGHUBDEV.confluence_space.primary.fecru.repository|<properties>
  <property name="key" value="CGHUBDEV"/>
  <property name="applicationId" value="f85c7cf8-c1f7-3a5b-aae8-c4f16e146a18"/>
</properties>
10125334|_GLOBAL|applinks.local.SYSARCH.confluence_space.primary.fecru.repository|<properties>
  <property name="key" value="SYSARCH"/>
  <property name="applicationId" value="f85c7cf8-c1f7-3a5b-aae8-c4f16e146a18"/>
</properties>
10125347|_GLOBAL|applinks.local.REQUEST.confluence_space.primary.fecru.project|<properties>
  <property name="key" value="CR-REQUEST"/>
  <property name="applicationId" value="f85c7cf8-c1f7-3a5b-aae8-c4f16e146a18"/>
</properties>
10125348|_GLOBAL|applinks.local.GTXFER.confluence_space.primary.fecru.project|<properties>
  <property name="key" value="CR-GTXFER"/>
  <property name="applicationId" value="f85c7cf8-c1f7-3a5b-aae8-c4f16e146a18"/>
</properties>
10125345|_GLOBAL|applinks.local.FRED.confluence_space.primary.fecru.project|<properties>
  <property name="key" value="CR-FRED"/>
  <property name="applicationId" value="f85c7cf8-c1f7-3a5b-aae8-c4f16e146a18"/>
</properties>
10125346|_GLOBAL|applinks.local.CGHUB.confluence_space.primary.fecru.project|<properties>
  <property name="key" value="CR-CGHUB"/>
  <property name="applicationId" value="f85c7cf8-c1f7-3a5b-aae8-c4f16e146a18"/>
</properties>
10125343|_GLOBAL|applinks.local.CGHUBDEV.confluence_space.primary.fecru.project|<properties>
  <property name="key" value="CR-CGHUBDEV"/>
  <property name="applicationId" value="f85c7cf8-c1f7-3a5b-aae8-c4f16e146a18"/>
</properties>
10125344|_GLOBAL|applinks.local.SYSARCH.confluence_space.primary.fecru.project|<properties>
  <property name="key" value="CR-SYSARCH"/>
  <property name="applicationId" value="f85c7cf8-c1f7-3a5b-aae8-c4f16e146a18"/>
</properties>
10125341|_GLOBAL|applinks.local.SED.confluence_space.primary.fecru.project|<properties>
  <property name="key" value="CR-SED"/>
  <property name="applicationId" value="f85c7cf8-c1f7-3a5b-aae8-c4f16e146a18"/>
</properties>
10125342|_GLOBAL|applinks.local.TCGA.confl
uence_space.primary.fecru.project|<properties>
  <property name="key" value="CR-TCGA"/>
  <property name="applicationId" value="f85c7cf8-c1f7-3a5b-aae8-c4f16e146a18"/>
</properties>
10125349|_GLOBAL|applinks.local.TRAIN.confluence_space.primary.fecru.project|<properties>
  <property name="key" value="CR-TRAIN"/>
  <property name="applicationId" value="f85c7cf8-c1f7-3a5b-aae8-c4f16e146a18"/>
</properties>
10125313|_GLOBAL|applinks.local.CTCA.confluence_space.linked.entities|<list>
  <string>{&quot;typeI18n&quot;:&quot;applinks.jira.project&quot;,&quot;name&quot;:&quot;CTCA&quot;,&quot;applicationId&quot;:&quot;0287f62d-4c9d-3380-90df-1ba3b710e28b&quot;,&quot;type&quot;:&quot;jira.project&quot;,&quot;key&quot;:&quot;CTCA&quot;}</string>
</list>
10125314|_GLOBAL|applinks.local.CTCA.confluence_space.primary.jira.project|<properties>
  <property name="key" value="CTCA"/>
  <property name="applicationId" value="0287f62d-4c9d-3380-90df-1ba3b710e28b"/>
</properties>
10125315|_GLOBAL|applinks.local.TCGA.confluence_space.linked.entities|<list>
  <string>{&quot;typeI18n&quot;:&quot;applinks.jira.project&quot;,&quot;name&quot;:&quot;TCGA&quot;,&quot;applicationId&quot;:&quot;0287f62d-4c9d-3380-90df-1ba3b710e28b&quot;,&quot;type&quot;:&quot;jira.project&quot;,&quot;key&quot;:&quot;TCGA&quot;}</string>
</list>
10125316|_GLOBAL|applinks.local.TCGA.confluence_space.primary.jira.project|<properties>
  <property name="key" value="TCGA"/>
  <property name="applicationId" value="0287f62d-4c9d-3380-90df-1ba3b710e28b"/>
</properties>
10125318|_GLOBAL|applinks.local.FRED.confluence_space.primary.jira.project|<properties>
  <property name="key" value="FRED"/>
  <property name="applicationId" value="0287f62d-4c9d-3380-90df-1ba3b710e28b"/>
</properties>
10125317|_GLOBAL|applinks.local.FRED.confluence_space.linked.entities|<list>
  <string>{&quot;typeI18n&quot;:&quot;applinks.jira.project&quot;,&quot;name&quot;:&quot;FRED&quot;,&quot;applicationId&quot;:&quot;0287f62d-4c9d-3380-90df-1ba3b710e28b&quot;,&quot;type&quot;:&quot;jira.project&quot;,&quot;key&quot;:&quot;FRED&quot;}</string>
</list>
10125320|_GLOBAL|applinks.local.CGHUB.confluence_space.primary.jira.project|<properties>
  <property name="key" value="CGHUB"/>
  <property name="applicationId" value="0287f62d-4c9d-3380-90df-1ba3b710e28b"/>
</properties>
10125319|_GLOBAL|applinks.local.CGHUB.confluence_space.linked.entities|<list>
  <string>{&quot;typeI18n&quot;:&quot;applinks.jira.project&quot;,&quot;name&quot;:&quot;CGHUB&quot;,&quot;applicationId&quot;:&quot;0287f62d-4c9d-3380-90df-1ba3b710e28b&quot;,&quot;type&quot;:&quot;jira.project&quot;,&quot;key&quot;:&quot;CGHUB&quot;}</string>
</list>
10125322|_GLOBAL|applinks.local.TRAIN.confluence_space.primary.jira.project|<properties>
  <property name="key" value="TRAIN"/>
  <property name="applicationId" value="0287f62d-4c9d-3380-90df-1ba3b710e28b"/>
</properties>
10125321|_GLOBAL|applinks.local.TRAIN.confluence_space.linked.entities|<list>
  <string>{&quot;typeI18n&quot;:&quot;applinks.jira.project&quot;,&quot;name&quot;:&quot;TRAIN&quot;,&quot;applicationId&quot;:&quot;0287f62d-4c9d-3380-90df-1ba3b710e28b&quot;,&quot;type&quot;:&quot;jira.project&quot;,&quot;key&quot;:&quot;TRAIN&quot;}</string>
</list>
10125330|_GLOBAL|applinks.local.CTCA.confluence_space.primary.fecru.repository|<properties>
  <property name="key" value="CTCA"/>
  <property name="applicationId" value="f85c7cf8-c1f7-3a5b-aae8-c4f16e146a18"/>
</properties>
10125332|_GLOBAL|applinks.local.TCGA.confluence_space.primary.fecru.repository|<properties>
  <property name="key" value="TCGA"/>
  <property name="applicationId" value="f85c7cf8-c1f7-3a5b-aae8-c4f16e146a18"/>
</properties>
10125331|_GLOBAL|applinks.local.SED.confluence_space.primary.fecru.repository|<properties>
  <property name="key" value="SED"/>
  <property name="applicationId" value="f85c7cf8-c1f7-3a5b-aae8-c4f16e146a18"/>
</properties>
12582920|_GLOBAL|applinks.local.SYSTEST.confluence_space.primary.fecru.repository|<properties>
  <property name="key" value="SYSTEST"/>
  <property name="applicationId" value="f85c7cf8-c1f7-3a5b-aae8-c4f16e146a18"/>
</properties>
12582917|_GLOBAL|applinks.local.SYSTEST.confluence_space.linked.entities|<list>
  <string>{&quot;typeI18n&quot;:&quot;applinks.jira.project&quot;,&quot;name&quot;:&quot;SYSTEST&quot;,&quot;applicationId&quot;:&quot;0287f62d-4c9d-3380-90df-1ba3b710e28b&quot;,&quot;type&quot;:&quot;jira.project&quot;,&quot;key&quot;:&quot;SYSTEST&quot;}</string>
</list>
12582918|_GLOBAL|applinks.local.SYSTEST.confluence_space.primary.jira.project|<properties>
  <property name="key" value="SYSTEST"/>
  <property name="applicationId" value="0287f62d-4c9d-3380-90df-1ba3b710e28b"/>
</properties>
12582922|_GLOBAL|applinks.local.SYSTEST.confluence_space.primary.fecru.project|<properties>
  <property name="key" value="CR-SYSTEST"/>
  <property name="applicationId" value="f85c7cf8-c1f7-3a5b-aae8-c4f16e146a18"/>
</properties>
24150036|_GLOBAL|applinks.local.~rick_reitmaier.confluence_space.linked.entities|<list/>
24150035|_GLOBAL|applinks.local.CGHubLessons.confluence_space.linked.entities|<list/>
24150037|_GLOBAL|applinks.local.~ying_wang.confluence_space.linked.entities|<list/>
18120712|_GLOBAL|applinks.local.SDSCFARM.confluence_space.primary.fecru.repository|<properties>
  <property name="key" value="SDSCFARM"/>
  <property name="applicationId" value="f85c7cf8-c1f7-3a5b-aae8-c4f16e146a18"/>
</properties>
18120709|_GLOBAL|applinks.local.SDSCFARM.confluence_space.linked.entities|<list>
  <string>{&quot;typeI18n&quot;:&quot;applinks.jira.project&quot;,&quot;name&quot;:&quot;SDSCFARM&quot;,&quot;applicationId&quot;:&quot;0287f62d-4c9d-3380-90df-1ba3b710e28b&quot;,&quot;type&quot;:&quot;jira.project&quot;,&quot;key&quot;:&quot;SDSCFARM&quot;}</string>
</list>
18120710|_GLOBAL|applinks.local.SDSCFARM.confluence_space.primary.jira.project|<properties>
  <property name="key" value="SDSCFARM"/>
  <property name="applicationId" value="0287f62d-4c9d-3380-90df-1ba3b710e28b"/>
</properties>
18120714|_GLOBAL|applinks.local.SDSCFARM.confluence_space.primary.fecru.project|<properties>
  <property name="key" value="CR-SDSCFARM"/>
  <property name="applicationId" value="f85c7cf8-c1f7-3a5b-aae8-c4f16e146a18"/>
</properties>
18120706|_GLOBAL|applinks.application.f85c7cf8-c1f7-3a5b-aae8-c4f16e146a18.system|<string>true</string>


18120705|_GLOBAL|applinks.application.0287f62d-4c9d-3380-90df-1ba3b710e28b.system|<string>true</string>


3637256|_GLOBAL|applinks.local.CGHUBDEV.confluence_space.linked.entities|<list>
  <string>{&quot;typeI18n&quot;:&quot;applinks.jira.project&quot;,&quot;name&quot;:&quot;CGHUBDEV&quot;,&quot;applicationId&quot;:&quot;0287f62d-4c9d-3380-90df-1ba3b710e28b&quot;,&quot;type&quot;:&quot;jira.project&quot;,&quot;key&quot;:&quot;CGHUBDEV&quot;}</string>
</list>
3637257|_GLOBAL|applinks.local.CGHUBDEV.confluence_space.primary.jira.project|<properties>
  <property name="key" value="CGHUBDEV"/>
  <property name="applicationId" value="0287f62d-4c9d-3380-90df-1ba3b710e28b"/>
</properties>
3637250|_GLOBAL|applinks.local.TSTP.confluence_space.linked.entities|<list/>
6422531|_GLOBAL|applinks.local.SED.confluence_space.primary.jira.project|<properties>
  <property name="key" value="SED"/>
  <property name="applicationId" value="0287f62d-4c9d-3380-90df-1ba3b710e28b"/>
</properties>
6422530|_GLOBAL|applinks.local.SED.confluence_space.linked.entities|<list>
  <string>{&quot;typeI18n&quot;:&quot;applinks.jira.project&quot;,&quot;name&quot;:&quot;SED&quot;,&quot;applicationId&quot;:&quot;0287f62d-4c9d-3380-90df-1ba3b710e28b&quot;,&quot;type&quot;:&quot;jira.project&quot;,&quot;key&quot;:&quot;SED&quot;}</string>
</list>
14778383|_GLOBAL|applinks.local.CLEAR.confluence_space.primary.fecru.project|<properties>
  <property name="key" value="CR-CLEAR"/>
  <property name="applicationId" value="f85c7cf8-c1f7-3a5b-aae8-c4f16e146a18"/>
</properties>
14778381|_GLOBAL|applinks.local.CLEAR.confluence_space.primary.fecru.repository|<properties>
  <property name="key" value="CLEAR"/>
  <property name="applicationId" value="f85c7cf8-c1f7-3a5b-aae8-c4f16e146a18"/>
</properties>
14778379|_GLOBAL|applinks.local.CLEAR.confluence_space.primary.jira.project|<properties>
  <property name="key" value="CLEAR"/>
  <property name="applicationId" value="0287f62d-4c9d-3380-90df-1ba3b710e28b"/>
</properties>
14778378|_GLOBAL|applinks.local.CLEAR.confluence_space.linked.entities|<list>
  <string>{&quot;typeI18n&quot;:&quot;applinks.jira.project&quot;,&quot;name&quot;:&quot;CLEAR&quot;,&quot;applicationId&quot;:&quot;0287f62d-4c9d-3380-90df-1ba3b710e28b&quot;,&quot;type&quot;:&quot;jira.project&quot;,&quot;key&quot;:&quot;CLEAR&quot;}</string>
</list>
14778373|_GLOBAL|applinks.local.CLEARF.confluence_space.primary.fecru.repository|<properties>
  <property name="key" value="CLEARF"/>
  <property name="applicationId" value="f85c7cf8-c1f7-3a5b-aae8-c4f16e146a18"/>
</properties>
14778371|_GLOBAL|applinks.local.CLEARF.confluence_space.primary.jira.project|<properties>
  <property name="key" value="CLEARF"/>
  <property name="applicationId" value="0287f62d-4c9d-3380-90df-1ba3b710e28b"/>
</properties>
14778370|_GLOBAL|applinks.local.CLEARF.confluence_space.linked.entities|<list/>
19398666|_GLOBAL|applinks.local.ABCFARM.confluence_space.primary.fecru.project|<properties>
  <property name="key" value="CR-ABCFARM"/>
  <property name="applicationId" value="f85c7cf8-c1f7-3a5b-aae8-c4f16e146a18"/>
</properties>
19398662|_GLOBAL|applinks.local.ABCFARM.confluence_space.primary.jira.project|<properties>
  <property name="key" value="ABCFARM"/>
  <property name="applicationId" value="0287f62d-4c9d-3380-90df-1ba3b710e28b"/>
</properties>
19398661|_GLOBAL|applinks.local.ABCFARM.confluence_space.linked.entities|<list>
  <string>{&quot;typeI18n&quot;:&quot;applinks.jira.project&quot;,&quot;name&quot;:&quot;ABCFARM&quot;,&quot;applicationId&quot;:&quot;0287f62d-4c9d-3380-90df-1ba3b710e28b&quot;,&quot;type&quot;:&quot;jira.project&quot;,&quot;key&quot;:&quot;ABCFARM&quot;}</string>
</list>
19398664|_GLOBAL|applinks.local.ABCFARM.confluence_space.primary.fecru.repository|<properties>
  <property name="key" value="ABCFARM"/>
  <property name="applicationId" value="f85c7cf8-c1f7-3a5b-aae8-c4f16e146a18"/>
</properties>


1015817|_GLOBAL|applinks.admin.0287f62d-4c9d-3380-90df-1ba3b710e28b.providerKeys|<list>
  <string>com.atlassian.applinks.api.auth.types.TrustedAppsAuthenticationProvider</string>
</list>
1015816|_GLOBAL|applinks.admin.0287f62d-4c9d-3380-90df-1ba3b710e28b.auth.6d155ed3bad9279f47057a0913e2596e|<properties/>
1015812|_GLOBAL|applinks.admin.0287f62d-4c9d-3380-90df-1ba3b710e28b.rpc.url|<string>https://annaisystems.atlassian.net</string>
1015811|_GLOBAL|applinks.admin.0287f62d-4c9d-3380-90df-1ba3b710e28b.display.url|<string>https://annaisystems.atlassian.net</string>
1015810|_GLOBAL|applinks.admin.0287f62d-4c9d-3380-90df-1ba3b710e28b.name|<string>JIRA (annaisystems.atlassian.net)</string>
1015809|_GLOBAL|applinks.admin.0287f62d-4c9d-3380-90df-1ba3b710e28b.type|<string>jira</string>



9502723|_GLOBAL|applinks.local.GTXFER.confluence_space.primary.jira.project|<properties>
  <property name="key" value="GTXFER"/>
  <property name="applicationId" value="0287f62d-4c9d-3380-90df-1ba3b710e28b"/>
</properties>
9502722|_GLOBAL|applinks.local.GTXFER.confluence_space.linked.entities|<list>
  <string>{&quot;typeI18n&quot;:&quot;applinks.jira.project&quot;,&quot;name&quot;:&quot;GTXFER&quot;,&quot;applicationId&quot;:&quot;0287f62d-4c9d-3380-90df-1ba3b710e28b&quot;,&quot;type&quot;:&quot;jira.project&quot;,&quot;key&quot;:&quot;GTXFER&quot;}</string>
</list>
4292610|_GLOBAL|applinks.local.TTP.confluence_space.linked.entities|<list/>
1015814|_GLOBAL|applinks.admin.0287f62d-4c9d-3380-90df-1ba3b710e28b.primary|<string>false</string>



16941059|_GLOBAL|applinks.admin.0287f62d-4c9d-3380-90df-1ba3b710e28b.system|<string>true</string>



38633476|_GLOBAL|applinks.admin.4c25aa51-96a9-3645-b80a-07029693ca07.auth.52e4d6463f02700eeefbefc74233de4f|<properties>
  <property name="consumerKey.outbound" value="remote.plugin.container"/>
  <property name="serviceProvider.requestTokenUrl" value="https://www.lucidchart.com/ondemand/request"/>
  <property name="serviceProvider.accessTokenUrl" value="https://www.lucidchart.com/ondemand/authorize"/>
  <property name="serviceProvider.authorizeUrl" value="https://www.lucidchart.com/ondemand/authorize"/>
</properties>
38731782|_GLOBAL|applinks.admin.06eb0d02-ec02-3cfb-a303-6ad9e6121226.type|<string>jira</string>
38731783|_GLOBAL|applinks.admin.06eb0d02-ec02-3cfb-a303-6ad9e6121226.name|<string>JIRA</string>
38731784|_GLOBAL|applinks.admin.06eb0d02-ec02-3cfb-a303-6ad9e6121226.display.url|<string>http://localhost:8080</string>
38731785|_GLOBAL|applinks.admin.06eb0d02-ec02-3cfb-a303-6ad9e6121226.rpc.url|<string>http://184.169.161.14:8080</string>

1015813|_GLOBAL|applinks.global.application.ids|<list>
  <string>0287f62d-4c9d-3380-90df-1ba3b710e28b</string>
  <string>4c25aa51-96a9-3645-b80a-07029693ca07</string>
  <string>06eb0d02-ec02-3cfb-a303-6ad9e6121226</string>
</list>


38731787|_GLOBAL|applinks.admin.06eb0d02-ec02-3cfb-a303-6ad9e6121226.propertyKeys|<list>
  <string>oauth.incoming.consumerkey</string>
</list>
38731789|_GLOBAL|applinks.admin.06eb0d02-ec02-3cfb-a303-6ad9e6121226.auth.52e4d6463f02700eeefbefc74233de4f|<properties/>
38731790|_GLOBAL|applinks.admin.06eb0d02-ec02-3cfb-a303-6ad9e6121226.providerKeys|<list>
  <string>com.atlassian.applinks.api.auth.types.OAuthAuthenticationProvider</string>
</list>
38731786|_GLOBAL|applinks.application.06eb0d02-ec02-3cfb-a303-6ad9e6121226.oauth.incoming.consumerkey|<string>jira:453389</string>
38731792|_GLOBAL|applinks.admin.06eb0d02-ec02-3cfb-a303-6ad9e6121226.primary|<string>true</string>

-->


</entry>
<entry [Mon 2013:11:25 14:53:32 EST] AGILE GLOSSARY - EPIC, STORY, TASK, ETC.>

http://www.solutionsiq.com/resources/glossary/?Tag=Story


Epic

A very large user story that is eventually broken down into smaller stories. Epics are often used as placeholders for new ideas that have not been thought out fully or whose full elaboration has been deferred until actually needed. Epic stories help agile development teams effectively manage and groom their product backlog.
Return to Glossary StoryEpicbackloggroom
Estimation

The process of agreeing on a size measurement for the stories or tasks in a product backlog. On agile projects, estimation is done by the team responsible for delivering the work, usually using a planning game.
Related links: Estimation
Return to Glossary StoryBacklogPlanning GameEstimationTasks
Feature

A coherent business function or attribute of a software product or system. Features are large and chunky and usually comprise many detailed (unit) requirements. A single feature typically is implemented through many stories. Features may be functional or non-functional; they provide the basis for organizing stories.
Related links: Feature
See also: Minimum Marketable Features
Return to Glossary StoryMinimum Marketable FeaturesFeature
Story

A requirement, feature and/or unit of business value that can be estimated and tested. Stories describe work that must be done to create and deliver a feature for a product. Stories are the basic unit of communication, planning, and negotiation between the Scrum Team, Business Owners, and the Product Owner. Stories consist of the following elements:
A description, usually in business terms
A size, for rough estimation purposes, generally expressed in story points (such as 1, 2, 3, 5)
An acceptance test, giving a short description of how the story will be validated
Related links: Story
Return to Glossary Story
Task

Tasks are descriptions of the actual work that an individual or pair does in order to complete a story. They are manageable, doable, and trackable units of work. Typically, there are several tasks per story. Tasks have the following attributes, and all tasks must be verified complete - not just "done":
A description of the work to be performed, in either technical or business terms
An estimate of how much time the work will take (hours, days)
An owner, who may or may not be pre-assigned
An exit criteria and verification method (test or inspection)
An indication of who will be responsible for the verification
Related links: Task


</entry>
<entry [Mon 2013:11:25 01:30:11 EST] CREATED IMAGE FROM CONFLUENCE-4 - JIRA+DATA AND CONFLUENCE+DATA>

AMI ID			ami-ca18298f
AMI Name		CONFL-4-JIRA-DATA-CONFLUENCE-DATA
Description		CONFLUENCE-4 JIRA with data, Confluence with data

	
</entry>
<entry [Mon 2013:11:25 00:09:45 EST] CONFLUENCE-4 - ADD CONFLUENCE DATA>


1. COPY CONFLUENCE BACKUP FILE TO CONFLUENCE restore FOLDER

cp /home/ubuntu/software/atlassian/annai-confluence-backup-20131125.zip \
/var/atlassian/application-data/confluence/5.3-OD-12/restore


2. BACKUP FROM RESTORE IN BROWSER

Confluence Admin --> Backup --> Restore a Backup from the Confluence Home Directory

	OK


</entry>
<entry [Sun 2013:11:24 23:49:04 EST] CREATED IMAGE OF CONFLUENCE-4: Fixed confluence config hang at 'User Management'>

AMI ID				ami-a41627e1
AMI Name			CONFL-4-JIRA-DATA-CONFLUENCE-NODATA-OK
Description			Fixed confluence config hang at 'User Management'


</entry>
<entry [Sun 2013:11:24 23:33:06 EST] CONFLUENCE-4 - INSTALLED CONFLUENCE 'OD' CONFLUENCE VERSION (DIDN'T ADD JIRA CONNECTION)>


1. DOWNLOAD 'OD' VERSION 5.3-OD-12

http://www.atlassian.com/software/confluence/downloads/binary/atlassian-confluence-5.3-OD-12.tar.gz


2. ADD CONFLUENCE HOME LOCATION TO FILE confluence-init.properties

/opt/atlassian/confluence/5.3-OD-12/confluence/WEB-INF/classes/confluence-init.properties

ADD LINE 

confluence.home=/var/atlassian/application-data/confluence/5.3-OD-12


3. CREATE CONFLUENCE HOME DIR

mkdir -p /var/atlassian/application-data/confluence/5.3-OD-12


4. CREATE confluence DATABASE AND USER

#### DROP confluence DATABASE IF EXISTS
sudo -u postgres dropdb confluence

#### DROP confuser USER IF EXISTS
sudo -u postgres dropuser confuser

#### CREATE CONFLUENCE USER
sudo -u postgres createuser -S -d -r -P -E confuser

  -S, --no-superuser        role will not be superuser (default)
  -d, --createdb            role can create new databases
  -r, --createrole          role can create new roles
  -P, --pwprompt            assign a password to new role
  -E, --encrypted           encrypt stored password

  
**** IMPORTANT, MUST DO THIS EVEN THOUGH SET PASSWORD IN PREVIOUS STEP ****
#### SET CONFLUENCE USER PASSWORD 
sudo -u postgres psql postgres
\password confuser
    open4annai
\q

	
#### CONFIRM confuser ROLE
sudo -u postgres psql -tAc "SELECT 1 FROM pg_roles WHERE rolname='confuser'"
    1

sudo -u postgres psql -tAc "SELECT * FROM pg_roles WHERE rolname='confuser'"
	confuser|f|t|t|t|f|t|f|-1|********|||33470


#### CREATE CONFLUENCE DATABASE
sudo -u postgres createdb --owner confuser --encoding utf8 confluence


5. CONFIGURE CONFLUENCE

BROWSE TO CONFLUENCE

http://184.169.161.14:8090

GENERATE LICENSE

	AAABBw0ODAoPeNptkMlOwzAQQO/+CkucjRw3LRDJh+BENFIWaMoFcTFhCpYSJ/ISkb8nbSlQxGGkW
	d7ojeai9hqX/YhZiGkQLVdRcIVFvcWMBguUgG2MGpzqNRe93rUedAPPEU5H2Xq57yNh4JAk0gHfb
	5EgICxEzcxfysapEbgzHtDPzrE+ALlqQFvYTgOUsgMuqqJINyKLc1RIpR1oORvTj0GZ6ZeBfRtK3
	72AqXai9daBKftXsJyiyrxJrexRF2stFa6nGegsqsGMYLKE326oIOsyviPx8mFFntbXFNVpyecg+
	YLdUEZD9HXgjOdZcjY50z9aMJaT4MT/f/G9N827tPD3V5/5fnxzMC0CFFNI7fJWrz6HMLuf4unyV
	FOkOWrxAhUAikdgkcXYqZt65hpSF5EZZ0tmrWM=X02dh

	
CONFIGURE DATABASE
	
'Choose Installation Type' --> Production Installation

'Choose a Database Configuration' --> PostgreSQL database --> External Database

'External Database' --> PostgreSQL --> External Database

'Configure Database' --> Direct JDBC Connection


Enter the following information:

Driver Class Name:      org.postgresql.Driver – This is the default value.

Database URL:           jdbc:postgresql://localhost:5432/confluence – This is the default value.

Username:               confuser – This is the user you created in step 1 (above).

Password                – Enter the password that you chose in step 1 (above).

Click the Next button. You might need to wait a few minutes while Confluence sets up its database.


SET EXAMPLE SITE

'Load Content'	--> Example Site


CREATE admin ACCOUNT

'User Management' --> Configure System Administrator Account
NB: DON'T CLICK 'Connect to JIRA'


admin
r4**********


	
</entry>
<entry [Sun 2013:11:24 22:29:45 EST] CONFLUENCE-4: FIXED CONFLUENCE CONFIG PROBLEM - STUCK AT 'USER MANAGEMENT', 'NEXT' BUTTON DOES NOT WORK>

https://answers.atlassian.com/questions/109576/why-does-user-management-setup-not-complete

PROBLEM

CAN'T COMPLETE CONFLUENCE CONFIGURATION. LINKED jirauser TO CONFLUENCE ON CONFLUENCE-4 BUT STUCK AT 'USER MANAGEMENT', 'NEXT' BUTTON DOES NOT WORK. GET THIS MESSAGE:

	Local administrator account created.
	We have created a local administrator with the same username and password as the JIRA system administrator you provided. This will ensure that you can always log into Confluence to update the system configuration.


SOLUTION

INSTALL CONFLUENCE 'OD' CONFLUENCE VERSION (SEE ABOVE)



**** DID NOT WORK ****

1. DELETE CONTENTS OF CONFLUENCE-HOME-FOLDER (FIRST BACKUP HOME-FOLDER)

mkdir -p /var/atlassian/application-data/confluence/5.3.4.old2
mv /var/atlassian/application-data/confluence/5.3.4/* /var/atlassian/application-data/confluence/5.3.4.old2

2. RESTART CONFLUENCE

/opt/atlassian/confluence/5.3.4/bin/shutdown.sh
/opt/atlassian/confluence/5.3.4/bin/startup.sh


3. BROWSE TO CONFLUENCE
user management --> choose the local one, not the JIRA.
	Now you'll have a local account.

4. SET UP JIRA

please follow this documentation:

https://confluence.atlassian.com/display/CONF43/Connecting+to+Crowd+or+JIRA+for+User+Management#ConnectingtoCrowdorJIRAforUserManagement-jira

IN Confluence:

Browse --> Confluence Admin --> User directory --> Add --> Atlassian JIRA.


	
</entry>
<entry [Sun 2013:11:24 18:31:16 EST] CREATED IMAGE OF CONFLUENCE-4 - JIRA+DATA AND CONFLUENCE-NODATA>

AMI ID			ami-44142501
AMI Name		CONFL-4-JIRA-DATA-CONF-NODATA
Description		CONFLUENCE-4 JIRA with data, Confluence without data


</entry>
<entry [Sun 2013:11:24 18:17:10 EST] RESTARTED CONFLUENCE OK THOUGH ERRORS IN LOGS>

root@ip-10-176-190-252:/opt/atlassian/confluence/5.3.4/logs# tail -f catalina.out 
WARNING: [SetPropertiesRule]{Server/Service/Engine/Host/Context} Setting property 'debug' to '0' did not find a matching property.
Nov 25, 2013 1:59:58 AM org.apache.coyote.http11.Http11Protocol init
INFO: Initializing Coyote HTTP/1.1 on http-8090
Nov 25, 2013 1:59:58 AM org.apache.catalina.startup.Catalina load
INFO: Initialization processed in 760 ms
Nov 25, 2013 1:59:58 AM org.apache.catalina.core.StandardService start
INFO: Starting service Tomcat-Standalone
Nov 25, 2013 1:59:58 AM org.apache.catalina.core.StandardEngine start
INFO: Starting Servlet Engine: Apache Tomcat/6.0.35
2013-11-25 02:00:03,787 INFO [main] [com.atlassian.confluence.lifecycle] contextInitialized Starting Confluence 5.3.4 [build 4532 based on commit hash e44e912a19b4356578af38c61df778d5fda2d014]
Exception in thread "ThreadPoolAsyncTaskExecutor::Thread 7" org.springframework.beans.factory.BeanCreationException: Error creating bean with name 'TeamSpaceBlueprintCreateEventListener' defined in URL [bundle://85.0:0/META-INF/spring/atlassian-plugins-components.xml]: Instantiation of bean failed; nested exception is org.springframework.beans.BeanInstantiationException: Could not instantiate bean class [com.atlassian.confluence.plugins.team.SpaceBlueprintEventListener]: Constructor threw exception; nested exception is java.lang.NoClassDefFoundError: com/atlassian/confluence/plugins/createcontent/api/events/SpaceBlueprintCreateEvent
	at org.springframework.beans.factory.support.ConstructorResolver.autowireConstructor(ConstructorResolver.java:254)
	at org.springframework.beans.factory.support.AbstractAutowireCapableBeanFactory.autowireConstructor(AbstractAutowireCapableBeanFactory.java:925)
	at org.springframework.beans.factory.support.AbstractAutowireCapableBeanFactory.createBeanInstance(AbstractAutowireCapableBeanFactory.java:835)
	at org.springframework.beans.factory.support.AbstractAutowireCapableBeanFactory.doCreateBean(AbstractAutowireCapableBeanFactory.java:440)
	at org.springframework.beans.factory.support.AbstractAutowireCapableBeanFactory$1.run(AbstractAutowireCapableBeanFactory.java:409)
	at java.security.AccessController.doPrivileged(Native Method)
	at org.springframework.beans.factory.support.AbstractAutowireCapableBeanFactory.createBean(AbstractAutowireCapableBeanFactory.java:380)
	at org.springframework.beans.factory.support.AbstractBeanFactory$1.getObject(AbstractBeanFactory.java:264)
	at org.springframework.beans.factory.support.DefaultSingletonBeanRegistry.getSingleton(DefaultSingletonBeanRegistry.java:222)
	at org.springframework.beans.factory.support.AbstractBeanFactory.doGetBean(AbstractBeanFactory.java:261)
	at org.springframework.beans.factory.support.AbstractBeanFactory.getBean(AbstractBeanFactory.java:185)
	at org.springframework.beans.factory.support.AbstractBeanFactory.getBean(AbstractBeanFactory.java:164)
	at org.springframework.beans.factory.support.DefaultListableBeanFactory.preInstantiateSingletons(DefaultListableBeanFactory.java:429)
	at org.springframework.context.support.AbstractApplicationContext.finishBeanFactoryInitialization(AbstractApplicationContext.java:728)
	at org.springframework.osgi.context.support.AbstractDelegatedExecutionApplicationContext.access$1600(AbstractDelegatedExecutionApplicationContext.java:69)
	at org.springframework.osgi.context.support.AbstractDelegatedExecutionApplicationContext$4.run(AbstractDelegatedExecutionApplicationContext.java:355)
	at org.springframework.osgi.util.internal.PrivilegedUtils.executeWithCustomTCCL(PrivilegedUtils.java:85)
	at org.springframework.osgi.context.support.AbstractDelegatedExecutionApplicationContext.completeRefresh(AbstractDelegatedExecutionApplicationContext.java:320)
	at org.springframework.osgi.extender.internal.dependencies.startup.DependencyWaiterApplicationContextExecutor$CompleteRefreshTask.run(DependencyWaiterApplicationContextExecutor.java:132)
	at java.util.concurrent.ThreadPoolExecutor.runWorker(ThreadPoolExecutor.java:1145)
	at java.util.concurrent.ThreadPoolExecutor$Worker.run(ThreadPoolExecutor.java:615)
	at java.lang.Thread.run(Thread.java:744)
Caused by: org.springframework.beans.BeanInstantiationException: Could not instantiate bean class [com.atlassian.confluence.plugins.team.SpaceBlueprintEventListener]: Constructor threw exception; nested exception is java.lang.NoClassDefFoundError: com/atlassian/confluence/plugins/createcontent/api/events/SpaceBlueprintCreateEvent
	at org.springframework.beans.BeanUtils.instantiateClass(BeanUtils.java:115)
	at org.springframework.beans.factory.support.SimpleInstantiationStrategy.instantiate(SimpleInstantiationStrategy.java:87)
	at org.springframework.beans.factory.support.ConstructorResolver.autowireConstructor(ConstructorResolver.java:248)
	... 21 more
Caused by: java.lang.NoClassDefFoundError: com/atlassian/confluence/plugins/createcontent/api/events/SpaceBlueprintCreateEvent
	at java.lang.Class.getDeclaredMethods0(Native Method)
	at java.lang.Class.privateGetDeclaredMethods(Class.java:2531)
	at java.lang.Class.privateGetPublicMethods(Class.java:2651)
	at java.lang.Class.getMethods(Class.java:1467)
	at com.atlassian.event.internal.AnnotatedMethodsListenerHandler.getValidMethods(AnnotatedMethodsListenerHandler.java:62)
	at com.atlassian.event.internal.AnnotatedMethodsListenerHandler.getInvokers(AnnotatedMethodsListenerHandler.java:43)
	at com.atlassian.event.internal.EventPublisherImpl.registerListener(EventPublisherImpl.java:126)
	at com.atlassian.event.internal.EventPublisherImpl.register(EventPublisherImpl.java:84)
	at sun.reflect.GeneratedMethodAccessor82.invoke(Unknown Source)
	at sun.reflect.DelegatingMethodAccessorImpl.invoke(DelegatingMethodAccessorImpl.java:43)
	at java.lang.reflect.Method.invoke(Method.java:606)
	at com.atlassian.plugin.osgi.hostcomponents.impl.DefaultComponentRegistrar$ContextClassLoaderSettingInvocationHandler.invoke(DefaultComponentRegistrar.java:129)
	at com.sun.proxy.$Proxy276.register(Unknown Source)
	at sun.reflect.GeneratedMethodAccessor82.invoke(Unknown Source)
	at sun.reflect.DelegatingMethodAccessorImpl.invoke(DelegatingMethodAccessorImpl.java:43)
	at java.lang.reflect.Method.invoke(Method.java:606)
	at com.atlassian.plugin.osgi.bridge.external.HostComponentFactoryBean$DynamicServiceInvocationHandler.invoke(HostComponentFactoryBean.java:154)
	at com.sun.proxy.$Proxy276.register(Unknown Source)
	at com.atlassian.confluence.plugins.team.SpaceBlueprintEventListener.< init>(SpaceBlueprintEventListener.java:32)
	at sun.reflect.NativeConstructorAccessorImpl.newInstance0(Native Method)
	at sun.reflect.NativeConstructorAccessorImpl.newInstance(NativeConstructorAccessorImpl.java:57)
	at sun.reflect.DelegatingConstructorAccessorImpl.newInstance(DelegatingConstructorAccessorImpl.java:45)
	at java.lang.reflect.Constructor.newInstance(Constructor.java:526)
	at org.springframework.beans.BeanUtils.instantiateClass(BeanUtils.java:100)
	... 23 more
Caused by: java.lang.ClassNotFoundException: com.atlassian.confluence.plugins.createcontent.api.events.SpaceBlueprintCreateEvent
	at org.apache.felix.framework.ModuleImpl.findClassOrResourceByDelegation(ModuleImpl.java:772)
	at org.apache.felix.framework.ModuleImpl.access$200(ModuleImpl.java:73)
	at org.apache.felix.framework.ModuleImpl$ModuleClassLoader.loadClass(ModuleImpl.java:1690)
	at java.lang.ClassLoader.loadClass(ClassLoader.java:358)
	... 47 more
Exception in thread "ThreadPoolAsyncTaskExecutor::Thread 18" org.springframework.beans.factory.BeanCreationException: Error creating bean with name 'confluenceEventListener' defined in URL [bundle://166.0:0/META-INF/spring/atlassian-plugins-components.xml]: Instantiation of bean failed; nested exception is org.springframework.beans.BeanInstantiationException: Could not instantiate bean class [com.atlassian.confluence.plugins.jira.ConfluenceEventListener]: Constructor threw exception; nested exception is java.lang.NoClassDefFoundError: com/atlassian/confluence/plugins/createcontent/events/BlueprintPageCreateEvent
	at org.springframework.beans.factory.support.ConstructorResolver.autowireConstructor(ConstructorResolver.java:254)
	at org.springframework.beans.factory.support.AbstractAutowireCapableBeanFactory.autowireConstructor(AbstractAutowireCapableBeanFactory.java:925)
	at org.springframework.beans.factory.support.AbstractAutowireCapableBeanFactory.createBeanInstance(AbstractAutowireCapableBeanFactory.java:835)
	at org.springframework.beans.factory.support.AbstractAutowireCapableBeanFactory.doCreateBean(AbstractAutowireCapableBeanFactory.java:440)
	at org.springframework.beans.factory.support.AbstractAutowireCapableBeanFactory$1.run(AbstractAutowireCapableBeanFactory.java:409)
	at java.security.AccessController.doPrivileged(Native Method)
	at org.springframework.beans.factory.support.AbstractAutowireCapableBeanFactory.createBean(AbstractAutowireCapableBeanFactory.java:380)
	at org.springframework.beans.factory.support.AbstractBeanFactory$1.getObject(AbstractBeanFactory.java:264)
	at org.springframework.beans.factory.support.DefaultSingletonBeanRegistry.getSingleton(DefaultSingletonBeanRegistry.java:222)
	at org.springframework.beans.factory.support.AbstractBeanFactory.doGetBean(AbstractBeanFactory.java:261)
	at org.springframework.beans.factory.support.AbstractBeanFactory.getBean(AbstractBeanFactory.java:185)
	at org.springframework.beans.factory.support.AbstractBeanFactory.getBean(AbstractBeanFactory.java:164)
	at org.springframework.beans.factory.support.DefaultListableBeanFactory.preInstantiateSingletons(DefaultListableBeanFactory.java:429)
	at org.springframework.context.support.AbstractApplicationContext.finishBeanFactoryInitialization(AbstractApplicationContext.java:728)
	at org.springframework.osgi.context.support.AbstractDelegatedExecutionApplicationContext.access$1600(AbstractDelegatedExecutionApplicationContext.java:69)
	at org.springframework.osgi.context.support.AbstractDelegatedExecutionApplicationContext$4.run(AbstractDelegatedExecutionApplicationContext.java:355)
	at org.springframework.osgi.util.internal.PrivilegedUtils.executeWithCustomTCCL(PrivilegedUtils.java:85)
	at org.springframework.osgi.context.support.AbstractDelegatedExecutionApplicationContext.completeRefresh(AbstractDelegatedExecutionApplicationContext.java:320)
	at org.springframework.osgi.extender.internal.dependencies.startup.DependencyWaiterApplicationContextExecutor$CompleteRefreshTask.run(DependencyWaiterApplicationContextExecutor.java:132)
	at java.util.concurrent.ThreadPoolExecutor.runWorker(ThreadPoolExecutor.java:1145)
	at java.util.concurrent.ThreadPoolExecutor$Worker.run(ThreadPoolExecutor.java:615)
	at java.lang.Thread.run(Thread.java:744)
Caused by: org.springframework.beans.BeanInstantiationException: Could not instantiate bean class [com.atlassian.confluence.plugins.jira.ConfluenceEventListener]: Constructor threw exception; nested exception is java.lang.NoClassDefFoundError: com/atlassian/confluence/plugins/createcontent/events/BlueprintPageCreateEvent
	at org.springframework.beans.BeanUtils.instantiateClass(BeanUtils.java:115)
	at org.springframework.beans.factory.support.SimpleInstantiationStrategy.instantiate(SimpleInstantiationStrategy.java:87)
	at org.springframework.beans.factory.support.ConstructorResolver.autowireConstructor(ConstructorResolver.java:248)
	... 21 more
Caused by: java.lang.NoClassDefFoundError: com/atlassian/confluence/plugins/createcontent/events/BlueprintPageCreateEvent
	at java.lang.Class.getDeclaredMethods0(Native Method)
	at java.lang.Class.privateGetDeclaredMethods(Class.java:2531)
	at java.lang.Class.privateGetPublicMethods(Class.java:2651)
	at java.lang.Class.getMethods(Class.java:1467)
	at com.atlassian.event.internal.AnnotatedMethodsListenerHandler.getValidMethods(AnnotatedMethodsListenerHandler.java:62)
	at com.atlassian.event.internal.AnnotatedMethodsListenerHandler.getInvokers(AnnotatedMethodsListenerHandler.java:43)
	at com.atlassian.event.internal.EventPublisherImpl.registerListener(EventPublisherImpl.java:126)
	at com.atlassian.event.internal.EventPublisherImpl.register(EventPublisherImpl.java:84)
	at sun.reflect.GeneratedMethodAccessor82.invoke(Unknown Source)
	at sun.reflect.DelegatingMethodAccessorImpl.invoke(DelegatingMethodAccessorImpl.java:43)
	at java.lang.reflect.Method.invoke(Method.java:606)
	at com.atlassian.plugin.osgi.hostcomponents.impl.DefaultComponentRegistrar$ContextClassLoaderSettingInvocationHandler.invoke(DefaultComponentRegistrar.java:129)
	at com.sun.proxy.$Proxy276.register(Unknown Source)
	at sun.reflect.GeneratedMethodAccessor82.invoke(Unknown Source)
	at sun.reflect.DelegatingMethodAccessorImpl.invoke(DelegatingMethodAccessorImpl.java:43)
	at java.lang.reflect.Method.invoke(Method.java:606)
	at org.springframework.aop.support.AopUtils.invokeJoinpointUsingReflection(AopUtils.java:307)
	at org.springframework.osgi.service.importer.support.internal.aop.ServiceInvoker.doInvoke(ServiceInvoker.java:58)
	at org.springframework.osgi.service.importer.support.internal.aop.ServiceInvoker.invoke(ServiceInvoker.java:62)
	at org.springframework.aop.framework.ReflectiveMethodInvocation.proceed(ReflectiveMethodInvocation.java:171)
	at org.springframework.aop.support.DelegatingIntroductionInterceptor.doProceed(DelegatingIntroductionInterceptor.java:131)
	at org.springframework.aop.support.DelegatingIntroductionInterceptor.invoke(DelegatingIntroductionInterceptor.java:119)
	at org.springframework.aop.framework.ReflectiveMethodInvocation.proceed(ReflectiveMethodInvocation.java:171)
	at org.springframework.osgi.service.util.internal.aop.ServiceTCCLInterceptor.invokeUnprivileged(ServiceTCCLInterceptor.java:56)
	at org.springframework.osgi.service.util.internal.aop.ServiceTCCLInterceptor.invoke(ServiceTCCLInterceptor.java:39)
	at org.springframework.aop.framework.ReflectiveMethodInvocation.proceed(ReflectiveMethodInvocation.java:171)
	at org.springframework.osgi.service.importer.support.LocalBundleContextAdvice.invoke(LocalBundleContextAdvice.java:59)
	at org.springframework.aop.framework.ReflectiveMethodInvocation.proceed(ReflectiveMethodInvocation.java:171)
	at org.springframework.aop.support.DelegatingIntroductionInterceptor.doProceed(DelegatingIntroductionInterceptor.java:131)
	at org.springframework.aop.support.DelegatingIntroductionInterceptor.invoke(DelegatingIntroductionInterceptor.java:119)
	at org.springframework.aop.framework.ReflectiveMethodInvocation.proceed(ReflectiveMethodInvocation.java:171)
	at org.springframework.aop.framework.JdkDynamicAopProxy.invoke(JdkDynamicAopProxy.java:204)
	at com.sun.proxy.$Proxy1089.register(Unknown Source)
	at com.atlassian.confluence.plugins.jira.ConfluenceEventListener.< init>(ConfluenceEventListener.java:21)
	at sun.reflect.NativeConstructorAccessorImpl.newInstance0(Native Method)
	at sun.reflect.NativeConstructorAccessorImpl.newInstance(NativeConstructorAccessorImpl.java:57)
	at sun.reflect.DelegatingConstructorAccessorImpl.newInstance(DelegatingConstructorAccessorImpl.java:45)
	at java.lang.reflect.Constructor.newInstance(Constructor.java:526)
	at org.springframework.beans.BeanUtils.instantiateClass(BeanUtils.java:100)
	... 23 more
Caused by: java.lang.ClassNotFoundException: com.atlassian.confluence.plugins.createcontent.events.BlueprintPageCreateEvent
	at org.apache.felix.framework.ModuleImpl.findClassOrResourceByDelegation(ModuleImpl.java:772)
	at org.apache.felix.framework.ModuleImpl.access$200(ModuleImpl.java:73)
	at org.apache.felix.framework.ModuleImpl$ModuleClassLoader.loadClass(ModuleImpl.java:1690)
	at java.lang.ClassLoader.loadClass(ClassLoader.java:358)
	... 62 more
^[[6~^[[5~Nov 25, 2013 2:03:27 AM org.apache.coyote.http11.Http11Protocol start
INFO: Starting Coyote HTTP/1.1 on http-8090
Nov 25, 2013 2:03:27 AM org.apache.catalina.startup.Catalina start
INFO: Server startup in 209251 ms

	
</entry>
<entry [Sun 2013:11:24 10:00:45 EST] JIRA SERVICE DESK PLUGIN>

https://blogs.atlassian.com/2013/10/introducing-jira-service-desk/

	
</entry>
<entry [Sun 2013:11:24 00:26:08 EST] FIXED ERROR: 'jiralockederror' IN BROWSER>

PROBLEM

FIRST LOAD OF JIRA WEBPAGE AFTER LAUNCHED INSTANCE WITH JIRA + DATA GIVES ERROR IN catalina.out LOG:

	2 plugins are unaccounted for.
	Unaccounted for plugins load as artifacts but fail to resolve into full plugins.
	
	'com.atlassian.support.stp' - 'Support Tools Plugin'  is unaccounted for.

	It was loaded from /var/atlassian/application-data/jira/plugins/.bundled-plugins/stp-3.5.2.jar

	'com.atlassian.jira.plugin.ext.bamboo' - 'JIRA Bamboo Plugin'  is unaccounted for.
	
	It was loaded from /var/atlassian/application-data/jira/plugins/.bundled-plugins/jira-bamboo-plugin-7.0.4.1.jar
	
	************************************************************************************************************************************************\
	********************************************************
	
	2013-11-24 08:22:35,577 localhost-startStop-1 ERROR      [jira.web.dispatcher.JiraWebworkActionDispatcher]
	
	******************************************
	JIRA startup failed, JIRA has been locked.
	******************************************
	
	Nov 24, 2013 8:22:35 AM org.apache.coyote.AbstractProtocol start
	INFO: Starting ProtocolHandler ["http-bio-8080"]
	Nov 24, 2013 8:22:36 AM org.apache.catalina.startup.Catalina start
	INFO: Server startup in 208999 ms
	2013-11-24 08:22:43,634 Modification Check:thread-1 INFO      [atlassian.jira.startup.JiraStartupLogger]
	
	___ Modifications ___________________________
	
		 Modified Files                                : None
		 Removed Files                                 : None



SOLUTION

https://answers.atlassian.com/questions/230596/jira-redirecting-to-http-jiralockederror

1. REMOVE TOMCAT work/* DIRECTORY FILES

mv work/Catalina work/Catalina.old
mv work/Catalina work/Catalina.old

2. REMOVE JIRA .bundled-plugins AND .osgi-plugins FOLDERS IN plugins DIR

mv plugins/.bundled-plugins plugins/.bundled-plugins.old  
mv plugins/.osgi-plugins plugins/.osgi-plugins.old

3. RESTART JIRA

/opt/atlassian/jira/6.1.2/bin/startup.sh

	OK
	
	
4. BROWSE TO JIRA AND LOGIN AS sysadmin

http://184.169.161.14:8080

	OK

NB: work/Catalina DIRECTORY HAS BEEN REPOPULATED WITH LESS FILES, E.G.:

ll work/Catalina/localhost/_/org/apache/jsp/decorators/
	total 296
	-rw-r--r-- 1 root root  47796 2013-10-24 01:14 admin_jsp.class
	-rw-r--r-- 1 root root 133375 2013-10-24 01:14 admin_jsp.java
	-rw-r--r-- 1 root root  30852 2013-10-24 01:14 general_jsp.class
	-rw-r--r-- 1 root root  75074 2013-10-24 01:14 general_jsp.java

ll work/Catalina.old/localhost/_/org/apache/jsp/decorators/
	total 612
	-rw-r--r-- 1 root root  47796 2013-10-24 01:14 admin_jsp.class
	-rw-r--r-- 1 root root 133375 2013-10-24 01:14 admin_jsp.java
	-rw-r--r-- 1 root root   8013 2013-10-24 01:14 dialog_jsp.class
	-rw-r--r-- 1 root root  12740 2013-10-24 01:14 dialog_jsp.java
	-rw-r--r-- 1 root root  30852 2013-10-24 01:14 general_jsp.class
	-rw-r--r-- 1 root root  75074 2013-10-24 01:14 general_jsp.java
	-rw-r--r-- 1 root root  33514 2013-10-24 01:14 login_jsp.class
	-rw-r--r-- 1 root root  85820 2013-10-24 01:14 login_jsp.java
	-rw-r--r-- 1 root root  33654 2013-10-24 01:14 message_jsp.class
	-rw-r--r-- 1 root root  86289 2013-10-24 01:14 message_jsp.java
	drwxr-xr-x 2 root root   4096 2013-11-22 13:09 panels/
	-rw-r--r-- 1 root root  15620 2013-10-24 01:14 setup_jsp.class
	-rw-r--r-- 1 root root  27228 2013-10-24 01:14 setup_jsp.java


5. RESTART JIRA AGAIN

tail logs/catalina.out

	2013-11-25 01:51:11,047 localhost-startStop-1 INFO      [atlassian.plugin.util.WaitUntil] Plugins that have yet to be enabled: [com.pyxis.greenhopper.jira], 14 seconds remaining
	2013-11-25 01:51:11,112 ThreadPoolAsyncTaskExecutor::Thread 1 WARN      [greenhopper.service.issue.IssueFieldManagerImpl] The GreenHopper IssueFieldManagerImpl service has been wired and is now ready for use


6. BROWSE TO JIRA AND LOGIN AS sysadmin

http://184.169.161.14:8080

	OK

	

ALTERNATELY:


I'm bumping also into this one yesterday. I installed JIRA service desk, and since then no joy anymore. Removing caches, indexes, bundled_plugins, osgi_plugins and so on didn't help.

So I cleared the database, brought up JIRA, imported an xml backup from the day before yesterday, and JIRA is humming happy again.

Not sure it is related to service desk but looks like it.

Francis


	
</entry>
<entry [Sat 2013:11:23 17:04:43 EST] DID NOT FIX CONFLUENCE STARTUP ERROR: 'SEVERE: Error filterStart'>

PROBLEM

ON START CONFLUENCE, GET THIS ERROR IN logs/catalina.out


SOLUTION

TRIED:

DROP AND RECREATE confluence DATABASE AND confuser

REMOVE FILE AND RESTART

confluence/WEB-INF/classes/com/atlassian/confluence/servlet/ConfluenceVelocityServlet.class

	
</entry>
<entry [Sat 2013:11:23 15:59:00 EST] FIXED CONFLUENCE DATABASE CONFIG ERROR: 'java.lang.IllegalStateException: The CacheManager has been shut down'>


PROBLEM

IN BROWSER, AFTER SETTING confuser AND PASSWORD FOR JDBC, GET ERROR:

java.lang.IllegalStateException: The CacheManager has been shut down. It can no longer be used.

SOLUTION

1. DROP AND RECREATE DATABASE
2. RERUN SETUP WIZARD

	
</entry>
<entry [Sat 2013:11:23 09:25:01 EST] CONFLUENCE 'UNATTENDED' INSTALL>

USE response.varfile TO RUN CONFLUENCE BIN FOR AUTOMATED INSTALL (NO NEED TO USE BROWSER TO COMPLETE CONFIGURATION)

THIS FILE IS CREATED WHEN YOU USE THE BROWSER WIZARD TO CONFIGURE CONFLUENCE

response.varfile FILE

/home/ubuntu/software/atlassian/atlassian-jira-6.1.2-x64.bin.12816.dir/.install4j/response.varfile

	#install4j response file for JIRA 6.1.2
	#Fri Nov 22 03:11:08 UTC 2013
	app.install.service$Boolean=true
	app.jiraHome=/var/atlassian/application-data/jira
	existingInstallationDir=/home/ubuntu/software/atlassian/atlassian-jira-6.1.3-x64.bin.9750.dir
	sys.confirmedUpdateInstallationString=false
	sys.languageId=en
	sys.installationDir=

	
NOTES
-----

https://confluence.atlassian.com/display/DOC/Installing+Confluence+on+Linux

Performing an Unattended Installation

If you have previously installed Confluence using the console wizard (above), you can use a configuration file from this Confluence installation (called response.varfile) to re-install Confluence in 'unattended mode' without any user input required.

Installing Confluence in unattended mode saves you time if your previous Confluence installation was used for testing purposes and you need to install Confluence on multiple server machines based on the same configuration.

(warning) Please Note:

The response.varfile file contains the options specified during the installation wizard steps of your previous Confluence installation. Hence, do not uninstall your previous Confluence installation just yet.
If you intend to modify the response.varfile file, please ensure all directory paths specified are absolute, for example, sys.installationDir=/opt/atlassian/confluence
Unattended installations will fail if any relative directory paths have been specified in this file.
Download and Run the Confluence 'Linux Installer' in Unattended Mode
Download the Confluence 'Linux Installer' (.bin) file from the Confluence Download Center to a suitable location.
Open a Linux console.
Copy (cp) the file .install4j/response.varfile located in your previous Confluence installation directory, to the same location as the downloaded 'Linux Installer' file.
(info) You can uninstall your previous Confluence installation after this step. Save your response.varfile if you need to install Confluence on multiple machines.
Change directory (cd) to the location of the 'Linux Installer' file and execute the following command:

atlassian-confluence-X.Y.bin -q -varfile response.varfile
Where:

X.Y — refers to the version of Confluence you are about to install.
-q — instructs the installer to operate in unattended mode (i.e. 'quietly').
-varfile response.varfile — specifies the configuration file containing the configuration options used by the installer. The location and name of the configuration file should be specified after the -varfileoption.

Confluence will start automatically when the silent installation finishes. Continue from the step above, Starting Confluence.

	
</entry>
<entry [Fri 2013:11:22 12:59:18 EST] CONFLUENCE-3 (CONT.) - INSTALLED CONFLUENCE 5.3.4>

https://confluence.atlassian.com/display/ATLAS/Dragons+Stage+3+-+Install+Confluence

http://confluence.atlassian.com/display/DOC/Installing+Confluence+Standalone+on+Unix+or+Linux

CONFLUENCE MIGRATION

https://confluence.atlassian.com/display/DOC/Migrating+from+Confluence+OnDemand+to+a+Confluence+Installed+Site

JIRA MIGRATION

https://confluence.atlassian.com/display/JIRA/Migrating+from+JIRA+OnDemand+to+a+JIRA+Installed+Site

**** ******************************************* ****
**** OPEN TCP PORTS 8090 AND 8000 IN AWS CONSOLE ****
**** ******************************************* ****


1. CREATE confluence DATABASE AND USER
2. INSTALL CONFLUENCE 5.3.4
3. CONFIGURE CONFLUENCE IN BROWSER


1. CREATE confluence DATABASE AND USER

#### DROP confluence DATABASE IF EXISTS
sudo -u postgres dropdb confluence

#### DROP confuser USER IF EXISTS
sudo -u postgres dropuser confuser

#### CREATE CONFLUENCE USER
sudo -u postgres createuser -S -d -r -P -E confuser

  -S, --no-superuser        role will not be superuser (default)
  -d, --createdb            role can create new databases
  -r, --createrole          role can create new roles
  -P, --pwprompt            assign a password to new role
  -E, --encrypted           encrypt stored password

  
**** IMPORTANT, MUST DO THIS EVEN THOUGH SET PASSWORD IN PREVIOUS STEP ****
#### SET CONFLUENCE USER PASSWORD 
sudo -u postgres psql postgres
\password confuser
    open4annai
\q

	
#### CONFIRM confuser ROLE
sudo -u postgres psql -tAc "SELECT 1 FROM pg_roles WHERE rolname='confuser'"
    1

sudo -u postgres psql -tAc "SELECT * FROM pg_roles WHERE rolname='confuser'"
	confuser|f|t|t|t|f|t|f|-1|********|||32217


#### CREATE CONFLUENCE DATABASE
sudo -u postgres createdb --owner confuser --encoding utf8 confluence



2. INSTALL CONFLUENCE 5.3.4

INSTALLATION SETTINGS

Installation Directory: /opt/atlassian/confluence/5.3.4 
Home Directory: /var/atlassian/application-data/confluence 
HTTP Port: 8090 
RMI Port: 8000 


DOWNLOAD AND INSTALL

cd ~/software/atlassian
wget http://www.atlassian.com/software/confluence/downloads/binary/atlassian-confluence-5.3.4.tar.gz
tar xvfz atlassian-confluence-5.3.4.tar.gz

mkdir -p /opt/atlassian/confluence
mv atlassian-confluence-5.3.4 /opt/atlassian/confluence/5.3.4


3. CHANGE PORT IF CLASH WITH JIRA ON 8080

JIRA IS ALREADY INSTALLED AND USES PORT 8080

CHECKED IF NEED TO EDIT CONFLUENCE server.xml TO CHANGE THE DEFAULT PORT BUT WAS ALREADY SET AT 8000 AND 8090 SO NO CONFLICT WITH JIRA

/opt/atlassian/confluence/5.3.4/conf/server.xml

<!--

<Server port="8000" shutdown="SHUTDOWN" debug="0">
    <Service name="Tomcat-Standalone">
        <Connector className="org.apache.coyote.tomcat4.CoyoteConnector" port="8090" minProcessors="5"
                   maxProcessors="75"
                   enableLookups="false" redirectPort="8443" acceptCount="10" debug="0" connectionTimeout="20000"
                   useURIValidationHack="false" URIEncoding="UTF-8"/>

-->


4. SPECIFY CONFLUENCE HOME DIRECTORY IN FILE confluence/WEB-INF/classes/confluence-init.properties

MAKE CONFLUENCE HOME (DATA) DIR

mkdir -p /var/atlassian/application-data/confluence/5.3.4

EDIT FILE

/opt/atlassian/confluence/5.3.4/confluence/WEB-INF/classes/confluence-init.properties

ADD LINE

confluence.home=/var/atlassian/application-data/confluence/5.3.4

.... TO AVOID THIS ERROR WHEN BROWSE TO CONFLUENCE WEB PAGE

	Confluence Home directory specified: 
	There was an error creating the Confluence Home directory. The most common cause is you haven't specified it. To fix this, simply specify a directory in the file /confluence/WEB-INF/classes/confluence-init.properties.


RESTART CONFLUENCE

/opt/atlassian/confluence/5.3.4/bin/shutdown.sh
/opt/atlassian/confluence/5.3.4/bin/startup.sh

	To run Confluence in the foreground, start the server with start-confluence.sh -fg
	executing as current user
	If you encounter issues starting up Confluence Standalone, please see the Installation guide at http://confluence.atlassian.com/display/DOC/Confluence+Installation+Guide

	Server startup logs are located in /opt/atlassian/confluence/5.3.4/logs/catalina.out
	Using CATALINA_BASE:   /opt/atlassian/confluence/5.3.4
	Using CATALINA_HOME:   /opt/atlassian/confluence/5.3.4
	Using CATALINA_TMPDIR: /opt/atlassian/confluence/5.3.4/temp
	Using JRE_HOME:        /usr/share/jdk1.7.0_45
	Using CLASSPATH:       /opt/atlassian/confluence/5.3.4/bin/bootstrap.jar
	Using CATALINA_PID:    /opt/atlassian/confluence/5.3.4/work/catalina.pid


5. SPECIFY 'Context path' IN conf/server.xml FILE

**** ********************************************** *****
**** DO NOT DO THIS - CONFLUENCE PAGE WILL BE EMPTY *****
**** ********************************************** *****

/opt/atlassian/confluence/5.3.4/conf/server.xml 

CHANGE path ATTRIBUTE IN Context ELEMENT FROM "" TO "/confluence":

<!--
<Context path="/confluence" docBase="../confluence" debug="0" reloadable="false" useHttpOnly="true">\
-->


RESTART CONFLUENCE

/opt/atlassian/confluence/5.3.4/bin/stop-confluence.sh 
/opt/atlassian/confluence/5.3.4/bin/start-confluence.sh 

	OK

6. CONFIGURE CONFLUENCE IN BROWSER

http://184.169.161.14:8090

GENERATE LICENSE

	AAABBw0ODAoPeNptkMlOwzAQQO/+CkucjRw3LRDJh+BENFIWaMoFcTFhCpYSJ/ISkb8nbSlQxGGkW
	d7ojeai9hqX/YhZiGkQLVdRcIVFvcWMBguUgG2MGpzqNRe93rUedAPPEU5H2Xq57yNh4JAk0gHfb
	5EgICxEzcxfysapEbgzHtDPzrE+ALlqQFvYTgOUsgMuqqJINyKLc1RIpR1oORvTj0GZ6ZeBfRtK3
	72AqXai9daBKftXsJyiyrxJrexRF2stFa6nGegsqsGMYLKE326oIOsyviPx8mFFntbXFNVpyecg+
	YLdUEZD9HXgjOdZcjY50z9aMJaT4MT/f/G9N827tPD3V5/5fnxzMC0CFFNI7fJWrz6HMLuf4unyV
	FOkOWrxAhUAikdgkcXYqZt65hpSF5EZZ0tmrWM=X02dh

'Choose Installation Type' --> Production Installation

'Choose a Database Configuration' --> PostgreSQL database --> External Database

'External Database' --> PostgreSQL --> External Database

'Configure Database' --> Direct JDBC Connection


Enter the following information:

Driver Class Name:      org.postgresql.Driver – This is the default value.

Database URL:           jdbc:postgresql://localhost:5432/confluence – This is the default value.

Username:               confuser – This is the user you created in step 1 (above).

Password                – Enter the password that you chose in step 1 (above).

Click the Next button. You might need to wait a few minutes while Confluence sets up its database.



'Load Content'	--> Example Site


'User Management Setup' --> Connect to JIRA.

JIRA Server Location – http://184.169.161.14:8080
JIRA Administrator Login Username: jirauser
Password – open4annai

Leave the other fields (the 'advanced options') at their default values:

Confluence Base 	URL	http://184.169.161.14:8090
This is a required field JIRA will use this URL to access your Confluence server. If Confluence is behind a proxy, you may need to change the URL given here.

User Groups 		jira-users
Users in these groups will have access to Confluence. Comma-separated.


Admin Groups		jira-administrators


'Load users and groups from JIRA' screen - informing you that Confluence has created an administrative account for Charlie, to match his JIRA account. Click Next.


The 'Confluence Setup Successful' screen will appear. Click Start using Confluence.
If the 'What's new in Confluence' popup window appears, select Don't show again and click Close.
The home page of the Confluence 'Demonstration Space' will appear.


Finally, you need to change your Confluence base URL to the full web address at which Confluence is running, and enable the remote API:

Open the Browse menu at the top of the screen and select Confluence Admin. Confirm your password when prompted. This is Charlie's password in Confluence, and is the same as his password in JIRA.
The 'Administration Console' screen will appear. Click General Configuration under 'Configuration' in the left-hand panel.


The 'General Configuration' screen will appear. Click any of the Edit links.
In the Server Base Url field, enter the full website address at which Confluence is running. This address should not be 'localhost'. For example, if your computer name is 'coopers' then the server base URL should be: http://coopers:8090/confluence. Alternatively, specify a website address such as http://www.foobar.com:8090/confluence.
Click the check box next to Remote API (XML-RPC & SOAP), to enable the remote API.
Scroll down to the end of the page and click Save.

    OK
    
    
4. CREATE A SPACE

Click Dashboard at the top left of the Confluence screen.
Click Add Space on the top right-hand side of the screen.
The 'Create Space' screen will appear. Configure your space settings:
Enter a space name: Dragons
Enter a space key: DRA
Leave the rest of the settings at their default the default settings as they are.
Click Create.
The 'Home' page of your new 'Dragons' space will appear, with some default content. Now you can edit the home page as you like. For this exercise, you will add a Charlie badge:
Right-click on the image of the Charlie badge at the bottom of this documentation page and save it to your desktop. The file name is 'dragon_badge03.png'.
Click Edit at the top right of your new Dragons home page in your own Confluence site.
The wiki editor will open. If prompted, allow Gears access to your site. This will allow you to drag and drop images and other attachments onto your wiki page.
Select and delete all the text in the editor pane. You will start with an empty page.
Make sure your cursor is at the top of the editor pane.
Choose Insert > Image in the editor toolbar.
The 'Insert Image' popup window will appear. Browse to your desktop and upload the Charlie badge image that you saved earlier.
A preview of the image will appear in the 'Insert Image' window. Click Insert.
The image will appear in the editor pane of your home page. Click Save to save your updated wiki page.

    OK
    

5. ADD SOME JIRA ISSUES TO CONFLUENCE

Now you can put some interesting JIRA content into your page. What's more, you can insert an issue into JIRA directly from your Confluence page and then display the issue on the page.

Edit the Confluence page again.
Place your cursor immediately after your Charlie badge image and press Enter to start a new line.
Enter the following text onto the page: My JIRA issues
Select the text that you have just entered and format it as a heading level 2. (Click the formatting dropdown menu on the left-hand edge of the editor tool bar. By default it formats your text as 'Paragraph'. Select Heading 2.)
Deselect the text and then press Enter to start a new line.
Follow the steps below to add a JIRA macro to your page. The macro will show a dynamic list of issues drawn from the 'Dragons' project on your JIRA site.
Choose Insert > JIRA Issue in the editor toolbar.
The 'Insert JIRA Issue' popup window will appear. Click Search in the left-hand panel.
Enter the following JQL (JIRA Query Language) phrase into the search box: project = DRA
Click the Search button.
A list of issues will appear, matching your search query. Select the option to Insert all query results as a table.
Click Insert.
The JIRA macro will appear on your page.

Click Preview at the bottom of the editor pane, to see a preview of the page. You will see a list of the JIRA issues in your 'Dragons' project.
Click Edit to return to the editor.
Enter the following text onto the page, and format it as a heading level 2: Reporting a new issue
Hint: Press Ctrl+2 or Cmd+2 as a keyboard shortcut to format a heading level 2. Click the question mark on the right of the editor toolbar to see all the keyboard shortcuts. 
Start a new line.
Follow the steps below to add a new issue into JIRA and display the issue on your Confluence page:
Choose Insert > JIRA Issue in the editor toolbar.
The 'Insert JIRA Issue' popup window will appear. Click Create New Issue in the left-hand panel.
Enter the following information:
Project: Dragons
Issue Type: Bug
Summary: The purple dragon melted my chocolate
Version/s: 2.0
Description: The dragon tried to eat my chocolate and flamed it by mistake
Click Insert.
You now have a new issue, DRA-2, in the Dragons project in JIRA. In addition, a new JIRA macro will appear on your Confluence page, showing only the new issue that you have created in JIRA.

Save the page.
Note: The new issue will appear immediately under the heading 'Reporting a new issue'. To see the new issue appear in the table under 'My JIRA issues', you may need to click the refresh icon  at the bottom of the table. This is because the issues shown in the table are cached.
JIRA knows about the link between the new JIRA issue and the Confluence page! Go to your JIRA URL in your browser (for example, http://www.foobar.com:8080/) and find issue DRA-2. The Issue Links section includes a link to the wiki page.

    OK
    

6. ENABLE CONFLUENCE GADGETS IN JIRA

In this step you will make your Confluence gadgets available in JIRA, so that JIRA users will be able to add any Confluence gadget to their dashboards.

Go to your JIRA dashboard.
Click Add Gadget.
The 'Gadget Directory' popup window will appear. Click Gadget Subscriptions.
The 'Gadget Subscriptions' popup window will appear. Click Add Subscription.
The 'Add Subscriptions' popup window will appear. Copy the base URL for your Confluence site (e.g. http://coopers:8090/confluence or http://www.foobar.com:8090/confluence) and paste it into the text box on the screen.
Click Add Subscription.
Click Finished.

    OK
    

7. ADD A CONFLUENCE GADGET TO JIRA


Now you will add the 'Confluence QuickNav' gadget to your JIRA dashboard.

Click Dashboards at top left of your JIRA screen.
Your 'Dragon Development Dashboard' will appear. Click Add Gadget.
The 'Gadget Directory' will appear, showing a list of the available gadgets for your JIRA dashboard. Click Confluence in the left-hand panel.
The directory will limit the list to gadgets published by Confluence. Find the Confluence QuickNav gadget and click Add it Now under the gadget. The gadget will be highlighted for a short time and the button's wording will change to 'Adding', while JIRA adds the gadget to the dashboard.
Click Finished to go back to your dashboard.
Test the new gadget – type 'dragons' in the Search textbox inside the Confluence QuickNav gadget.
A list of page titles will appear in a dropdown list. Open one of them in a new tab, to see the Confluence page.
Re-arrange your JIRA dashboard:
Drag the Projects gadget to the right and drop it under the 'Assigned to Me' gadget.
Choose a different colour for your Confluence QuickNav gadget:
Move your cursor pointer over the gadget and click the downward-pointing arrow at top right of the gadget frame.
Select the red square in the row of colours.    




	

</entry>
<entry [Fri 2013:11:22 13:15:19 EST] FIXED: MISSING ATTACHMENTS AFTER RESTORE JIRA>

PROBLEM

WHEN CLICK ON AN ATTACHMENT IN JIRA, GET THIS MESSAGE

	Oh, it seems that we've lost a page.
	Maybe you should raise an issue?
	
	Please look for misspellings in the address:
	http://localhost:8080/secure/attachment


DIAGNOSIS

NO FILES IN JIRA ATTACHMENTS FOLDER

/var/atlassian/application-data/jira/data/attachments

	*** EMPTY ***

BUT FILES PRESENT IN BACKUP FILE:

ll /tmp/temp/data/attachments
	drwxr-xr-x  13 root root 4096 2013-11-22 21:21 ./
	drwxr-xr-x   4 root root 4096 2013-11-22 21:21 ../
	drwxr-xr-x  29 root root 4096 2013-11-22 21:21 ABCFARM/
	drwxr-xr-x  31 root root 4096 2013-11-22 21:21 CGHUB/
	drwxr-xr-x  21 root root 4096 2013-11-22 21:21 CGHUBDEV/
	drwxr-xr-x   6 root root 4096 2013-11-22 21:21 CLEAR/
	drwxr-xr-x 105 root root 4096 2013-11-22 21:21 CTCA/
	drwxr-xr-x  35 root root 4096 2013-11-22 21:21 FRED/
	drwxr-xr-x  20 root root 4096 2013-11-22 21:21 GTXFER/
	drwxr-xr-x  92 root root 4096 2013-11-22 21:21 REQUEST/
	drwxr-xr-x   7 root root 4096 2013-11-22 21:21 SYSTEST/
	drwxr-xr-x  34 root root 4096 2013-11-22 21:21 TCGA/
	drwxr-xr-x   3 root root 4096 2013-11-22 21:21 TRAIN/

	
SOLUTION

1. MANUALLY COPY ATTACHMENTS FROM BACKUP FILE

cp -r /tmp/temp/data/attachments/* \
/var/atlassian/application-data/jira/data/attachments


2. RETRY DOWNLOAD (DON'T NEED TO RESTART JIRA)

CLICK ON ATTACHMENT

	OK - DOWNLOAD WINDOW OPENS







</entry>
<entry [Fri 2013:11:22 12:53:37 EST] CREATED IMAGE OF CONFLUENCE-3 WITH JIRA + DATA>

IMAGE ID        ami-b83d0cfd
INSTANCE ID     i-6553c23f
INSTANCE NAME   CONFLUENCE-3 jira with data loaded 131122
IMAGE NAME      CONFL-3 jira + data
DESCRIPTION     Only JIRA (+JIRA-Agile) and backup data
	
</entry>
<entry [Fri 2013:11:22 06:05:00 EST] CONFLUENCE-3 (CONT.) - LOADED JIRA BACKUP DATA>

https://confluence.atlassian.com/display/JIRA/Migrating+from+JIRA+OnDemand+to+a+JIRA+Installed+Site#MigratingfromJIRAOnDemandtoaJIRAInstalledSite-4.Changethesystemadministratorpassword

1. UPLOAD BACKUP FILE TO CONFLUENCE-3

cd ~/software/atlassian
scp -r JIRA-backup-20131122.zip ubuntu@$host:

MOVE TO import DIR

ssh ubuntu@$host
mv ~/JIRA-backup-20131122.zip /var/atlassian/application-data/jira/import


2. RESTORE FROM BACKUP ON CONFLUENCE-3 JIRA PAGE

BROWSE TO JIRA RESTORE PAGE

184.169.161.14:8080

Enter a filename to restore data from. Files will be loaded from: /var/atlassian/application-data/jira/import

JIRA-backup-20131122.zip


ENTER LICENCE KEY

AAABDw0ODAoPeNptkFtrhDAQhd/zKwJ9TtFosRXyYDUFW2+oKy30JbXTNmXNSqJS/311XeiFfRgY5
pz55jAXd1ri7DBhSrHl+Zbl2w4OqxpTy3ZQBKbVsh/kQbH7uAyefcwnsR/FOkGhhmMTiQHY6ie2T
aiDPqUWl4lsQRngr/K4zbOal0UZVxz9ENigR/hjr+ceMtEBC/M05WUYB8mmi3aQE2wL+83bgDYrh
KJUSDWAEqoF/tVLPf9KRNdEuX4XSprtaKCUkLiazQCd2ejZ2L2Azt92ZmEyYqMK9AQ6jtite+OQR
6/xSPHQOGRnB0+o4hlbiiQOvb5yXQ+dwi/2JI7OKedTFaNuP4SB///7BmSTgEwwLAIUH34dpvmMY
lXTpvub4Dk+7R8bQ8gCFD1m9dPM6So+TXDW9cCsWHM0e8b8X02dp



3. RESET sysadmin LOGIN

USER: sysadmin
PASS: sysadmin

CHANGED TO:

r4*********


</entry>
<entry [Fri 2013:11:22 05:42:50 EST] CONFLUENCE SALESFORCE PLUGIN>

INSTALL CONFLUENCE-SALESFORCE CONNECTOR
https://marketplace.atlassian.com/plugins/net.customware.confluence.plugin.salesforce.confluence-salesforce-plugin

	
</entry>
<entry [Fri 2013:11:22 05:37:54 EST] CREATED IMAGE OF CONFLUENCE-3 WITH ONLY JIRA INSTALLED (PRE-LOAD JIRA BACKUP)>

IMAGE ID        ami-30380975
INSTANCE ID     i-6553c23f
INSTANCE NAME   CONFLUENCE-3 jira, no data
IMAGE NAME      CONFLUENCE-3 JIRA only
DESCRIPTION     Only JIRA (+JIRA-Agile), no JIRA backup data
	
</entry>
<entry [Thu 2013:11:21 21:44:29 EST] CONFLUENCE-3 (CONT.) - CONFIGURE JIRA 6.1.2>

https://confluence.atlassian.com/display/ATLAS/Dragons+Stage+1+-+Install+JIRA#DragonsStage1-InstallJIRA-Step4.InstallJIRA


**** NB: OPEN TCP PORT 8080 IN AWS CONSOLE ****

0. DOWNLOAD JIRA BACKUP

USE LYNX
https://annaisystems.atlassian.net/webdav/backupmanager/JIRA-backup-20131122.zip


1. BROWSE TO JIRA

184.169.161.14:8080

    
Application Title   Annai Systems
Mode                Public
Base URL            http://ec2-204-236-179-50.us-west-1.compute.amazonaws.com:8080


2. CONFIGURE DATABASE

Choose your server language.
Enter the following information to configure the database connection:
Database Connection: External
Database Type: PostgreSQL
Hostname – localhost
Port – Enter the default port that you set up for PostgreSQL: 5432
Database – This is the name of the database that you created in step 3 above: jira
Username – This is the user you created in step 3 above: jirauser
Password – Enter the password you chose in step 3 above.
Schema – Leave this at the default setting: public
Click the Test Connection button to test the connection settings.


3. USER DETAILS AND LICENCE

Application Title: 		Annai Systems
Mode – Accept the default mode: Public
Base URL – 184.169.161.14:8080

Enter the full website address at which JIRA is running, not just 'localhost'. For example, if your computer name is 'coopers' then the base URL should be: http://coopers:8080. Or specify a website address, such as http://www.foobar.com:8080.

License Key – If you do not already have a JIRA license, follow the prompts on the setup wizard screen to get an evaluation license key.


4. SUPERUSER/ADMIN ACCOUNT 
Specify the administrator account. This will be your JIRA super user:

Username: admin

Password: open4annai

Full name: Stuart Young

Email:	stuarty@annaisystems.com


5. ENABLE ATLASSIAN ANALYTICS

SEE DATA COLLECTION POLICY
https://confluence.atlassian.com/display/JIRA061/Data+Collection+Policy

6. DISABLE NOTIFICATIONS

Set Up Email Notifications --> LATER


	You are logged in to JIRA with the username 'admin'.


7. SET JIRA GENERAL CONFIGURATION

(TOP RIGHT) ADMINISTRATION COG --> System

Accept remote API calls		YES

Allow unassigned issues 	YES


8. ADD USER GROUPS
Add the groups that you will need later for Confluence and Bamboo

(TOP RIGHT) ADMINISTRATION COG --> (TOP LEFT) User Management --> (LEFT) Groups

Add Group -->
	
confluence-users
confluence-administrators
bamboo-admin

MAKE SUPERUSER/ADMIN AN administrator in Confluence and Bamboo by adding him to the relevant groups:

(TOP RIGHT) Bulk Edit Group Members --> Left-hand box - select three groups:

bamboo-admin
confluence-administrators
confluence-users

Right-hand box under Add members to selected group(s), enter the username:

admin

Click 'ADD SELECTED USERS'.

SUPERUSER/ADMIN name will appear in the middle box as a group member of the selected groups.


9. CREATE A JIRA PROJECT (INSTALL JIRA AGILE)

(TOP LEFT) Projects --> Create Project --> INSTALL JIRA AGILE 



In this step you will create some data in JIRA, including a project and an issue, for use in the subsequent stages of this integration procedure. Then you will create your own JIRA dashboard with a couple of gadgets. For this procedure, you need to be logged in as JIRA Admin.

CREATE PROJECT

Click Projects > Projects in the top menu.

PROJECT: TEST
KEY: TEST

Hint: Try JIRA's quick search instead of the menus. Press g g on your keyboard then start typing 'projects' into the Administration Search box. If you like, you can use the quick search from this point onwards.


ADD VERSION

(TOP LEFT) Versions --> Create Version

Name: 1.0
Description: Version 1.0

Name: 2.0
Description: Version 2.0


CREATE AN ISSUE FOR THE PROJECT

(TOP LEFT) Issues --> Create Issue

Project: TEST
Issue Type: Bug
Summary: test issue
Affects Version/s: 1.0
Assignee – Click Assign to Me (SUPERUSER/ADMIN)
Original Estimate: 1d


CREATE A DASHBOARD FOR THE PROJECT
Create a new dashboard for all your TEST PROJECT-related tasks, issues and general fire fighting

(TOP LEFT) Dashboards --> Manage Dashboards --> Create New Dashboard

Name: Test dashboard
Description: Description of test dashboard

Leave the other fields at their default values


ADD A GADGET TO THE DASHBOARD

(TOP LEFT) Dashboards --> Manage Dashboards

Click on the dashboard name to edit it. You can now add gadgets.

	The 'Gadget Directory' will appear, showing a list of the available gadgets
	Enter 'projects' into the search box at top right of the gadget directory.
	The list of gadgets will change, to show only the gadgets that match your search term
	Find the 'Projects' gadget and click Add it Now.
	Find and add the 'Assigned To Me' gadget in the same way.

	
	

	Drag the 'Assigned to Me' gadget to the top right of your dashboard

	Configure the 'Projects' gadget to point to your 'TEST' project: 
		Select 'TEST' from the Projects list --> SAVE
		Leave the default values as configured for View and Number of Columns.
		Click the dropdown arrow next to Refresh Interval and select Every 15 Minutes.
		Click Save.

	Configure the 'Assigned to Me' gadget:
		Leave the default values for Number of Results and Fields to display.
		Refresh Interval --> Every 15 Minutes.
		Click Save.


	
</entry>
<entry [Thu 2013:11:21 21:23:46 EST] OPENID PLUGIN FOR JIRA>


https://marketplace.atlassian.com/plugins/com.pawelniewiadomski.jira.jira-openid-authentication-plugin


	
</entry>
<entry [Thu 2013:11:21 00:37:59 EST] CONFLUENCE-3 (CONTINUED) - INSTALL JIRA 6.1.2 FROM SOURCE>	

ASSOCIATED ELASTIC IP

export instanceid=i-6553c23f
export host=184.169.161.14

ec2din i-6553c23f

RESERVATION	r-19c97143	416621443487	default
INSTANCE	i-6553c23f	ami-2c8db869	ec2-54-215-70-142.us-west-1.compute.amazonaws.com	ip-10-168-99-234.us-west-1.compute.internal	running	confluence	0	m1.large	2013-11-21T08:36:11+0000	us-west-1a	aki-8d396bc8			monitoring-disabled	54.215.70.142	10.168.99.234			ebs			paravirtual	xen		sg-c7b4b982	default	false	
BLOCKDEVICE	/dev/sda1	vol-d2a39ffb	2013-11-08T14:28:20.000Z	false		
TAG	instance	i-6553c23f	Name	CONFLUENCE-3
TAG	instance	i-6553c23f	description	Resized CONFLUENCE-1 to 30GB (pre-reinstall JIRA, etc.)
TAG	instance	i-6553c23f	created	131108
TAG	instance	i-6553c23f	name	CONFLUENCE-3
TAG	instance	i-6553c23f	zone	us-west-1
TAG	instance	i-6553c23f	ami	eridanus-0.8.0-alpha.2


1. INSTALL JAVA jdk-7u40-linux-x64.tar.gz

MANUAL DOWNLOAD FROM

http://www.oracle.com/technetwork/java/javase/downloads/jdk7-downloads-1880260.html

mkdir -p ~/software/java
cd ~/software/java
tar xvfz jdk*
mv jdk1.7.0_45 /usr/share

#### SET JAVA_HOME
emacs ~/.bash_profile
    export JAVA_HOME=/usr/share/jdk1.7.0_45


2. INSTALL POSTGRESQL

http://www.ubuntugeek.com/how-to-install-postgresql-9-2-on-ubuntu-server-using-ppa.html

#### INSTALL DEPENDENCIES
sudo apt-get install libpq-dev

#### ADD PPA
sudo add-apt-repository ppa:pitti/postgresql

#### UPDATE APT-GET
sudo apt-get update

#### INSTALL POSTGRESQL
sudo apt-get install postgresql-9.2

#### SET PASSWORD
sudo -u postgres psql postgres

\password postgres
    open4annai

#### EXIT postgres PROMPT
Control + D


3. CREATE JIRA DATABASE

##LOGIN 
##sudo -s -H -u postgres

#### DROP jirauser USER IF ALREADY CREATED
sudo -u postgres dropuser jirauser
sudo -u postgres dropuser jirauser

#### CREATE JIRA USER
sudo -u postgres createuser -S -d -r -P -E jirauser

Enter password:
    open4annai

  -S, --no-superuser        role will not be superuser (default)
  -d, --createdb            role can create new databases
  -r, --createrole          role can create new roles
  -P, --pwprompt            assign a password to new role
  -E, --encrypted           encrypt stored password


#### CONFIRM JIRA ROLE
sudo -u postgres psql -tAc "SELECT 1 FROM pg_roles WHERE rolname='jirauser'"
    1
ubuntu@ip-10-176-166-169:~$

sudo -u postgres psql -tAc "SELECT * FROM pg_roles WHERE rolname='jirauser'"
    jirauser|f|t|t|t|f|t|f|-1|********|||16386


#### DROP jira DATABASE IF EXISTS
sudo -u postgres dropdb jira

#### CREATE jira DATABASE
sudo -u postgres createdb --owner jirauser --encoding utf8 jira



4. INSTALL JIRA 6.1.1 ON CONFLUENCE-3:

	INSTALL DIR: 		/opt/atlassian/jira 
	HOME (DATA) DIR: 	/var/atlassian/application-data/jira 
	HTTP Port: 			8080 
	RMI Port: 			8005 


#### CREATE JIRA_HOME AND INSTALLATION DIRECTORY
mkdir -p /var/atlassian/application-data/jira
mkdir -p /opt/atlassian/jira

#### SET JIRA_HOME AND JAVA_HOME
emacs ~/.bash_profile
    export JAVA_HOME=/usr/share/jdk1.7.0_45
	export JIRA_HOME=/var/atlassian/application-data/jira

cd /home/ubuntu/software/atlassian
wget http://www.atlassian.com/software/jira/downloads/binary/atlassian-jira-6.1.2.tar.gz
tar xvfz atlassian-jira-6.1.2.tar.gz
mv atlassian-jira-6.1.2-standalone /opt/atlassian/jira/6.1.2


#### START JIRA

cd /opt/atlassian/jira/6.1.2/bin
./start-jira.sh

WHICH POPULATES THE INSTALLATION DIR:

/var/atlassian/application-data/jira

	drwxr-xr-x 9 root root 4096 2013-11-22 05:40 ./
	drwxr-xr-x 7 root root 4096 2013-11-22 05:39 ../
	drwxr-xr-x 3 root root 4096 2013-11-22 05:40 caches/
	drwxr-xr-x 3 root root 4096 2013-11-22 05:40 data/
	drwxr-xr-x 2 root root 4096 2013-11-22 05:40 export/
	drwxr-xr-x 4 root root 4096 2013-11-22 05:40 import/
	-rw-r--r-- 1 root root    0 2013-11-22 05:40 .jira-home.lock
	drwxr-xr-x 2 root root 4096 2013-11-22 05:40 log/
	drwxr-xr-x 5 root root 4096 2013-11-22 05:40 plugins/
	drwxr-xr-x 3 root root 4096 2013-11-22 05:40 tmp/


NB: A common startup problem is when another program has claimed port 8080, which
JIRA is configured to run on by default. To avoid this port conflict, JIRA's
port can be changed in file:

conf/server.xml





NOTE: DID NOT USE BINARY INSTALLERS BECAUSE GOT STRANGE ERROR WITH VERSIONS

./atlassian-jira-6.1.1-x64.bin
./atlassian-jira-6.1.2-x64.bin
./atlassian-jira-6.1.3-x64.bin

##https://www.atlassian.com/software/jira/download-archives
#wget http://www.atlassian.com/software/jira/downloads/binary/atlassian-jira-6.1.3-x64.bin
#sudo ./atlassian-jira-6.1.1-x64.bin
#     com.install4j.runtime.beans.actions.misc.RunExecutableAction failed



</entry>
<entry [Fri 2013:11:08 06:45:12 EST] REINSTALLED JIRA, CONFLUENCE AND BAMBOO ON CONFLUENCE-3>

export instanceid=i-6553c23f
#export host=ec2-54-219-52-126.us-west-1.compute.amazonaws.com
export host=184.169.161.14

ADDED TAGS

ec2-create-tags i-6553c23f \
--tag name=CONFLUENCE-3 \
--tag description="Resized CONFLUENCE-1 to 30GB (pre-reinstall JIRA, etc.)" \
--tag ami=eridanus-0.8.0-alpha.2 \
--tag zone=us-west-1 \
--tag created=131108

ec2din $instanceid

    RESERVATION	r-19c97143	416621443487	default
    INSTANCE	i-6553c23f	ami-2c8db869	ec2-54-219-52-126.us-west-1.compute.amazonaws.com	ip-10-176-49-109.us-west-1.compute.internal	pending	confluence	0		m1.large	2013-11-11T17:42:03+0000	us-west-1a	aki-8d396bc8			monitoring-disabled	54.219.52.126	10.176.49.109			ebs					paravirtual	xen		sg-c7b4b982	default	false	
    BLOCKDEVICE	/dev/sda1	vol-d2a39ffb	2013-11-08T14:28:20.000Z	false		
    TAG	instance	i-6553c23f	description	Resized CONFLUENCE-1 to 30GB (pre-reinstall JIRA, etc.)
    TAG	instance	i-6553c23f	created	131108
    TAG	instance	i-6553c23f	name	CONFLUENCE-3
    TAG	instance	i-6553c23f	zone	us-west-1
    TAG	instance	i-6553c23f	ami	eridanus-0.8.0-alpha.2


ASSOCIATED ELASTIC IP

ec2-associate-address -i $instanceid 184.169.161.14

    ADDRESS	184.169.161.14	i-6553c23f

RESET HOST


export host=184.169.161.14

    
    
0. CREATE SOFTWARE DIRECTORIES

ssh ubuntu@ec2-54-215-71-149.us-west-1.compute.amazonaws.com

mkdir -p ~/software/atlassian
cd ~/software/atlassian


1. INSTALL JAVA jdk-7u40-linux-x64.tar.gz

MANUAL DOWNLOAD FROM

http://www.oracle.com/technetwork/java/javase/downloads/jdk7-downloads-1880260.html


mkdir -p ~/software/java
cd ~/software/java
tar xvfz jdk*
mv jdk1.7.0_45 /usr/share

#### SET JAVA_HOME
emacs ~/.bash_profile
    export JAVA_HOME=/usr/share/jdk1.7.0_45


2. INSTALL POSTGRESQL

http://www.ubuntugeek.com/how-to-install-postgresql-9-2-on-ubuntu-server-using-ppa.html

#### INSTALL DEPENDENCIES
sudo apt-get install libpq-dev

#### ADD PPA
sudo add-apt-repository ppa:pitti/postgresql

#### UPDATE APT-GET
sudo apt-get update

#### INSTALL POSTGRESQL
sudo apt-get install postgresql-9.2

#### SET PASSWORD
sudo -u postgres psql postgres

\password postgres
    open4annai

#### EXIT postgres PROMPT
Control + D


3. CREATE JIRA DATABASE

##LOGIN 
##sudo -s -H -u postgres

#### DROP jirauser USER IF ALREADY CREATED
sudo -u postgres dropuser jirauser
sudo -u postgres dropuser jirauser

#### CREATE JIRA USER
sudo -u postgres createuser -S -d -r -P -E jirauser

Enter password:
    open4annai

  -S, --no-superuser        role will not be superuser (default)
  -d, --createdb            role can create new databases
  -r, --createrole          role can create new roles
  -P, --pwprompt            assign a password to new role
  -E, --encrypted           encrypt stored password


#### CONFIRM JIRA ROLE
sudo -u postgres psql -tAc "SELECT 1 FROM pg_roles WHERE rolname='jirauser'"
    1
ubuntu@ip-10-176-166-169:~$

sudo -u postgres psql -tAc "SELECT * FROM pg_roles WHERE rolname='jirauser'"
    jirauser|f|t|t|t|f|t|f|-1|********|||16386


#### DROP jira DATABASE IF EXISTS
sudo -u postgres dropdb jira

#### CREATE jira DATABASE
sudo -u postgres createdb --owner jirauser --encoding utf8 jira


4. INSTALL JIRA 6.1.1

https://www.atlassian.com/software/jira/download-archives

UPLOAD TO CONFLUENCE-3:

cd /home/ubuntu/software/atlassian
sudo ./atlassian-jira-6.1.1-x64.bin

    OK

    Installation Directory: /opt/atlassian/jira 
    Home Directory: /var/atlassian/application-data/jira 
    HTTP Port: 8080 
    RMI Port: 8005 


5. BROWSE TO JIRA

**** OPEN TCP PORT 8080 IN AWS CONSOLE ****

ec2-204-236-179-50.us-west-1.compute.amazonaws.com:8080
    
Application Title   Annai Systems
Mode                Public
Base URL            http://ec2-204-236-179-50.us-west-1.compute.amazonaws.com:8080


6. INSTALL JIRA-AGILE AND JIRA-CAPTURE

Your trial is expiring on 21/Oct/13: buy a license (unknown price) for this add-on.


http://blogs.atlassian.com/2013/08/renaming-greenhopper-and-bonfire/

I’m Dan on the JIRA/JIRA Agile marketing team. JIRA with JIRA Agile (formerly GreenHopper) makes it easy to be agile in your organization. We use the term “issue” generically as JIRA can have many different types of issues (bug, task) as well as the agile issue types (story, epic).

We have a simple workflow that’s designed for agile teams:

https://confluence.atlassian.com/display/AGILE/Using+JIRA+Agile+Simplified+Workflow

Also, our workflow is customizable for teams that want to have special states in their agile workflow.

We have an introduction to Scrum and Kanban with JIRA if you’d like to see how teams use JIRA for agile development:

http://www.youtube.com/watch?v=57xYGGbBemE

Finally, we have a collection of tips on how to be more agile:

https://www.atlassian.com/agile/ 



7. SET UP JIRA

https://confluence.atlassian.com/display/ATLAS/Dragons+Stage+1+-+Install+JIRA#DragonsStage1-InstallJIRA-Step4.InstallJIRA

Now you can run JIRA's Setup Wizard and then enable some JIRA features that are required for the later stages in this integration procedure.

If JIRA didn't open automatically in your browser, go to your web browser and type this address: http://localhost:8080.
The JIRA Setup Wizard will start. It guides you through the process of setting up your JIRA server and creating an administration user. Detailed instructions are in the JIRA documentation. Below are the things you need to know for our Dragon Quest.

Choose your server language.
Enter the following information to configure the database connection:
Database Connection: External
Database Type: PostgreSQL
Hostname – Enter the name or IP address of the server where you installed your PostgreSQL database: localhost
Port – Enter the default port that you set up for PostgreSQL: 5432
Database – This is the name of the database that you created in step 3 above: jira
Username – This is the user you created in step 3 above: jirauser
Password – Enter the password you chose in step 3 above.
Schema – Leave this at the default setting: public
Click the Test Connection button to test the connection settings.
When you have a working connection, click Next.
Enter the following application properties:
Application Title: My company JIRA
Mode – Accept the default mode: Public
Base URL – Enter the full website address at which JIRA is running, not just 'localhost'. For example, if your computer name is 'coopers' then the base URL should be: http://coopers:8080. Or specify a website address, such as http://www.foobar.com:8080.
License Key – If you do not already have a JIRA license, follow the prompts on the setup wizard screen to get an evaluation license key.
Click Next.
Specify the administrator account. This will be your JIRA super user:
Username: charlie
Password – Enter a password for the administrator account and enter it again to confirm it.
Full name: Charlie of Atlassian
Email – We recommend that you give your own email address here.
Click Next.
Email notifications – For the purposes of the Atlassian Dragon Quest, we recommend that you leave email notifications disabled. This is the default setting.
Click Finish.

You are logged in to JIRA with the username charlie  and a wizard window opens.

Click I'll skip this to close the wizard and perform the following configuration steps:

SET JIRA GENERAL CONFIGURATION

Allow unassigned issues and check that the remote API is enabled:

Click Administration in the top navigation bar.
Click System > General Configuration in the top menu.
Enter your password as prompted, to confirm that you want administrator access. (Note that the Atlassian applications will request this confirmation at various steps in the process. This guide will not mention this step again.)
Click Edit Configuration.
Select the ON radio button next to Allow unassigned issues.
Check that the ON radio button is selected next to Accept remote API calls. It is on by default.
Click Update.

ADD GROUPS

Add the groups that you will need later for Confluence and Bamboo:
Click Users > Groups in the top menu.

In the Add Group section, enter a group name of 'confluence-users' and click Add Group.
Add the following two groups as well:
confluence-administrators
bamboo-admin
Make Charlie of Atlassian  a user and administrator in Confluence and Bamboo by adding him to the relevant groups:
Click Bulk Edit Group Members.
In the left-hand box, select the three groups:
bamboo-admin
confluence-administrators
confluence-users
In the right-hand box under Add members to selected group(s), enter the username: charlie
Click Join. Charlie's name will appear in the middle box as a group member of the selected groups.


8. CREATE A JIRA PROJECT


In this step you will create some data in JIRA, including a project and an issue, for use in the subsequent stages of this integration procedure. Then you will create your own JIRA dashboard with a couple of gadgets. For this procedure, you need to be logged in as JIRA Admin.

CREATE PROJECT

Create a project in JIRA:
Click Projects > Projects in the top menu.
Hint: Try JIRA's quick search instead of the menus. Press g g on your keyboard then start typing 'projects' into the Administration Search box. If you like, you can use the quick search from this point onwards.
Click Add Project.

PROJECT --> ADMINISTRATION

Enter the following information:
Name: Dragons
Key: DRA
Click Add.
Add two versions (1.0 and 2.0):
Click Versions in the left-hand panel of the Dragons project screen.
Enter the following information, then click Add:
Name: 1.0
Description: Version 1.0
Do the same for Version 2.0.

CREATE AN ISSUE FOR THE PROJECT

Add an issue to your project:
Click Exit Administration at the top of the administration screen
The dashboard will appear. Click Create Issue at the top of the dashboard.
Enter the following information about your new issue:
Project: Dragons
Issue Type: Bug
Summary: Dragon slayer's equipment is defective
Affects Version/s: 1.0
Assignee – Click Assign to Me, which will assign this task to Charlie of Atlassian.

Description: There's a hole in the dragon slayer's water bucket
Original Estimate: 1d
Click Create. You now have an issue with a key of 'DRA-1'. Click the issue key and take a look at your new issue.

CREATE A DASHBOARD FOR THE PROJECT

Create a new dashboard for all your dragon-related tasks, issues and general fire fighting:
Click Dashboards > Manage Dashboards at top left of your JIRA screen.
Click Create new dashboard.
The Create New Dashboard screen appears. Enter the following information:
Name: Dragon Development Dashboard
Description: A dashboard for dragon slayers, fire fighters and like-minded brave souls
Leave the other fields at their default values and click the Add button at the bottom of the 'Create New Dashboard' screen (not the one next to 'Add Shares').
Click on the dashboard name to edit it. You can now add gadgets.

ADD A GADGET TO THE DASHBOARD

Click Add Gadget.
The 'Gadget Directory' will appear, showing a list of the available gadgets for your JIRA dashboard. Enter 'projects' into the search box at top right of the gadget directory.
The list of gadgets will change, to show only the gadgets that match your search term. Find the 'Projects' gadget and click Add it Now. The gadget will be highlighted for a short time and the button's wording will change to 'Adding', while JIRA adds the gadget to the dashboard.
Find and add the 'Assigned To Me' gadget in the same way.
Click Finished to go back to your dashboard.
Drag the 'Assigned to Me' gadget to the top right of your dashboard:
Move your mouse pointer over the gadget's blue title bar.
The cursor icon will change to a four-pointed arrow  (or a hand). Click the gadget title bar with the left mouse button then drag the gadget to the right. Drop it in the space labelled 'Drag your gadget here.'
Configure the 'Projects' gadget to point to your 'Dragons' project: 
Select 'Dragons' from the Projects list.
Leave the default values as configured for View and Number of Columns.
Click the dropdown arrow next to Refresh Interval and select Every 15 Minutes.
Click Save.
Configure the 'Assigned to Me' gadget:
Leave the default values as configured for Number of Results and Fields to display.
Click the dropdown arrow next to Refresh Interval and select Every 15 Minutes.
Click Save.


</entry>
<entry [Thu 2013:11:07 11:35:41 EST] FIXED JIRA RESTORE FROM BACKUP ON CONFLUENCE-1>

1. RESTARTED CONFLUENCE-1

[Thu 2013:11:07 11:22:42 EST] RESTARTED CONFLUENCE-1
RESTARTED TO TROUBLESHOOT MYSQL ACCESS AFTER LOAD JIRA


2. CONNECT TO CONFLUENCE-1

setkey annai
ssh ubuntu@ec2-54-219-40-217.us-west-1.compute.amazonaws.com
    OK

    
3. START JIRA

/opt/atlassian/jira/bin/shutdown.sh
/opt/atlassian/jira/bin/startup.sh



3. BROWSE TO CONFLUENCE-1 JIRA

ec2-54-219-40-217.us-west-1.compute.amazonaws.com:8080



    
</entry>
<entry [Fri 2013:09:27 09:39:16 EST] INSTALLED 'CREATELY' PLUGIN>


https://creately.com/diagram-products#google-apps


    
</entry>
<entry [Fri 2013:09:27 02:38:03 EST] CONFIGURE CONFLUENCE TO SEND EMAIL>

https://confluence.atlassian.com/display/CONF52/Configuring+a+server+for+outgoing+mail#ConfiguringaServerforOutgoingMail-ConfiguringConfluencetosendemailmessages

Configuring Confluence to send email messages

To configure Confluence to send outgoing mail:

Choose the cog icon  at top right of the screen, then choose Confluence Admin.
Select Mail Servers under Configuration in the left-hand panel. This will list all currently configured SMTP servers.
Click Add New SMTP Server (or edit an existing server).
Edit the following fields as required:
Name: By default, this is simply 'SMTP Server'.
From Address: Enter the email address that will be displayed in the 'from' field for email messages originating from this server.
This field is mandatory. You will not be able to complete the Confluence mail server configuration until this field has been specified.
From Name: Enter the name that will be displayed in the 'from' field for email messages originating from this server. This is the text which appears before the user's registered email address (in angled brackets).
This field accepts the following variables, which reference specific details defined in the relevant Confluence user's profile:

Variable
Description
${fullname}

The user's full name.

${email}

The user's email address.

${email.hostname}

The domain/host name component of the user's email address.

The default is '${fullname} (Confluence)'.
Hence, if Joe Bloggs made a change to a page he was watching and the Confluence site's 'From Address' was set to confluence-administrator@example-company.com, then the 'From' field in his email notification would be: Joe Bloggs (Confluence) < confluence-administrator@example-company.com>.

Subject Prefix: Enter some text to appear at the beginning of the subject line.
Manually enter your Host Address, User Name and Password details (recommended)
OR

Specify the JNDI location of a mail session configured in your application server. For more information on how to set up a JNDI mail session, see Setting Up a Mail Session for the Confluence Distribution.

Testing the email settings

A Confluence administrator can test the email server as follows:

Set up a mail server at Confluence Admin > Mail Servers, as described above
Click Send Test Email to check that the server is working. Check that you get the test email in your inbox.
You can flush the email queue to send the email message immediately. Go to Confluence Admin > Mail Queue, and click Flush Mail Queue. See The Mail Queue.
A user can test that notifications are working as follows:

Go to your user profile (using the Settings link) and edit your email preferences. See Subscribing to Email Notifications of Updates to Confluence Content.
Enable Notify On My Actions. (By default, Confluence does not send you notifications for your own changes.)
Go to a page you wish to get notifications about.
Choose Tools > Watch. See Watching Pages, Spaces and Blogs.
Edit the page, make a change, and save the page.
Check your email inbox. You may need to wait a while for the email message to arrive.
Troubleshooting

If you experience problems with these configurations, please check that your

<!--
<Confluence-Install>/confluence/WEB-INF/lib
-->

contains only one copy of the following JAR files:

activation-x.x.x.jar
mail-x.x.x.jar
Ideally, these should be:

activation-1.0.2.jar
mail-1.3.2.jar (or later)


You will then need to move these into the proper directory: Please move (not copy) the two jar files from the
<!--
<Confluence-Install>/confluence/WEB-INF/lib

directory to

<confluence-install>/lib

-->

and restart Confluence.
    
</entry>
<entry [Fri 2013:09:27 01:31:14 EST] ADDED 'FORM MAIL NG' PLUGIN>

1. DOWNLOAD APP
https://marketplace.atlassian.com/plugins/com.adaptavist.confluence.formMailNG


2. INSTALLED APP

Confluence Admin --> Manage Add-ons --> Upload module

    
3. INSTALLED PLUGINS LICENSING MANAGER PLUGIN

https://marketplace.atlassian.com/plugins/com.adaptavist.plm.plugin.plm-plugin


4. USE APP

http://www.adaptavist.com/doco/display/FMP/Form+Mail+Documentation



</entry>
<entry [Wed 2013:09:25 21:11:00 EST] MIGRATING JIRA - ATTACHMENTS, sysadmin PASSWORD, REENABLE LINKS>

Migrating from JIRA OnDemand to a JIRA Installed Site

https://confluence.atlassian.com/display/JIRA/Migrating+from+JIRA+OnDemand+to+a+JIRA+Installed+Site

1. IMPORT ATTACHMENTS - RENAME 

(Optional) If you exported your attachments you will need to add the saved directory into your new JIRA home path after the import process has completed.

https://answers.atlassian.com/questions/198826/how-do-i-export-attachments-associated-with-the-projects

If you're trying to get them to have their original file names, you will need to either do something in the API or write a SQL script to provide the name of the file on disk and it's original name, then rename the flat file back to it's original name. Filenames are obfuscated on disk with modern versions of Jira.


2. CHANGE sysadmin PASSWORD

Log in to your new JIRA site, using the following credentials: 
Username: sysadmin
Password: sysadmin
Change the password immediately after logging in.


3. REENABLE APPLICATIONS LINKS BETWEEN APPLICATIONS


JIRA ADMIN --> ADDONS --> APPLICATION LINKS

ENTER CONFLUENCE URL --> CREATE NEW LINK

ENTER JIRA URL  --> CREATE NEW LINK



Configuring Application Links

https://confluence.atlassian.com/display/JIRA/Linking+to+Another+Application?from=sQHKDQ

Quick Start: Application Links 

https://confluence.atlassian.com/display/APPLINKS/Quick+Start%3A+Application+Links



    
</entry>
<entry [Mon 2013:09:23 03:28:00 EST] ANNAI DOMAIN NAME ACCOUNT>

WHOIS RECORD

Whois Record
Reverse Whois: "Annai Systems Inc" owns about 19 other domains
Email Search: kris@annaisystems.com is associated with about 10 domains
Registrar History: 1 registrar
NS History: 2 changes	 on 3 unique name servers	 over 3 years.
IP History: 4	 changes on 4 unique IP addresses over 3 years.
Whois History: 28 records have been archived since 2010-03-22 .
Reverse IP: 1 other site is hosted on this server.


Domain name: annaisystems.com

Registrant Contact:
   Annai Systems Inc
   Kris Peterson ()
   
   Fax: 
   475 Alberto way suite 130
   Los Gatos, California 95032
   US

Administrative Contact:
   Annai Systems Inc
   Kris Peterson ()
   +1.4083963539
   Fax: +1.4083963539
   475 Alberto way suite 130
   Los Gatos, California 95032
   US

Technical Contact:
   justhost.com
   Just Host Hosting ()
   +1.8887557585
   Fax: 
   1958 South 950 East
   Provo, Utah 84606
   US

Status: Locked

Name Servers:
   ns1.justhost.com
   ns2.justhost.com
   
Creation date: 21 Mar 2010 13:09:00
Expiration date: 21 Mar 2014 12:09:06


REGISTRATION

ICANN Registrar:ENOM, INC.
Created:2010-03-21
Expires: 2014-03-21
Updated:2013-05-09
Registrar Status:clientTransferProhibited
Name Server: NS1.JUSTHOST.COM	 (has 353,245 domains)
NS2.JUSTHOST.COM	 (has 353,245 domains)


SERVER STATS

Server Type:ApacheIP
Address:69.195.117.132
Whois Server:whois.enom.com
ASN:United States AS46606 UNIFIEDLAYER-AS-1 - Unified Layer (registered Oct 24, 2008)
IP Location:United States - Utah	 - Provo	 -Unified Layer
Response Code:200
Domain Status:Registered And Active Website

    
</entry>
<entry [Mon 2013:09:23 03:25:00 EST] SET CONFLUENCE-1 URL AS confluence.annaisystems.com>

confluence.annaisystems.com
jira.annaisystems.com


https://answers.atlassian.com/questions/154565/different-sub-domain-routing-to-jira-and-confluence-on-same-server

If both are on a server with just one IP Address, you need to add a reverse proxy in front of it. Otherwise, you won't be able to make such configuration.

https://confluence.atlassian.com/display/JIRA/Integrating+JIRA+with+Apache.


Then you just need to point your DNS records to the server's IP Address.

    
</entry>
<entry [Mon 2013:09:23 01:06:10 EST] STOP/START JIRA>


/opt/atlassian/jira/bin/shutdown.sh    
    
/opt/atlassian/jira/bin/startup.sh    


</entry>
<entry [Mon 2013:09:23 00:27:21 EST] LOADED BACKUP FILE INTO JIRA ON CONFLUENCE-1>

1. BACKED UP INITIAL JIRA DATA ON CONFLUENCE-1

JIRA Admin --> Backup

    Data exported to: /var/atlassian/application-data/jira/export/JIRA-initial-backup-130923.zip

    
2. COPIED TO software/confluence

cp /var/atlassian/application-data/jira/export/JIRA-initial-backup-130923.zip \
/home/ubuntu/software/confluence


3. UPLOADED BACKUP OF JIRA DATA ON ATLASSIAN WEBSITE

COPIED TO import DIRECTORY

cp /home/ubuntu/software/confluence/JIRA-backup-20130923.zip \
/var/atlassian/application-data/jira/import


4. LOADED BACKUP INTO JIRA ON CONFLUENCE-1


JIRA Admin --> Backup

FILENAME: JIRA-backup-20130923.zip
LICENSE:
AAABEA0ODAoPeNptkM1OwzAQhO9+CkucjeKkBBLJh5L4YMhPlaRFSFxMWIpR60aOHdG3J2kqVaAeV
lrtzH472ptaWlxDh32K6SL2HuJFhJO0wb5HA5RC3xrVWXXQ7ElUy7cY80HunJwmKDFwalJpgU1+4
kXE99G3MvI2Uy3oHviHOm3zouHVqhI1RxcCs8bBH3tz7KCQe2BJmee8SsQym3XZWjXAvLCbvRsw/
QTxUS6VtqClboH/dMocL4moNyUqzVZq1c9Ha+uksfj14PR2hhdu/w6m/Fz3I5IRimowAxiRskfBN
4SGUUjSu3VEipfwGdW8YGORLPCoF9yH6Jx9tGcivaZcD7Vypv2SPfx/3y/Ts3/QMC0CFC287Wxfe
r7WRV/XinCsgOqEIujZAhUAhZycBvdoTY9oMMdgEsAO0WRmHCM=X02dt


**** WARNING: CURRENT VERSION (6.0) IS LESS THAN BACKUP'S VERSION (6.1)

CLICKED Restore BUTTON AND SHOWED PROGRESS BUT THEN PAGE FAILED TO LOAD

SHUT DOWN JIRA:

/opt/atlassian/jira/bin/shutdown.sh    
    
                    .....
              .... .NMMMD.  ...
            .8MMM.  $MMN,..~MMMO.
            .?MMM.         .MMM?.
    
         OMMMMZ.           .,NMMMN~
         .IMMMMMM. .NMMMN. .MMMMMN,
           ,MMMMMM$..3MD..ZMMMMMM.
            =NMMMMMM,. .,MMMMMMD.
             .MMMMMMMM8MMMMMMM,
               .ONMMMMMMMMMMZ.
                 ,NMMMMMMM8.
                .:,.$MMMMMMM
              .IMMMM..NMMMMMD.
             .8MMMMM:  :NMMMMN.
             .MMMMMM.   .MMMMM~.
             .MMMMMN    .MMMMM?.
    
          Atlassian JIRA
          Version : 6.0.8
                      
    Detecting JVM PermGen support...
    PermGen switch is supported. Setting to 384m
    
    If you encounter issues starting or stopping JIRA, please see the Troubleshooting guide at http://confluence.atlassian.com/display/JIRA/Installation+Troubleshooting+Guide
    
    Server startup logs are located in /opt/atlassian/jira/logs/catalina.out
    Using CATALINA_BASE:   /opt/atlassian/jira
    Using CATALINA_HOME:   /opt/atlassian/jira
    Using CATALINA_TMPDIR: /opt/atlassian/jira/temp
    Using JRE_HOME:        /opt/atlassian/jira/jre/
    Using CLASSPATH:       /opt/atlassian/jira/bin/bootstrap.jar:/opt/atlassian/jira/bin/tomcat-juli.jar
    Using CATALINA_PID:    /opt/atlassian/jira/work/catalina.pid
    Tomcat did not stop in time. PID file was not removed.



ll /opt/atlassian/jira/work/catalina.pid
    -rw-rw-r-- 1 jira jira 4 2013-09-21 23:31 /opt/atlassian/jira/work/catalina.pid
cat /opt/atlassian/jira/work/catalina.pid
    964
rm -fr /opt/atlassian/jira/work/catalina.pid


RESTARTED JIRA

/opt/atlassian/jira/bin/startup.sh    

    ...
    Server startup logs are located in /opt/atlassian/jira/logs/catalina.out
    Using CATALINA_BASE:   /opt/atlassian/jira
    Using CATALINA_HOME:   /opt/atlassian/jira
    Using CATALINA_TMPDIR: /opt/atlassian/jira/temp
    Using JRE_HOME:        /opt/atlassian/jira/jre/
    Using CLASSPATH:       /opt/atlassian/jira/bin/bootstrap.jar:/opt/atlassian/jira/bin/tomcat-juli.jar
    Using CATALINA_PID:    /opt/atlassian/jira/work/catalina.pid


BROWSED TO JIRA TO VERIFY STARTUP AND GOT THIS ERROR:

    HTTP Status 500 - com.opensymphony.module.propertyset.PropertyImplementationException: Unable to esablish a connection with the database. (FATAL: L)


    
</entry>
<entry [Mon 2013:09:23 00:16:25 EST] CHANGE SYSADMIN IN DATABASE>

1. LOGIN

sudo -u posgres psql confluence


2. GET CURRENT SYSADMIN USERS

select u.id, u.user_name, u.active from cwd_user u join cwd_membership m on u.id=m.child_user_id join cwd_group g on m.parent_id=g.id join cwd_directory d on d.id=g.directory_id where g.group_name = 'confluence-administrators' and d.directory_name='Confluence Internal Directory';

    id   | user_name | active 
 --------+-----------+--------
  131074 | sysadmin  | T


3. DESC TABLE

\d+ cwd_membership


                       Table "public.cwd_membership"
     Column     |  Type  | Modifiers | Storage | Stats target | Description 
----------------+--------+-----------+---------+--------------+-------------
 id             | bigint | not null  | plain   |              | 
 parent_id      | bigint | not null  | plain   |              | 
 child_group_id | bigint |           | plain   |              | 
 child_user_id  | bigint |           | plain   |              | 
Indexes:
    "cwd_membership_pkey" PRIMARY KEY, btree (id)
    "idx_mem_dir_child" btree (child_group_id, child_user_id)
    "idx_mem_dir_parent" btree (parent_id)
    "idx_mem_dir_parent_child" btree (parent_id, child_group_id, child_user_id)
Foreign-key constraints:
    "fk_child_grp" FOREIGN KEY (child_group_id) REFERENCES cwd_group(id)
    "fk_child_user" FOREIGN KEY (child_user_id) REFERENCES cwd_user(id)
    "fk_parent_grp" FOREIGN KEY (parent_id) REFERENCES cwd_group(id)
Has OIDs: no


4. SET sysadmin's PASSWORD TO THE WORD sphere

update cwd_user set credential='uQieO/1CGMUIXXftw3ynrsaYLShI+GTcPS4LdUGWbIusFvHPfUzD7CZvms6yMMvA8I7FViHVEqr6Mj4pCLKAFQ==' where user_name='sysadmin';

    UPDATE 1


5. RESTART CONFLUENCE

/opt/atlassian/confluence/bin/stop-confluence.sh 

/opt/atlassian/confluence/bin/start-confluence.sh 



6. BROWSE TO CONFLUENCE

http://ec2-204-236-179-50.us-west-1.compute.amazonaws.com:8090/confluence


7. LOGIN AS sysadmin

sysadmin
sphere


8. GIVE USER syoung SYSADMIN PRIVILEGES

    OK


9. CHANGE SYSADMIN PASSWORD

t*****-b****

    OK

    
</entry>
<entry [Sun 2013:09:22 11:26:34 EST] LOADED BACKUP FILE INTO CONFLUENCE ON CONFLUENCE-1>


1. UPLOADED ANNAI SITE BACKUP FILE

mkdir /var/atlassian/application-data/confluence/restore

FILE IS HERE:

/var/atlassian/application-data/confluence/restore/annai-confluence-backup-20130915.zip


2. RESTORED SITE

Confluence Admin --> Backup --> Restore from file (on filesystem)



3. FIXED BASE URL GREYED OUT BY SETTING SYSADMIN 

Unable to update Server Base URL in Confluence

IN DATABASE:

    -   RESET SYSADMIN USER PASSWORD

    -   GAVE syoung USER SYSADMIN PRIVILEGES



</entry>
<entry [Sun 2013:09:22 04:41:23 EST] HOW TO ADD A GIT REPO TO FISHEYE>

https://confluence.atlassian.com/display/FISHEYE/Git

Git repository setup

To add an external Git repository to FishEye:

Click the'cog' menu in the FishEye header, and choose Administration. You will need to be logged in as an administrator to see this link.
Click Repositories (under 'Repository Settings').
Click Add Existing...
Complete the wizard:
Step 1
Field
Description
Repository Type

Select Git.

Name

Enter a name for this repository. The name may contain alphanumeric, underscore, '-' or '.' characters. This will be repository name in FishEye.

Description

Enter a short description of this repository.

Step 2
Field
Description
Repository Location

Enter the URL describing the Git repository location. FishEye will clone this repository for indexing purposes. You can use any URL recognised by Git itself. Fisheye recognizes the following URL's:

git://server_name[:port]/path_to_repository
http://server_name[:port]/path_to_repository
https://server_name[:port]/path_to_repository
ssh://server_name[:port]/path_to_repository
file://[hostname]/path_to_repository
Do not use spaces in your URL.

Path

(optional) Enter the path within the Git repository that you want FishEye to index. This lets you limit FishEye to indexing a subset of the complete Git repository.

Block Size

(optional) Enter how many commits you want FishEye to process in one batch. Larger values require more memory and increase the amount of work FishEye commits to the database in a single operation. The default is 400. The minimum being 1. This field only accepts positive whole numbers. Requires a repository restart.

Command Timeout

(optional) Enter the time that a single Git command is allowed to take to execute. Any command that exceeds this time is terminated and the operation will fail.

Rename Detection

(optional) Select which Git rename detection strategy FishEye will use to detect copy and move operations within the repository. Please refer to the Git documentation for more information.

Step 3
Field
Description
Store Diff Info

Tick this checkbox, if you want FishEye to cache information about file diffs in its database. This is required for some FishEye features. See Configuring Repository Details for more information on this setting.

Enable Repository After Adding

Tick this checkbox, to enable the repository after adding (i.e. when you click the 'Add' button).

Screenshots: Adding a Git repository




Step 3
Step 2
Step 1
Limitations

When FishEye indexes a Git repository, it indexes by the available branches. As it processes the commits on a branch, FishEye will assign the commit to the branch it first sees the commit on. Commits are only indexed once so if a commit belongs to multiple branches, the commit will not be indexed against subsequent branches.

Furthermore, indexing of a Git repository can be slow when new branches are pushed. Performance in such cases can be improved by setting a command line option for FishEye. See this KB page for more information.


    
</entry>
<entry [Sun 2013:09:22 03:53:45 EST] INSTALLED annai CONFLUENCE - 5. BAMBOO>

1. CREATE BAMBOO DATABASE

#### CREATE bamuser USER
sudo -u postgres createuser -S -d -r -P -E bamuser
    Enter password:     open4annai

#### CREATE DATABASE
sudo -u postgres createdb --owner bamuser --encoding utf8 bamboo


2. INSTALL BAMBOO

GOT LATEST VERSION
https://www.atlassian.com/software/bamboo/download

NB: ARCHIVED VERSIONS
https://www.atlassian.com/software/bamboo/download-archives


Go to the Atlassian download centre.
Click the Linux tab and download the Standalone (TAR.GZ Archive) file for Bamboo 4.3.
(warning) Please use the Bamboo version specified in this documentation. If the download centre shows a Bamboo version later than 4.3, click downloads archive and get Bamboo 4.3. 
Why? We have tested the integration suite with this version. There is a chance that you will have problems integrating the other applications if you use a different version.

Unpack the tar.gz archive into a directory of your choice, avoiding spaces in the directory name.

cd /home/ubuntu/software/confluence
tar xvfz atlassian-bamboo-*
mkdir -p /opt/atlassian/bamboo/5.1.1
mv atlassian-bamboo-5.1.1/* /opt/atlassian/bamboo/5.1.1
rm -fr atlassian-bamboo-5.1.1



Tell Bamboo where to put its Bamboo Home directory:

Edit the properties file
{BAMBOO_INSTALLATION}/atlassian-bamboo/WEB-INF/classes/bamboo-init.properties
# Insert the property 'bamboo.home' with an absolute path to your Bamboo Home directory. For example:
bamboo.home=/var/bamboo-home


CREATE HOME DIR
mkdir -p /var/atlassian/bamboo-home

EDIT bamboo-init.properties

emacs -nw /opt/atlassian/bamboo/5.1.1/atlassian-bamboo/WEB-INF/classes/bamboo-init.properties

ADD LINE

bamboo.home=/var/atlassian/bamboo-home

    OK

Because Bamboo will be running on the same machine as JIRA, you need to ensure that the URL paths are different for Bamboo and JIRA. Change the default Bamboo path as follows:

EDIT FILE

emacs -nw /opt/atlassian/bamboo/5.1.1/conf/wrapper.conf

REPLACE THIS

wrapper.app.parameter.4=/

WITH THIS

wrapper.app.parameter.4=/bamboo


START BAMBOO SERVER

## OLD START WITH JETTY: /opt/atlassian/bamboo/5.1.1/bamboo.sh start
## NEW START WITH TOMCAT:
/opt/atlassian/bamboo/5.1.1/bin/start-bamboo.sh
/opt/atlassian/bamboo/5.1.1/bin/stop-bamboo.sh

STARTING

/opt/atlassian/bamboo/5.1.1/bin/start-bamboo.sh

    To run Bamboo in the foreground, start the server with start-bamboo.sh -fg
    
    Server startup logs are located in /opt/atlassian/bamboo/5.1.1/conf/logs/catalina.out
    
    Bamboo Standalone Edition
       Version : 5.1.1
                      
    Detecting JVM PermGen support...
    PermGen switch is supported. Setting to 256m
    
    If you encounter issues starting or stopping Bamboo Standalone Edition, please see the Troubleshooting guide at https://confluence.atlassian.com/display/BAMBOO/Bamboo+installation+guide
    
    Using CATALINA_BASE:   /opt/atlassian/bamboo/5.1.1
    Using CATALINA_HOME:   /opt/atlassian/bamboo/5.1.1
    Using CATALINA_TMPDIR: /opt/atlassian/bamboo/5.1.1/temp
    Using JRE_HOME:        /usr/share/jdk1.7.0_40
    Using CLASSPATH:       /opt/atlassian/bamboo/5.1.1/bin/bootstrap.jar:/opt/atlassian/bamboo/5.1.1/bin/tomcat-juli.jar

    
    
3. SET UP BAMBOO

SET UP MAVEN 2

If you do not yet have Maven 2 installed, we recommend that you download and install the Atlassian Plugin SDK. Note that you do not need to configure an IDE. The SDK includes Maven 2 and a correctly-configured Maven settings.xml file, as well as a number of shell scripts to speed up plugin development. It also includes the Java Activation and other JARs that you will need for a successful Maven build.
If you already have Maven 2, please ensure that you have the required additional JARs. See the FAQ for information on downloading these JARs.


OPEN PORTS IN AWS CONSOLE

TCP/UDP 8085
TCP/UDP 8007
TCP     54663


BROWSE TO BAMBOO

http://ec2-204-236-179-50.us-west-1.compute.amazonaws.com:8085/bamboo

    OK


Enter your license key. If you do not already have a Bamboo license, follow the prompts on the Setup Wizard screen to get an evaluation license key.
Choose the Custom Installation setup method.
Detailed instructions on the custom installation setup are in the Bamboo documentation. Below are the things you need to know for our Dragon Quest. Enter the General Configuration  information as follows:

Name: Atlassian Bamboo
Base URL – Enter the full website address at which your Bamboo server is running, not just 'localhost' and no
t the IP address. For example, if your computer name is 'coopers' then the base URL should be: http://coopers:8085/bamboo. Or specify a website address, such as http://www.foobar.com:8085/bamboo.


http://ec2-204-236-179-50.us-west-1.compute.amazonaws.com:8085/bamboo


Configuration Directory – Leave this at the default value.
Build Data Directory – Leave this at the default value.
Build Working Directory – Leave this at the default value.
Artifacts Directory – Leave this at the default value.
Broker URL – Check that the URL contains a full URL or IP address, and not 'localhost'. If necessary, replace localhost with the real host name or IP address of your Bamboo server. For example, if your computer name is 'coopers' then the broker URL should look like this: tcp://coopers:54663?wireFormat.maxInactivityDuration=300000.


tcp://ec2-204-236-179-50.us-west-1.compute.amazonaws.com:54663?wireFormat.maxInactivityDuration=300000


Click Continue.
Choose External Database for your database configuration and ensure that PostgreSQL 8.2 and above is selected in the dropdown menu.
Click Continue.
Enter the following information to connect to the Bamboo database created in step 1 above:
Connection Type: Direct JDBC connection
Driver Class Name: org.postgresql.Driver
Database URL: jdbc:postgresql://localhost:5432/bamboo
User Name: bamuser
Password – Enter the password you specified in step 1 above.
Overwrite existing data – Leave this checkbox unselected.
Click Continue.
For your 'Starting Data', select Create a new Bamboo home.
Click Continue.
Set up your 'Administrator User Details':
Username: charlie
Password – Enter a password that you will use for the administrator account and enter it again to confirm it.
Full Name: Charlie of Atlassian
Email – Enter the address of your administrator email account. We recommend that you give your own email address here.
Click Finish. The Bamboo home page will appear.



Now you will check that your Bamboo configuration includes your default executable and JDK. Click Administration in the top navigation bar.
The 'Bamboo Administration' screen will appear. Click Executables in the left-hand menu.
The 'Executables' screen will appear. Look through the list on the left, to see if your build tool is included along with the default tools like Script, MSBuild or Bash. For this integration exercise, we assume that you are using Maven 2. In that case, you should see 'Maven 2' listed in the tabs on the left.
If your executable is not included, click Add an executable as a server capability  near the top of the page. The 'Add Capability' panel will appear. Enter the following information:
Capability Type: Executable
Type: Maven 2.x
Executable Label: Maven 2
Path – Enter the path to your Maven installation. This should be the same as the value that you have specified in your M2_HOME environment variable. For example: C:\maven2.2\apache-maven-2.2.0 (Windows) or /usr/local/apache-maven/apache-maven-2.2.1 (UNIX).
If you have installed the Atlassian PDK, Maven can be found in a sub-directory under your Atlassian PDK installation directory. For example, C:\Atlassian\atlassian-plugin-sdk-3.2\apache-maven (Windows) or /usr/local/Atlassian/atlassian-plugin-sdk-3.2/apache-maven (UNIX).
Click Add.
Check that your Bamboo configuration includes your JDK. Click JDKs in the left-hand menu.
The 'JDKs' screen will appear. Look through the tabs on the left, to check that your JDK is included. You will need Oracle JDK 1.6 or higher. Note that the JRE alone is not enough. Stage 1 of these instructions will guide you through the JDK installation procedure. For this integration exercise, we assume that you are using JDK 1.6. In that case, you should see a 'JDK'   tab on the left and a 'JDK 1.6' tab. Ensure that your Java Home environment variable is pointing to your JDK directory, not your JRE directory.
If your JDK is not included, click add a JDK as a server capability. The 'Add Capability' panel will appear. Enter the following information.
Capability Type: JDK.
Label: JDK 1.6.
Java Home – Enter the path to your JDK installation. This should be the same as the value that you have specified in your JAVA_HOME environment variable. For example: C:\Java\jdk (Windows) or /opt/java/java_sdk1.6 (UNIX).
Click Add.



</entry>
<entry [Sun 2013:09:22 03:29:21 EST] INSTALLED annai CONFLUENCE - 4. FISHEYE AND CRUCIBLE>

1. INSTALL MERCURIAL

**** SKIPPED THIS - USING GIT ****

The first step is to install a source control management tool, so that you have a code repository for FishEye to look at. We will use Mercurial.

Get Mercurial and Python. Make sure that you get Mercurial 1.5 or later (requiring Python 2.7). Check FishEye Supported Platforms for compatability.
Note: For some UNIX distributions, the default download will include Mercurial 1.4.3. You will need a later version: 1.5 through 1.9.x. To find the download for a specific version of Mercurial, go to the download directory.
Add or edit your Mercurial configuration file at C:\Documents and Settings\MY_NAME\mercurial.ini (Windows XP) or C:\Users\MY_NAME\mercurial.ini (Windows 7) or ~/.hgrc  (UNIX). The file should contain your preferred editor and your username.
If the Mercurial configuration file does not exist, create it.
If you do not already have a username, you can use atlassian_dragons:

[ui]
; editor used to enter commit logs, etc.  Most text editors will work.
editor = notepad
username = atlassian_dragons


2. CREATE FISHEYE DATABASE

#### CREATE fishuser USER
sudo -u postgres createuser -S -d -r -P -E fishuser
    Enter password:     open4annai

#### CREATE DATABASE
sudo -u postgres createdb --owner fishuser --encoding utf8 fisheye


3. INSTALL FISHEYE AND CRUCIBLE

Requirements: FishEye/Crucible 2.10.

http://www.atlassian.com/software/fisheye/FishEyeDownloadCenter.jspa

Go to the Atlassian download centre.

Download the FishEye 2.10 zip archive. This archive includes Crucible 2.10 as well.

(warning) Please use the FishEye version specified in this documentation. If the download centre shows a FishEye version later than 2.10, click downloads archive and get FishEye 2.10. 
Why? We have tested the integration suite with this version. There is a chance that you will have problems integrating the other applications if you use a different version.

Unpack the zip archive into a directory of your choice, avoiding spaces in the directory name. For example: /opt/fecru-x.x.x
We will now refer to this location as the FishEye/Crucible installation directory.

Now you will create another directory where FishEye/Crucible will store local data, separate from the installation directory:

Create the new data directory. For example:

/opt/fisheyecrucible

Create an environment variable called 'FISHEYE_INST' and point it to your new data directory.

On UNIX, create an environment variable by running the command export PATH="/path/".

Note: Ignore the fact that this environment variable is called 'INST'. It has nothing to do with the installation directory. This environment variable points to the data directory, but it must still have the name specified above.
Copy the config.xml file from the root of your FishEye installation directory to the root of your new data directory.
Because FishEye/Crucible will be running on the same machine as JIRA (already installed), you need to ensure that the URL paths are different for FishEye/Crucible and JIRA. Change the default FishEye/Crucible path as follows:

Edit the config.xml in your FishEye/Crucible data directory.

Add the context attribute to the web-server  element:

<!--
<web-server context="/fisheye">
-->

Start FishEye/Crucible from the command line by running ./bin/run.sh from your FishEye/Crucible installation directory.
Wait a few minutes for the server to launch. This message will appear on the command line once ready: 
'INFO - Server started on :8060 (http) (control port on your-server-IP-address:8059)'.


Step 4. Set Up FishEye and Crucible

In this step you will do the initial setup of your FishEye/Crucible site. As part of this process, you will connect FishEye and Crucible to JIRA, so that you can manage all your users via JIRA and share information between JIRA and FishEye/Crucible.

To access FishEye/Crucible, go to your web browser and type this address: http://localhost:8060/fisheye. Alternatively, type the host name or IP address instead of localhost.
The FishEye/Crucible setup wizard will start.
If you already have a license key, click Enter existing license. Enter your FishEye license into the FishEye License Key field and your Crucible license into the Crucible License Key field.
If you do not have a license key, click Obtain evaluation license and follow the instructions on screen. If prompted, ensure that you choose to include Crucible as part of this evaluation.
Click Next. The 'Connect to JIRA' step will appear. Enter the following information:
JIRA Base URL – Enter the web address of your JIRA server. For example: http://www.foobar.com:8080
Admin Username: charlie
This is Charlie's username in JIRA.
Admin Password – Enter Charlie's password for JIRA.
Leave the other fields (the 'advanced options') at their default values and click the Connect to JIRA button.
The 'Set administrator password' screen will appear. Enter an administration password and then enter it again to confirm it.
This is the password you can use to access your FishEye/Crucible administration screens, by clicking the 'Administration' option at the bottom of the FishEye screens. In addition, you will be able to access the administration screens using the username charlie and Charlie's JIRA password.
Click Next.
Click Add repository to exit the wizard.
Log in to FishEye/Crucible when prompted.
You can use the administration password that you defined in the previous step, or you can use Charlie's login. We recommend that you log in as Charlie:
Click Log In in the top menu bar.
Enter the username 'charlie' and Charlie's password in JIRA.
The FishEye/Crucible 'Admin' screen will appear. Now you will connect FishEye/Crucible to your database. In the left-hand 'Admin' menu, click Database under 'Systems Settings'.
Click Edit  and enter the following details:
Type: PostgreSQL
Driver Location: Bundled
URL: jdbc:postgresql://localhost:5432/fisheye – Note that this value is different from the default value.
User Name: fishuser – This is the user you created in step 2 (above).
Password – Enter the password you defined in step 2 (above).
Click Test Connection to verify that FishEye/Crucible can log in to the database.
Click Save & Migrate, then click OK when the migration is complete.
Screenshot 2 (click to enlarge): FishEye/Crucible database migration successful 



Full details are in the FishEye documentation.

Problems? Please raise a support ticket for the product you're stuck on, or see answers from the community.
Victory? Please continue.


Step 5. Connect FishEye to Bitbucket

For this integration exercise we provide a Bitbucket repository that you can connect to your FishEye 'Dragons' repository. Bitbucket is a code hosting site for the Mercurial distributed version control system (DVCS). We recommend this repository because:

We have committed a code change with a JIRA issue key in the commit message, to match a JIRA issue you created earlier. This will allow you to see the JIRA and FishEye integration immediately, without having to do your own commit.
The sample repository is small, so that FishEye's initial repository indexing process will be fast.
(info) FishEye supports Mercurial, Subversion and a number of other repository types. When you start using FishEye outside this integration exercise, you will need to create another FishEye repository and connect it to your source repository as described in the FishEye documentation.

For this integration exercise, follow the steps below to connect to our sample repository.

If the FishEye administration screen isn't already open, go to it in your browser.
In the left-hand 'Admin' menu, click Repositories under 'Repository Settings'.
Click Add Existing. The first screen of the 'Add Repository' wizard will appear.
Enter the following information:
Repository Type: Mercurial
Name: Dragons
Description: Dragons repository
Click Next  and enter the following information:
Repository Location: https://bitbucket.org/atlassian_dragons/dragonslayers
Authentication Style: No authentication
Click Test Connection to verify that Bitbucket is properly connected to FishEye. Click Close on the window that displays the results of the test.
Click Next and change the following fields:
Store Diff Info – Select this checkbox.
Enable Repository After Adding – Select this checkbox.
Click Add. The 'Repositories' page will display the 'Dragons' repository.
Click the Source tab at the top of the screen.
Click the star symbol next to the 'Dragons' repository to select it as a favourite. (Note: You need to be logged in as Charlie in order to see the star symbol. If you are logged in purely for administration, you will not see the symbol. If you are not logged in as Charlie, please log in now.)
Click the FishEye logo at top left of the screen to return to the FishEye dashboard. You should be able to see the activity stream showing recent commit messages for the repository.
If you do not see any activity, please wait a while for FishEye to finish scanning (indexing) the repository. With our sample repository, this should only take a few minutes.



    
</entry>
<entry [Sun 2013:09:22 03:11:37 EST] INSTALLED annai CONFLUENCE - 3. TEAM CALENDARS>

1. INSTALL TEAM CALENDARS IN CONFLUENCE

Go to your Confluence URL in your browser. For example, http://www.foobar.com:8090/confluence.
Choose Browse > Confluence Admin.
Click Plugins in the left-hand panel.
The plugin management screen will appear.
Enter 'team calendars' into the Search text box at the top of the page and press Enter.
Click the Team Calendars plugin name in the list of plugins.
The plugin details will appear. Click Try.
A window will open to show the progress of the installation. When Team Calendars has been installed, click Continue to request an evaluation license from Atlassian.
The browser will open MyAtlassian. Enter your information and follow the prompts to get an evaluation license for Team Calendars.
After a license has been generated, click Apply License on the Apply Your License window. 
Team Calendars will be automatically configured with your evaluation license information.
Full details are in the Team Calendars Installation Guide.


2. ADD A PEOPLE CALENDAR

In this step you will add a calendar where Charlie and his team can keep track of their leave.

###Open the user options menu under Charlie's name by clicking Charlie of Atlassian, then choose Calendar.

DASHBOARD --> CREATE OR FIND CALENDARS


Follow the prompts to choose a time zone, view the welcome message and add a People Calendar.
The 'Create People Calendar' screen will appear. Enter the following information:
Name: Team leave
Description: Charlie's team leave calendar
Related space: Dragons
Time zone – Leave the default value.
Click OK to create the calendar.
The 'Congratulations' screen will appear. Click Add to add an event to the calendar.
Enter the following information:
Calendar: Team leave
Who: Charlie of Atlassian (charlie)
When – Leave the default value (today's date).
Leave the other fields at their default values too.
Click OK.


3. ADD A JIRA CALENDAR

In this step you will add a JIRA calendar where Charlie and his team can keep track of their JIRA issues.

Make sure that you are still on the 'My Calendars' screen. Choose Add Calendar > Add New Calendar.

?????? Click JIRA Calendar ????????

Enter the following information:
Name: Dragons
Description: Dragons JIRA calendar
Related space: Dragons
Project: Dragons
Show – Select Issue Due Date and Version Due Date.
Click OK to create the calendar.
Click Close.
Now you will schedule a JIRA issue and a JIRA version for today, so that you can see the events from both calendars showing on the same date.
Go to your JIRA URL in your browser. For example, http://www.foobar.com:8080.
Go to your JIRA dashboard and click the DRA-2 issue key in the 'Assigned to Me' gadget.
The issue details screen will appear. Edit the issue and set the Due Date to today's date. Click Update to save your changes.
Click on Administration to enter the Admin panel and then select the Dragons project.
You are now in the project administration screen for the Dragons project. Click Versions in the left-hand panel.
Hover your cursor in the Release Date column for version 2.0, and click the prompt to Add release date.
Change the release date to today's date.
Click Update.
Go back to the 'My Calendars' screen in Confluence, and refresh both calendars. (Click the downward-pointing arrow to the right of the calendar and choose Refresh.)
Click Month  to see the monthly calendar view. It will show three events for today's date:
Charlie's day of leave, from the People calendar.
The due date for sprint 2.0, from the JIRA calendar.
The due date for issue DRA-2, from the JIRA calendar.
At this point, Charlie realises that he's playing with fire by scheduling a day's leave on the same day as the release is due.


4. ADD TEAM CALENDARS MACRO TO HOME PAGE

In this step you will add a Team Calendars macro to the home page in your Dragons space, showing events from the two new calendars

Go to the 'Home' page of your 'Dragons' space in Confluence. (Type 'Home' into the Confluence search box and choose the 'Home' page from the dropdown list.)
Edit the page.
Place your cursor after the Charlie badge at the top of the page, and press Enter to create a new line.
Enter the following text, and format it as a heading level 2: My calendar
Hint: Press Ctrl+2 or Cmd+2 as a keyboard shortcut to format a heading level 2. Click the question mark on the right of the editor toolbar to see all the keyboard shortcuts.
Press Enter to start a new line, then start typing: {calendar, to add a Team Calendars macro.
The 'Macro suggestions' dropdown list will appear. Select Team Calendars. (Or open the Macro Browser and find the macro manually.)
The 'Insert Calendar' screen will appear. Select Add Existing Calendar.
In the 'Add Existing Team Calendar' window, start typing "Dragon" then select the Dragons checkbox when it appears in the list.
Click Add.
Click Got it, thanks! to close the tip that appears on the calendar.
Repeat the steps to add the 'Team Leave' calendar to the page.
Save the page.



</entry>
<entry [Sat 2013:09:21 15:52:11 EST] CONFLUENCE STARTUP LOG>

Server startup logs:

/opt/atlassian/confluence/logs/catalina.out

    
</entry>
<entry [Sat 2013:09:21 14:38:06 EST] INSTALLED annai CONFLUENCE - 2. CONFLUENCE>

https://confluence.atlassian.com/display/ATLAS/Dragons+Stage+3+-+Install+Confluence

1. CREATE confluence DATABASE IN POSTGRESQL

#### CREATE CONFLUENCE USER
sudo -u postgres createuser -S -d -r -P -E confuser

**** IMPORTANT, MUST DO THIS EVEN THOUGH SET PASSWORD IN PREVIOUS STEP ****
#### SET CONFLUENCE USER PASSWORD 
sudo -u postgres psql postgres
\password confuser
    open4annai

#### CREATE CONFLUENCE DATABASE
sudo -u postgres createdb --owner confuser --encoding utf8 confluence

#### NB: CHANGE TO postgres USER
sudo -s -H -u postgres


2. INSTALL CONFLUENCE

DOWNLOAD CONFLUENCE
https://www.atlassian.com/software/confluence/download

INSTALL CONFLUENCE
cd software/confluence
sudo ./atlassian-confluence-5.2.5-x64.bin

INSTALLATION SETTINGS

Installation Directory: /opt/atlassian/confluence 
Home Directory: /var/atlassian/application-data/confluence 
HTTP Port: 8090 
RMI Port: 8000 


BROWSE TO CONFLUENCE

**** OPEN TCP PORTS 8090 AND 8000 IN AWS CONSOLE ****

http://ec2-204-236-179-50.us-west-1.compute.amazonaws.com:8090


GENERATE LICENSE

AAABBw0ODAoPeNptkMtOwzAQRff+CkusjeyEqjSSF8HOIigPaMICiY0J02IpdSI/Ivr3pC20KmIx0
jzu1bmam0Z53MCII4bZMrmLE7bEQrY4oixGElxn9ej1YLgYzKYPYDp4S3A2qT6owx4JC8dGKg/84
CJ0RaIIdbP+VnVeT8C9DYAuntN8FBS6A+Og3Y9QqR1wUZdlthZ5WqBSaePBqJmYfY3a7i8ERs+EK
uzewdYb0QfnwVbDBzhOUW23ymh3wjU+KOvx6xDMFjVgJ7C55A/rRUOe09UjkTTOSNmmLWqyis9Fi
pgyumD36CffLC9yeXW5or84sI4T9qv/P/BTsN2ncvD3Vd9XbHwmMCwCFGPaReBXR8dRrlQC6yHEY
b1b6ZaMAhRPrKlcMFFP3POKvsK7RYFzPQVcFg==X02dh


EDIT conf/server.xml FILE

STOP CONFLUENCE

/opt/atlassian/confluence/bin/stop-confluence.sh 

    executing using dedicated user
    If you encounter issues starting up Confluence Standalone, please see the Installation guide at http://confluence.atlassian.com/display/DOC/Confluence+Installation+Guide

    Server startup logs are located in /opt/atlassian/confluence/logs/catalina.out
    
    Using CATALINA_BASE:   /opt/atlassian/confluence
    Using CATALINA_HOME:   /opt/atlassian/confluence
    Using CATALINA_TMPDIR: /opt/atlassian/confluence/temp
    Using JRE_HOME:        /opt/atlassian/confluence/jre/
    Using CLASSPATH:       /opt/atlassian/confluence/bin/bootstrap.jar
    Using CATALINA_PID:    /opt/atlassian/confluence/work/catalina.pid


EDIT conf/server.xml FILE

emacs -nw /opt/atlassian/confluence/conf/server.xml


CHANGE path ATTRIBUTE IN Context ELEMENT FROM "" TO "/confluence":


<!--
<Context path="/confluence" docBase="../confluence" debug="0" reloadable="false" useHttpOnly="true">\
-->


START CONFLUENCE

/opt/atlassian/confluence/bin/start-confluence.sh 

    To run Confluence in the foreground, start the server with start-confluence.sh -fg
    executing using dedicated user: confluence
    If you encounter issues starting up Confluence Standalone, please see the Installation guide at http://confluence.atlassian.com/display/DOC/Confluence+Installation+Guide
    
    Server startup logs are located in /opt/atlassian/confluence/logs/catalina.out

    Using CATALINA_BASE:   /opt/atlassian/confluence
    Using CATALINA_HOME:   /opt/atlassian/confluence
    Using CATALINA_TMPDIR: /opt/atlassian/confluence/temp
    Using JRE_HOME:        /opt/atlassian/confluence/jre/
    Using CLASSPATH:       /opt/atlassian/confluence/bin/bootstrap.jar
    Using CATALINA_PID:    /opt/atlassian/confluence/work/catalina.pid


3. SET UP CONFLUENCE

BROWSE TO CONFLUENCE

http://ec2-204-236-179-50.us-west-1.compute.amazonaws.com:8090/confluence/setup/setuplicense.action



'Choose Installation Type' --> Production Installation

'Choose a Database Configuration' --> PostgreSQL database --> External Database

'External Database' --> PostgreSQL --> External Database button.

'Configure Database' --> Direct JDBC button


Enter the following information:

Driver Class Name:      org.postgresql.Driver – This is the default value.

Database URL:           jdbc:postgresql://localhost:5432/confluence – This is the default value.

Username:               confuser – This is the user you created in step 1 (above).

Password                – Enter the password that you chose in step 1 (above).

Click the Next button. You might need to wait a few minutes while Confluence sets up its database.

On the 'Load Content' screen, click the Example Site button to include the demonstration space content into your Confluence installation:.

The 'User Management Setup' screen will appear. Click Connect to JIRA.
The 'Connect to JIRA' screen will appear. Enter the following information:
JIRA Server Location – Enter the web address of your JIRA server. For example: http://www.foobar.com:8080/
JIRA Administrator Login Username: charlie
This is Charlie's username in JIRA.
Password – Enter Charlie's password for JIRA.
Leave the other fields (the 'advanced options') at their default values and click Next.
The 'Load users and groups from JIRA' screen will appear, informing you that Confluence has created an administrative account for Charlie, to match his JIRA account. Click Next.


The 'Confluence Setup Successful' screen will appear. Click Start using Confluence.
If the 'What's new in Confluence' popup window appears, select Don't show again and click Close.
The home page of the Confluence 'Demonstration Space' will appear.


Finally, you need to change your Confluence base URL to the full web address at which Confluence is running, and enable the remote API:

Open the Browse menu at the top of the screen and select Confluence Admin. Confirm your password when prompted. This is Charlie's password in Confluence, and is the same as his password in JIRA.
The 'Administration Console' screen will appear. Click General Configuration under 'Configuration' in the left-hand panel.


The 'General Configuration' screen will appear. Click any of the Edit links.
In the Server Base Url field, enter the full website address at which Confluence is running. This address should not be 'localhost'. For example, if your computer name is 'coopers' then the server base URL should be: http://coopers:8090/confluence. Alternatively, specify a website address such as http://www.foobar.com:8090/confluence.
Click the check box next to Remote API (XML-RPC & SOAP), to enable the remote API.
Scroll down to the end of the page and click Save.

    OK
    
    
4. CREATE A SPACE

Click Dashboard at the top left of the Confluence screen.
Click Add Space on the top right-hand side of the screen.
The 'Create Space' screen will appear. Configure your space settings:
Enter a space name: Dragons
Enter a space key: DRA
Leave the rest of the settings at their default the default settings as they are.
Click Create.
The 'Home' page of your new 'Dragons' space will appear, with some default content. Now you can edit the home page as you like. For this exercise, you will add a Charlie badge:
Right-click on the image of the Charlie badge at the bottom of this documentation page and save it to your desktop. The file name is 'dragon_badge03.png'.
Click Edit at the top right of your new Dragons home page in your own Confluence site.
The wiki editor will open. If prompted, allow Gears access to your site. This will allow you to drag and drop images and other attachments onto your wiki page.
Select and delete all the text in the editor pane. You will start with an empty page.
Make sure your cursor is at the top of the editor pane.
Choose Insert > Image in the editor toolbar.
The 'Insert Image' popup window will appear. Browse to your desktop and upload the Charlie badge image that you saved earlier.
A preview of the image will appear in the 'Insert Image' window. Click Insert.
The image will appear in the editor pane of your home page. Click Save to save your updated wiki page.

    OK
    

5. ADD SOME JIRA ISSUES TO CONFLUENCE

Now you can put some interesting JIRA content into your page. What's more, you can insert an issue into JIRA directly from your Confluence page and then display the issue on the page.

Edit the Confluence page again.
Place your cursor immediately after your Charlie badge image and press Enter to start a new line.
Enter the following text onto the page: My JIRA issues
Select the text that you have just entered and format it as a heading level 2. (Click the formatting dropdown menu on the left-hand edge of the editor tool bar. By default it formats your text as 'Paragraph'. Select Heading 2.)
Deselect the text and then press Enter to start a new line.
Follow the steps below to add a JIRA macro to your page. The macro will show a dynamic list of issues drawn from the 'Dragons' project on your JIRA site.
Choose Insert > JIRA Issue in the editor toolbar.
The 'Insert JIRA Issue' popup window will appear. Click Search in the left-hand panel.
Enter the following JQL (JIRA Query Language) phrase into the search box: project = DRA
Click the Search button.
A list of issues will appear, matching your search query. Select the option to Insert all query results as a table.
Click Insert.
The JIRA macro will appear on your page.

Click Preview at the bottom of the editor pane, to see a preview of the page. You will see a list of the JIRA issues in your 'Dragons' project.
Click Edit to return to the editor.
Enter the following text onto the page, and format it as a heading level 2: Reporting a new issue
Hint: Press Ctrl+2 or Cmd+2 as a keyboard shortcut to format a heading level 2. Click the question mark on the right of the editor toolbar to see all the keyboard shortcuts. 
Start a new line.
Follow the steps below to add a new issue into JIRA and display the issue on your Confluence page:
Choose Insert > JIRA Issue in the editor toolbar.
The 'Insert JIRA Issue' popup window will appear. Click Create New Issue in the left-hand panel.
Enter the following information:
Project: Dragons
Issue Type: Bug
Summary: The purple dragon melted my chocolate
Version/s: 2.0
Description: The dragon tried to eat my chocolate and flamed it by mistake
Click Insert.
You now have a new issue, DRA-2, in the Dragons project in JIRA. In addition, a new JIRA macro will appear on your Confluence page, showing only the new issue that you have created in JIRA.

Save the page.
Note: The new issue will appear immediately under the heading 'Reporting a new issue'. To see the new issue appear in the table under 'My JIRA issues', you may need to click the refresh icon  at the bottom of the table. This is because the issues shown in the table are cached.
JIRA knows about the link between the new JIRA issue and the Confluence page! Go to your JIRA URL in your browser (for example, http://www.foobar.com:8080/) and find issue DRA-2. The Issue Links section includes a link to the wiki page.

    OK
    

6. ENABLE CONFLUENCE GADGETS IN JIRA

In this step you will make your Confluence gadgets available in JIRA, so that JIRA users will be able to add any Confluence gadget to their dashboards.

Go to your JIRA dashboard.
Click Add Gadget.
The 'Gadget Directory' popup window will appear. Click Gadget Subscriptions.
The 'Gadget Subscriptions' popup window will appear. Click Add Subscription.
The 'Add Subscriptions' popup window will appear. Copy the base URL for your Confluence site (e.g. http://coopers:8090/confluence or http://www.foobar.com:8090/confluence) and paste it into the text box on the screen.
Click Add Subscription.
Click Finished.

    OK
    

7. ADD A CONFLUENCE GADGET TO JIRA


Now you will add the 'Confluence QuickNav' gadget to your JIRA dashboard.

Click Dashboards at top left of your JIRA screen.
Your 'Dragon Development Dashboard' will appear. Click Add Gadget.
The 'Gadget Directory' will appear, showing a list of the available gadgets for your JIRA dashboard. Click Confluence in the left-hand panel.
The directory will limit the list to gadgets published by Confluence. Find the Confluence QuickNav gadget and click Add it Now under the gadget. The gadget will be highlighted for a short time and the button's wording will change to 'Adding', while JIRA adds the gadget to the dashboard.
Click Finished to go back to your dashboard.
Test the new gadget – type 'dragons' in the Search textbox inside the Confluence QuickNav gadget.
A list of page titles will appear in a dropdown list. Open one of them in a new tab, to see the Confluence page.
Re-arrange your JIRA dashboard:
Drag the Projects gadget to the right and drop it under the 'Assigned to Me' gadget.
Choose a different colour for your Confluence QuickNav gadget:
Move your cursor pointer over the gadget and click the downward-pointing arrow at top right of the gadget frame.
Select the red square in the row of colours.    



</entry>
<entry [Sat 2013:09:21 14:18:43 EST] CREATED IMAGE OF CONFLUENCE-1 WITH ONLY JIRA INSTALLED ami-7a90a53f>

IMAGE ID        ami-7a90a53f
INSTANCE ID     i-9c2419c7
INSTANCE NAME   CONFLUENCE-1
IMAGE NAME      confluence-jira-only
DESCRIPTION     Only JIRA installed (+JIRA-Agile, JIRA-Capture)
    
</entry>
<entry [Sat 2013:09:07 19:20:59 EST] INSTALLED annai CONFLUENCE - 1. JIRA, JIRA-AGILE AND JIRA-CAPTURE>
    
https://confluence.atlassian.com/display/ATLAS/Here+Be+Dragons

https://confluence.atlassian.com/display/DOC/Installing+Confluence+and+JIRA+Together

#### CREATE SOFTWARE FOLDER

mkdir -p ~/software/atlassian
cd ~/software/atlassian

1. INSTALL JAVA

http://download.oracle.com/otn-pub/java/jdk/7u40-b43/jdk-7u40-linux-x64.tar.gz
tar xvfz jdk*
mv jdk1.7.0_40 /usr/share

#### SET JAVA_HOME
emacs ~/.bash_profile
    export JAVA_HOME=/usr/share/jdk1.7.0_40


2. INSTALL POSTGRESQL

http://www.ubuntugeek.com/how-to-install-postgresql-9-2-on-ubuntu-server-using-ppa.html

#### INSTALL DEPENDENCIES
sudo apt-get install libpq-dev

#### ADD PPA
sudo add-apt-repository ppa:pitti/postgresql

#### UPDATE APT-GET
sudo apt-get update

#### INSTALL POSTGRESQL
sudo apt-get install postgresql-9.2

#### SET PASSWORD
sudo -u postgres psql postgres

\password postgres
    open4annai

#### EXIT postgres PROMPT
Control + D


3. CREATE JIRA DATABASE

LOGIN 
sudo -s -H -u postgres

#### DROP jirauser USER IF ALREADY CREATED
sudo -u postgres dropuser jirauser

#### CREATE JIRA USER
sudo -u postgres createuser -S -d -r -P -E jirauser

Enter password:
    open4annai

  -S, --no-superuser        role will not be superuser (default)
  -d, --createdb            role can create new databases
  -r, --createrole          role can create new roles
  -P, --pwprompt            assign a password to new role
  -E, --encrypted           encrypt stored password


#### CONFIRM JIRA ROLE
sudo -u postgres psql -tAc "SELECT 1 FROM pg_roles WHERE rolname='jirauser'"
    1

sudo -u postgres psql -tAc "SELECT * FROM pg_roles WHERE rolname='jirauser'"
    jirauser|f|t|t|t|f|t|f|-1|********|||16386


#### DROP jira DATABASE IF EXISTS
sudo -u postgres dropdb jira

#### CREATE jira DATABASE
sudo -u postgres createdb --owner jirauser --encoding utf8 jira


4. INSTALL JIRA

https://confluence.atlassian.com/display/ATLAS/Dragons+Stage+1+-+Install+JIRA

ON CONFLUENCE SERVER:

cd /ubuntu/software/atlassian
sudo ./atlassian-jira-6.0.8-x64.bin

    OK

    Installation Directory: /opt/atlassian/jira 
    Home Directory: /var/atlassian/application-data/jira 
    HTTP Port: 8080 
    RMI Port: 8005 


5. BROWSE TO JIRA

**** OPEN TCP PORT 8080 IN AWS CONSOLE ****

ec2-204-236-179-50.us-west-1.compute.amazonaws.com:8080
    
Application Title   Annai Systems
Mode                Public
Base URL            http://ec2-204-236-179-50.us-west-1.compute.amazonaws.com:8080


6. INSTALL JIRA-AGILE AND JIRA-CAPTURE

Your trial is expiring on 21/Oct/13: buy a license (unknown price) for this add-on.


http://blogs.atlassian.com/2013/08/renaming-greenhopper-and-bonfire/

I’m Dan on the JIRA/JIRA Agile marketing team. JIRA with JIRA Agile (formerly GreenHopper) makes it easy to be agile in your organization. We use the term “issue” generically as JIRA can have many different types of issues (bug, task) as well as the agile issue types (story, epic).

We have a simple workflow that’s designed for agile teams:

https://confluence.atlassian.com/display/AGILE/Using+JIRA+Agile+Simplified+Workflow

Also, our workflow is customizable for teams that want to have special states in their agile workflow.

We have an introduction to Scrum and Kanban with JIRA if you’d like to see how teams use JIRA for agile development:

http://www.youtube.com/watch?v=57xYGGbBemE

Finally, we have a collection of tips on how to be more agile:

https://www.atlassian.com/agile/ 



7. SET UP JIRA

https://confluence.atlassian.com/display/ATLAS/Dragons+Stage+1+-+Install+JIRA#DragonsStage1-InstallJIRA-Step4.InstallJIRA

Now you can run JIRA's Setup Wizard and then enable some JIRA features that are required for the later stages in this integration procedure.

If JIRA didn't open automatically in your browser, go to your web browser and type this address: http://localhost:8080.
The JIRA Setup Wizard will start. It guides you through the process of setting up your JIRA server and creating an administration user. Detailed instructions are in the JIRA documentation. Below are the things you need to know for our Dragon Quest.

Choose your server language.
Enter the following information to configure the database connection:
Database Connection: External
Database Type: PostgreSQL
Hostname – Enter the name or IP address of the server where you installed your PostgreSQL database: localhost
Port – Enter the default port that you set up for PostgreSQL: 5432
Database – This is the name of the database that you created in step 3 above: jira
Username – This is the user you created in step 3 above: jirauser
Password – Enter the password you chose in step 3 above.
Schema – Leave this at the default setting: public
Click the Test Connection button to test the connection settings.
When you have a working connection, click Next.
Enter the following application properties:
Application Title: My company JIRA
Mode – Accept the default mode: Public
Base URL – Enter the full website address at which JIRA is running, not just 'localhost'. For example, if your computer name is 'coopers' then the base URL should be: http://coopers:8080. Or specify a website address, such as http://www.foobar.com:8080.
License Key – If you do not already have a JIRA license, follow the prompts on the setup wizard screen to get an evaluation license key.
Click Next.
Specify the administrator account. This will be your JIRA super user:
Username: charlie
Password – Enter a password for the administrator account and enter it again to confirm it.
Full name: Charlie of Atlassian
Email – We recommend that you give your own email address here.
Click Next.
Email notifications – For the purposes of the Atlassian Dragon Quest, we recommend that you leave email notifications disabled. This is the default setting.
Click Finish.

You are logged in to JIRA with the username charlie  and a wizard window opens.

Click I'll skip this to close the wizard and perform the following configuration steps:

SET JIRA GENERAL CONFIGURATION

Allow unassigned issues and check that the remote API is enabled:

Click Administration in the top navigation bar.
Click System > General Configuration in the top menu.
Enter your password as prompted, to confirm that you want administrator access. (Note that the Atlassian applications will request this confirmation at various steps in the process. This guide will not mention this step again.)
Click Edit Configuration.
Select the ON radio button next to Allow unassigned issues.
Check that the ON radio button is selected next to Accept remote API calls. It is on by default.
Click Update.

ADD GROUPS

Add the groups that you will need later for Confluence and Bamboo:
Click Users > Groups in the top menu.

In the Add Group section, enter a group name of 'confluence-users' and click Add Group.
Add the following two groups as well:
confluence-administrators
bamboo-admin
Make Charlie of Atlassian  a user and administrator in Confluence and Bamboo by adding him to the relevant groups:
Click Bulk Edit Group Members.
In the left-hand box, select the three groups:
bamboo-admin
confluence-administrators
confluence-users
In the right-hand box under Add members to selected group(s), enter the username: charlie
Click Join. Charlie's name will appear in the middle box as a group member of the selected groups.


8. CREATE A JIRA PROJECT


In this step you will create some data in JIRA, including a project and an issue, for use in the subsequent stages of this integration procedure. Then you will create your own JIRA dashboard with a couple of gadgets. For this procedure, you need to be logged in as JIRA Admin.

CREATE PROJECT

Create a project in JIRA:
Click Projects > Projects in the top menu.
Hint: Try JIRA's quick search instead of the menus. Press g g on your keyboard then start typing 'projects' into the Administration Search box. If you like, you can use the quick search from this point onwards.
Click Add Project.

PROJECT --> ADMINISTRATION

Enter the following information:
Name: Dragons
Key: DRA
Click Add.
Add two versions (1.0 and 2.0):
Click Versions in the left-hand panel of the Dragons project screen.
Enter the following information, then click Add:
Name: 1.0
Description: Version 1.0
Do the same for Version 2.0.

CREATE AN ISSUE FOR THE PROJECT

Add an issue to your project:
Click Exit Administration at the top of the administration screen
The dashboard will appear. Click Create Issue at the top of the dashboard.
Enter the following information about your new issue:
Project: Dragons
Issue Type: Bug
Summary: Dragon slayer's equipment is defective
Affects Version/s: 1.0
Assignee – Click Assign to Me, which will assign this task to Charlie of Atlassian.

Description: There's a hole in the dragon slayer's water bucket
Original Estimate: 1d
Click Create. You now have an issue with a key of 'DRA-1'. Click the issue key and take a look at your new issue.

CREATE A DASHBOARD FOR THE PROJECT

Create a new dashboard for all your dragon-related tasks, issues and general fire fighting:
Click Dashboards > Manage Dashboards at top left of your JIRA screen.
Click Create new dashboard.
The Create New Dashboard screen appears. Enter the following information:
Name: Dragon Development Dashboard
Description: A dashboard for dragon slayers, fire fighters and like-minded brave souls
Leave the other fields at their default values and click the Add button at the bottom of the 'Create New Dashboard' screen (not the one next to 'Add Shares').
Click on the dashboard name to edit it. You can now add gadgets.

ADD A GADGET TO THE DASHBOARD

Click Add Gadget.
The 'Gadget Directory' will appear, showing a list of the available gadgets for your JIRA dashboard. Enter 'projects' into the search box at top right of the gadget directory.
The list of gadgets will change, to show only the gadgets that match your search term. Find the 'Projects' gadget and click Add it Now. The gadget will be highlighted for a short time and the button's wording will change to 'Adding', while JIRA adds the gadget to the dashboard.
Find and add the 'Assigned To Me' gadget in the same way.
Click Finished to go back to your dashboard.
Drag the 'Assigned to Me' gadget to the top right of your dashboard:
Move your mouse pointer over the gadget's blue title bar.
The cursor icon will change to a four-pointed arrow  (or a hand). Click the gadget title bar with the left mouse button then drag the gadget to the right. Drop it in the space labelled 'Drag your gadget here.'
Configure the 'Projects' gadget to point to your 'Dragons' project: 
Select 'Dragons' from the Projects list.
Leave the default values as configured for View and Number of Columns.
Click the dropdown arrow next to Refresh Interval and select Every 15 Minutes.
Click Save.
Configure the 'Assigned to Me' gadget:
Leave the default values as configured for Number of Results and Fields to display.
Click the dropdown arrow next to Refresh Interval and select Every 15 Minutes.
Click Save.




NOTES
-----

sudo -u postgres createuser --help
createuser creates a new PostgreSQL role.

Usage:
  createuser [OPTION]... [ROLENAME]

Options:
  -c, --connection-limit=N  connection limit for role (default: no limit)
  -d, --createdb            role can create new databases
  -D, --no-createdb         role cannot create databases (default)
  -e, --echo                show the commands being sent to the server
  -E, --encrypted           encrypt stored password
  -i, --inherit             role inherits privileges of roles it is a
                            member of (default)
  -I, --no-inherit          role does not inherit privileges
  -l, --login               role can login (default)
  -L, --no-login            role cannot login
  -N, --unencrypted         do not encrypt stored password
  -P, --pwprompt            assign a password to new role
  -r, --createrole          role can create new roles
  -R, --no-createrole       role cannot create roles (default)
  -s, --superuser           role will be superuser
  -S, --no-superuser        role will not be superuser (default)
  -V, --version             output version information, then exit
  --interactive             prompt for missing role name and attributes rather
                            than using defaults
  --replication             role can initiate replication
  --no-replication          role cannot initiate replication
  -?, --help                show this help, then exit

Connection options:
  -h, --host=HOSTNAME       database server host or socket directory
  -p, --port=PORT           database server port
  -U, --username=USERNAME   user name to connect as (not the one to create)
  -w, --no-password         never prompt for password
  -W, --password            force password prompt
    
</entry>
<entry [Tue 2013:06:11 19:18:53 EST] HOW TO CREATE A BLUEPRINT - SIMPLE INPUT DIALOG>


https://developer.atlassian.com/display/CONFDEV/Writing+a+Blueprint


    
</entry>
<entry [Tue 2013:06:11 19:03:59 EST] INSTALL ALL ATLASSIAN ON ONE SERVER>


**** SEE FULL INSTALL DETAILS ****
[Sat 2013:09:07 19:20:59 EST] INSTALLED JIRA AND BAMBOO ON CONFLUENCE INSTANCE
**** SEE FULL INSTALL DETAILS ****


https://confluence.atlassian.com/display/ATLAS/Here+Be+Dragons

https://confluence.atlassian.com/display/DOC/Installing+Confluence+and+JIRA+Together


SECTION 9 - CONNECT TO JIRA
https://confluence.atlassian.com/display/DOC/Confluence+Setup+Guide


</entry>
<entry [Tue 2013:06:11 03:38:38 EST] DOWNLOADED COMPOSITION PLUGIN LICENSE>


http://marketplace.servicerocket.com/cart.html?itemType=product&options.type=evaluation&options.users=Unlimited&quantity=1&action=add&itemId=62


    
</entry>
<entry [Tue 2013:06:11 03:21:02 EST] CONFLUENCE 5 STYLESHEETS>

1. LOG IN AS 'sysadmin' USER (**NOT** admin USER)

LEFT NAV BAR --> Space Admin --> Look & Feel --> Stylesheets

/* MOVE UP AGUA NEWS IMAGE */
.cell-aside .wiki-content .confluence-embedded-image {
    margin-top: -20px;
}

/* HIDE CHILDREN SECTION AT BOTTOM OF PAGE */
#children-section, #children-section-title {
    display: none !important;
    visibility: invisible !important;
}

/* REDUCE NAVIGATION LIST INDENT */
div.plugin_spacetree {
    margin-left: -10px !important;
}
    
div.plugin_spacetree ul.plugin_spacetree_children_list {
    list-style-type: none;
    -webkit-padding-start: 10px !important;
}

/* HID BLOG SUB-HEADING */
.blog-post-list .sub-heading {
    color: red !important;
    /*visibility: invisible;*/
}


    
</entry>
<entry [Tue 2013:06:11 03:15:21 EST] NAVITABS CSS>

<!--

<div id="theme-header">
    <div class="aui-tabs horizontal-tabs">
    	<ul class="tabs-menu" style=" ">
            <li class="menu-item active-tab">
				<a href="http://ec2-23-20-108-109.compute-1.amazonaws.com:8090/pages/viewpage.action?pageId=8814594"><strong>HowTo</strong></a>
			</li>
            <li class="menu-item">
				<a href="http://ec2-23-20-108-109.compute-1.amazonaws.com:8090/pages/viewpage.action?pageId=10158094"><strong>ChildTab1</strong></a>
			</li>
            <li class="menu-item">
				<a href="http://ec2-23-20-108-109.compute-1.amazonaws.com:8090/pages/viewpage.action?pageId=10158096"><strong>ChildTab2</strong></a>
			</li>
        </ul>
    <div class="tabs-pane active-pane">
		
	</div>
	</div>

-->
    
</entry>
<entry [Tue 2013:06:11 01:40:30 EST] CONFLUENCE PAGES>


Agua 0.8.0-beta.1 released

Skip to end of sidebar
Blog Posts: December 2012

Agua 0.8.0-beta.1 released
Go to start of sidebar
Skip to end of metadataGo to start of metadata
Features:

Drag and drop workflows - use preconfigured workflows or easily create your own custom workflows
Generate custom on-demand EC2 clusters using StarCluster for your specific computing needs
Real-time visualization of analysis results using JBrowse genomic viewer
Easily view, upload and download your data files using the desktop-style 'Folders' panel
Multi-user platform allows teams to view, share and copy workflows
Archive snapshots of your workflows to your GitHub account
Share/publish a versioned 'biorepository' of your workflows on your GitHub account
    


</entry>
<entry [Tue 2013:06:11 01:21:08 EST] INSTALLED NAVITABS PLUGIN ON 5.1.3>

http://www.bitvoodoo.ch/plugins/confluence-navitabs-plugin.html

PROBLEM

TRIED TO INSTALL NAVITABS PLUGIN:

CONFLUENCE ADMIN --> Find Add-Ons --> Search: navitabs --> INSTALL

GET THIS ERROR:

The system attempted to connect to http://ec2-54-243-20-133.compute-1.amazonaws.com:8090/rest/plugins/1.0/pending/2b0b7496-82e2-4bc3-96f2-83f3b9ad92f2 to retrieve the status of your operation, but failed. This may indicate a problem with the base URL configuration of your instance. Try refreshing the page to see if the operation completed, and see the UPM documentation for more details about this error.


DIAGNOSIS:

SYSTEM IS USING THE EXTERNAL IP OF THE OLD CONFLUENCE-4 INSTANCE WHICH WAS CONTAINED IN THE RESTORED FILE


SOLUTION:

1. CHANGE BASE URL

Confluence Admin --> General Administration --> Server Base Url: ec2-23-20-108-109.compute-1.amazonaws.com:8090


2. ADD {navitabs} TO ALL PAGES

Confluence Admin --> Themes --> Document Theme --> Manage Theme --> ADD TO HEADER:

{navitabs:includeroot=true}


3. CLICK ON 'REGISTER' LINK THAT APPEARS WHEN PAGE IS RELOADED

    OK


NOTES
-----

{navitabs}
The navitabs macro provides the following modes of which only one can be active at a time:
Children (Default): generates tabs for all child-pages of current/specified page.
Labels: generates tabs based on the specified labels.

Examples
Display all child-pages of a page as tabs:
{navitabs}


If you want the navitabs on the child-pages as well, place the following wiki syntax on every child-pages:
{navitabs:root=parentpage}


Display the tabs vertically:
{navitabs:vertical=true|root=parentpage}


Display the tabs vertically with the page content in the macro body:
{navitabs:vertical=true|root=Home|includeroot=true|firsttab=Home}Write the actual content of the page here...{navitabs}


Generate tabs of pages containing the label cats or dogs from the space animals:
{navitabs:labels=cats,dogs|spacekey=animals|includeroot=true|firsttab=Home}


Parameters
Parameter	Mandatory	Default	Mode	Description
usewithoutbody	no	false	Label/Children	enable, if you use the macro with an empty macro body
vertical	no	false (horizontal)	Label/Children	generates the tabs vertically if true
width	no	120	Label/Children	the width of the vertical tabs in px
root	no	current page	Children	generates tabs for all child-pages/descendants of the root-page, leave blank for current page, use @parent for parent page (only in children mode)
includeroot	no	false	Children	adds an additional tab for the root-page itself (only in children mode)
firsttab	no	–	Label/Children	defines the very first tab to be generated. Useful for a e.g. a home-page
depth	no	1	Children	depth of child-pages/descendants for which tabs are generated (only in children mode)
sort	no	false	Children	if tabs should be sorted alphabetically (only in children mode)
sortbylabel	no	false	Label	tabs are sorted alphabetically by default in label mode, use "true" for sorting alphabetically by label or explicitly set to "false" for natural sorting by label (only in label mode)
reverse	no	false	Children	if the sort order should be reversed (only in children mode)
label
labels	no	–	Label	one or several (comma separated) labels. Generate tabs for pages containing this label. Tabs are sorted alphabetically. Setting this parameter disables the children mode
spacekey	no	all spaces	Label	use only pages from this space (only in label mode)
ltrunc	no	0	Label/Children	the number of characters to be truncated from the left of every tab
ltruncfirsttab	no	true	Label/Children	if the left truncation should be applied to the "firsttab" as well

    
</entry>
<entry [Tue 2013:06:11 00:09:29 EST] RESTORED 4.3.5 SPACE BACKUP ONTO 5.1.3>

SUMMARY

-   START TEMPORARY INSTANCE
-   INSTALL CONFLUENCE 4.3.5 ON TEMPORARY INSTANCE
-   RESTORE SPACE FROM BACKUP FILE ONTO 4.3.5
-   UPGRADE CONFLUENCE TO 5.1.3
-   EXPORT SPACE
-   RESTORE TO 5.1.3

START TEMPORARY INSTANCE
------------------------

STARTED 'CONFLUENCE-4' INSTANCE

SEE [Tue 2013:06:11 00:25:17 EST] LAUNCHED 'CONFLUENCE-4' TO INSTALL CONFLUENCE 4.3.5

EXTERNAL IP:
ec2-184-73-35-56.compute-1.amazonaws.com


INSTALL CONFLUENCE 4.3.5 ON TEMPORARY INSTANCE
----------------------------------------------

1. DOWNLOADED CONFLUENCE 4.3.5

mkdir -p /apps/confluence
cd /apps/confluence
wget http://www.atlassian.com/software/confluence/downloads/binary/atlassian-confluence-4.3.5-x64.bin


2. INSTALL CONFLUENCE

chmod 755 atlassian-confluence-4.3.5-x64.bin 
./atlassian-confluence-4.3.5-x64.bin 

    OK
    
3. CHECK RUNNING ON PORT 8090

ec2-184-73-35-56.compute-1.amazonaws.com:8090
    OK


4. GET LICENSE

LOGIN TO atlassian.com

INPUT SERVER ID: BO6X-I88E-EMLX-LWOG

LICENSE:

AAABCA0ODAoPeNptkEtLxDAUhff5FQHXkaajbS1koW0ZKmkrtuIIbmK8MwY6acmjOP/ezoyvERcX7
uMcvsM96zzgW68xpTiI08VVeknxsupwGNAFysFKo0anBs2yQa97D1rCc4qLSfRe7PcoM3BocuGA7
V0kiAilSM76cyGdmoA54wH9eI7zQcCVBG2h241Qiy2wrKmq4j4rrzmqhNIOtJiJxfuozO4XIf4m1
H77AqZZZ723Dkw9vIJlAWrMRmhlj7jWeWEcfhq83qAWzASmzNlNE61ImSQFKSq+IvyxWaK2qNlch
IcRjS/CBH3mm+W8zE8uJ/QHC8YyQr/0/we+80a+CQt/X/UBnkF8jjAsAhQTziYJG46GFwmZQVvLr
oHosjoVFAIUEs5LNLScXAVPGWvi9PPdtsRLoUw=X02dh


5. SETUP OPTIONS

EVALUATION INSTALLATION

    
    
    OK


RESTORED SPACE
--------------

CONFLUENCE ADMIN --> Administration --> Backup & Restore --> Upload and Restore

/home/syoung/notes/backup/confluence/confluence-4.3.5-xmlexport-20130101-073122-2.zip



    BUT THE RESTORED SPACE IS ALSO MISSING THE CHILD PAGES!!!!
    
    **** STOPPED HERE ****
    

UPGRADED TO 5.1.3
-----------------

When prompted to choose between creating a new Confluence installation or upgrading an existing installation, choose the 'Upgrade an existing Confluence installation' option.




</entry>
<entry [Mon 2013:06:10 23:00:19 EST] INSTALLED CONFLUENCE 5.1.3 ON EC2 m1.large INSTANCE ('CONFLUENCE-5')>

http://www.atlassian.com/software/confluence/downloads/binary/atlassian-confluence-5.1.3-x64.bin

1. STARTED m1.large INSTANCE

SEE [Mon 2013:06:10 22:43:08 EST] RESTARTED NEW AGUA INSTANCE AND INSTALLED CONFLUENCE 5.1.3


2. INSTALLED CONFLUENCE

mkdir /confluence-data
mkdir /confluence
cd /confluence

wget http://www.atlassian.com/software/confluence/downloads/binary/atlassian-confluence-5.1.3-x64.bin
chmod 755 atlassian-confluence-5.1.3-x64.bin
./atlassian-confluence-5.1.3-x64.bin

    Unpacking JRE ...
    Starting Installer ...
    Jun 11, 2013 5:47:45 AM java.util.prefs.FileSystemPreferences$1 run
    INFO: Created user preferences directory.
    
    This will install Confluence 5.1.3 on your computer.
    OK [o, Enter], Cancel [c]
    o
    Choose the appropriate installation or upgrade option.
    Please choose one of the following:
    Express Install (uses default settings) [1], Custom Install (recommended for advanced users) [2, Enter], Upgrade an existing Confluence installation [3]
    2
    
    Where should Confluence 5.1.3 be installed?
    [/opt/atlassian/confluence]
    
    Default location for Confluence data
    [/var/atlassian/application-data/confluence]
    
    Configure which ports Confluence will use.
    Confluence requires two TCP ports that are not being used by any other
    applications on this machine. The HTTP port is where you will access
    Confluence through your browser. The Control port is used to Startup and
    Shutdown Confluence.
    Use default ports (HTTP: 8090, Control: 8000) - Recommended [1, Enter], Set custom value for HTTP and Control ports [2]
    
    Confluence can be run in the background.
    You may choose to run Confluence as a service, which means it will start
    automatically whenever the computer restarts.
    Install Confluence as Service?
    Yes [y, Enter], No [n]
    y
    
    Extracting files ...
                                                                               
    
    Please wait a few moments while Confluence starts up.
    Launching Confluence ...

    Installation of Confluence 5.1.3 is complete
    Your installation of Confluence 5.1.3 is now ready and can be accessed via
    your browser.
    Confluence 5.1.3 can be accessed at http://localhost:8090
    Finishing installation ...


3. OPENED PORTS

HTTP    8090
Control 8000

ec2-authorize default -p 8090 -P tcp
ec2-authorize default -p 8090 -P udp
ec2-authorize default -p 8000 -P tcp
ec2-authorize default -p 8000 -P udp

   
4. VERIFIED INSTALLATION

BROWSER:

ec2-23-20-108-109.compute-1.amazonaws.com:8090

    OK
 
 
5.  GENERATED EVALUATION LICENSE KEY

https://my.atlassian.com/license/evaluation?licensefieldname=licenseString&product=Confluence&ref=prod&sid=BSS7-16Q2-HNRV-83I8&callback=http%3A%2F%2Fec2-23-20-108-109.compute-1.amazonaws.com%3A8090%2Fsetup%2Fsetuplicense.action&build=4226&version=5.1.3


SERVER ID: BSS7-16Q2-HNRV-83I8
ORGANISATION: Stuart Young

LICENSE KEY:

AAABBw0ODAoPeNptkG1LwzAQx9/nUwR8HWlW1tVBXmhbtNIHXasg+CbG2wx0abkkxX17u82niXAH9
/C/+x131nqgt95QzmkwX84Xk9HrsqWzgIckBatQD073RiS9WXcejILnJc1G2Xm5r5ME4RCk0oHYT
7EgYpwTNenPpXJ6BOHQA/mZOeYHQaEVGAvtboBKbkEkdVlmqyS/LEgptXFg5ETM3geNu1+ExTeh8
tsXwHqddN46wKp/BSsCUuNGGm2PuMZ5iY4+9d5sSAM4AuapuGqaaU10P2M31eqRxWEekyarxOSsm
EU8uohD8nnfJC/y9KRzQn+wgFYw/qX//+A7j+pNWvj7qg98vnxDMCwCFHC96tkmnC2CYia8W/iua
2uH2YvRAhRs+0A+cTGiuLEtuf4MkFWTgygnwA==X02dh


6. INSTALLATION OPTION SELECTIONS

PRODUCTION INSTALLATION

EXTERNAL DATABASE: MYSQL


7. INSTALLED CONFLUENCE MYSQL DRIVER

https://confluence.atlassian.com/display/CONF51/Database+JDBC+Drivers

DOWNLOAD TO LAPTOP:

mkdir /home/syoung/software/confluence
cd /home/syoung/software/confluence


UPLOAD TO CONFLUENCE-5:

cd /home/syoung/notes/agua/keypair/syoung/ec2
scp -i aquarius5-keypair.pem /home/syoung/software/confluence/mysql-connector-java-5.1.25.tar.gz root@ec2-23-20-108-109.compute-1.amazonaws.com:


INSTALL ON CONFLUENCE-5:

https://confluence.atlassian.com/display/CONF51/Database+Setup+For+MySQL#DatabaseSetupForMySQL-driverdownload

UNZIP AND COPY JAR FILE TO < Confluence installation>/confluence/WEB-INF/lib 

cd /root
mv mysql-connector-java-5.1.25.tar.gz /confluence
cd /confluence
tar xvfz mysql-connector-java-5.1.25.tar.gz
cp /confluence/mysql-connector-java-5.1.25/mysql-connector-java-5.1.25-bin.jar \
/opt/atlassian/confluence/confluence/WEB-INF/lib


RESTART CONFLUENCE:

/opt/atlassian/confluence/bin/shutdown.sh
/opt/atlassian/confluence/bin/startup.sh

    OK

ps aux | grep confluence
    root     12142 82.7  4.3 1130680 329380 pts/0  Sl   06:21   0:21 /opt/atlassian/confluence/jre//bin/java -Djava.util.logging.config.file=/opt/atlassian/confluence/conf/logging.properties -Xms256m -Xmx512m -XX:MaxPermSize=256m -Djava.awt.headless=true -Djava.util.logging.manager=org.apache.juli.ClassLoaderLogManager -Djava.endorsed.dirs=/opt/atlassian/confluence/endorsed -classpath /opt/atlassian/confluence/bin/bootstrap.jar -Dcatalina.base=/opt/atlassian/confluence -Dcatalina.home=/opt/atlassian/confluence -Djava.io.tmpdir=/opt/atlassian/confluence/temp org.apache.catalina.startup.Bootstrap start



8. CONTINUE INSTALLATION OPTION SELECTIONS

MYSQL --> EXTERNAL DATABASE


9. SET UP MYSQL confluence DATABASE AND USER

CREATE USER 'confluence'@'localhost' IDENTIFIED BY 's****';
CREATE DATABASE confluence;
GRANT ALL PRIVILEGES ON confluence.* TO 'confluence'@'localhost';


10. INPUT USERNAME AND PASSWORD INTO WEB INSTALLER


DRIVER CLASS NAME: com.mysql.jdbc.Driver
DATABASE URL: jdbc:mysql://localhost/confluence?sessionVariables=storage_engine%3DInnoDB
USERNAME: confluence
PASSWORD: s****


11. RESTORED FROM BACKED UP CONFLUENCE 4 FILE

/home/syoung/notes/backup/confluence/confluence-4.3.5-xmlexport-20130101-073122-2.zip

    OK

    Home, GetIt, Develop SPACES PRESENT BUT ONLY ROOT PAGE - CHILD PAGES ARE EMISSING

    

12. LOGGED IN AS ADMIN

USER: admin
PASS: b****

    OK
    
USER: sysadmin
pass: "****
    
    
    
13. FIXED bitvoodoo NAVITABS ERROR

PROBLEM

ERROR MESSAGE AT TOP OF PAGE:

! Please use the one-click registration to enable your bitvoodoo plugins.


SOLUTION

http://www.bitvoodoo.ch/plugins/confluence-navitabs-plugin.html








</entry>
<entry [Fri 2013:05:31 00:19:10 EST] JIRA API - OAUTH AUTHENTICATION>


https://developer.atlassian.com/display/JIRADEV/JIRA+REST+API+Example+-+OAuth+authentication

JIRA REST API Example - OAuth authentication

Added by Felix Schmitz [Atlassian], last edited by Mary Anthony [Atlassian] on Jan 11, 2013 Go to start of metadata

JIRA 5.0 and later.

This tutorial describes how to use a Java client to provide OAuth authentication when making requests to JIRA's REST endpoints. It assumes you are familiar with the OAuth terminology (e.g. Consumer, Service Provider, request token, access token, etc.). For more information about OAuth refer to the OAuth specification.

Looking for a Provider in a Language other than Java?
Atlassian provides samples of OAuth providers in a number of other languages. Visit the sample repo on Bitbucket to download and work with these samples.
 

Step 1: Configuring JIRA
The first step is to register a new consumer in JIRA. This is done through the Application Links administration screens in JIRA. Create a new Application Link. 
When creating the Application Link use a placeholder URL or the correct URL to your client, if your client can be reached via HTTP and choose the Generic Application type. After this Application Link has been created, edit the configuration and go to the incoming authentication configuration screen and select OAuth. Enter in this the public key and the consumer key which your client will use when making requests to JIRA.
After you have entered all the information click OK and ensure OAuth authentication is enabled.

Step 2: Configuring the client
Your client will require the following information to be able to make authentication requests to JIRA.

OAuth Config

value

request token url

JIRA_BASE_URL + "/plugins/servlet/oauth/request-token"

authorization url

JIRA_BASE_URL + "/plugins/servlet/oauth/authorize""

access token url

JIRA_BASE_URL + "/plugins/servlet/oauth/access-token"

oauth signing type

RSA-SHA1

consumer key

as configured in Step 1

Example Java OAuth client
This example java code demonstrates how to write a client to make requests to JIRA's rest endpoints using OAuth authentication.
To be able to use OAuth authentication the client application has to do the "OAuth dance" with JIRA. This dance consists of three parts.

Obtain a request token
Ask the user to authorize this request token
Swap the request token for an access token
After the client application has a valid access token, this can be used to make authenticated requests to JIRA.

Configuring JIRA and downloading the example client
This example client is using the consumer key "hardcoded-consumer" and the public key is:

MIIBIjANBgkqhkiG9w0BAQEFAAOCAQ8AMIIBCgKCAQEAxZDzGUGk6rElyPm0iOua0lWg84nOlhQN1gmTFTIu5WFyQFHZF6OA4HX7xATttQZ6N21yKMakuNdRvEudyN/coUqe89r3Ae+rkEIn4tCxGpJWX205xVF3Cgsn8ICj6dLUFQPiWXouoZ7HG0sPKhCLXXOvUXmekivtyx4bxVFD9Zy4SQ7IHTx0V0pZYGc6r1gF0LqRmGVQDaQSbivigH4mlVwoAO9Tfccf+V00hYuSvntU+B1ZygMw2rAFLezJmnftTxPuehqWu9xS5NVsPsWgBL7LOi3oY8lhzOYjbMKDWM6zUtpOmWJA52cVJW6zwxCxE28/592IARxlJcq14tjwYwIDAQAB
You have to create an Application Link as described in Step 1 above and use this consumer key and the public key and leave the callback URL field empty.

Download the attached jar files:

 	File	Modified
Java Source rest-oauth-client-1.0.one-jar.jar	Sep 27, 2011 by Felix Schmitz [Atlassian]
Java Source rest-oauth-client-1.0-sources.jar	Sep 27, 2011 by Felix Schmitz [Atlassian]
Download All

The rest-oauth-client-1.0.one-jar.jar contains the sample client and the rest-oauth-client-1.0-sources.jar contains the source code.

1. Obtain a request token from JIRA
Execute this command:

java -jar rest-oauth-client-1.0.one-jar.jar requestToken JIRA_BASE_URL CALLBACK_URL
Replace JIRA_BASE_URL with the URL to your JIRA instance and replace CALLBACK_URL with the URL that should be called after the user has authorized the OAuth request token.
After executing this command you should see a response like

Token is W9QuE8hba6laXm2RcPGANVusKHnXUJcx
Token secret is rx4T2R3ax7an3H0vJLq9XB9DOP3aiNMl
Retrieved request token. go to http://localhost:8090/jira/plugins/servlet/oauth/authorize?oauth_token=W9QuE8hba6laXm2RcPGANVusKHnXUJcx
2. Authorize this token
Go to the URL in system out and login into JIRA and approve the access. Afterwards JIRA will say that you have successfully authorised the access. It mentions a verification code which we need for the next step.

3. Swap the request token with an access token
Execute the following command

java -jar rest-oauth-client-1.0.one-jar.jar accessToken JIRA_BASE_URL REQUEST_TOKEN TOKEN_SECRET VERIFIER
Replace JIRA_BASE_URL, REQUEST_TOKEN, TOKEN_SECRET and VERIFIER with the correct values.

In the response you should see

Access token is : QddAGsDSS0FkXCb1zRCCzzeShZRnUXYH
This access token will allow you to make authenticated requests to JIRA.

4. Make an authentication request to a rest-end point
To make an authenticated request to a rest resource in JIRA execute this command:

java -jar rest-oauth-client-1.0.one-jar.jar request ACCESS_TOKEN JIRA_REST_URL
Replace ACCESS_TOKEN, JIRA_REST_URL and ISSUE_KEY with the correct values.
JIRA_REST_URL, e.g. http://localhost:8090/jira/rest/api/2/issue/HSP-1
This will return the issue JSON object for the issue with the key "HSP-1"

You should see a response like:

{
"expand": "html,names,schema",
"id": "10000",
"self": "http://localhost:8090/jira/rest/api/2/issue/HSP-1",
"key": "HSP-1",
"fields": {
"summary": "Bug due two weeks ago",
"issuetype": {
"self": "http://localhost:8090/jira/rest/api/2/issuetype/1",
"id": "1",
"description": "A problem which impairs or prevents the functions of the product.",
"iconUrl": "http://localhost:8090/jira/images/icons/bug.gif",
"name": "Bug",
"subtask": false
},
"status": {
"self": "http://localhost:8090/jira/rest/api/2/status/5",
"iconUrl": "http://localhost:8090/jira/images/icons/status_resolved.gif",
"name": "Resolved",
"id": "5"
},
"labels": [(0)],
"votes": {
"self": "http://localhost:8090/jira/rest/api/2/issue/HSP-1/votes",
"votes": 0,
"hasVoted": false
},
"assignee": {
"self": "http://localhost:8090/jira/rest/api/2/user?username=admin",
"name": "admin",
"emailAddress": "admin@example.com",
"avatarUrls": {
"16x16": "http://localhost:8090/jira/secure/useravatar?size=small&avatarId=10062",
"48x48": "http://localhost:8090/jira/secure/useravatar?avatarId=10062"
},
"displayName": "Administrator",
"active": true
},
"resolution": {
"self": "http://localhost:8090/jira/rest/api/2/resolution/1",
"id": "1",
"description": "A fix for this issue is checked into the tree and tested.",
"name": "Fixed"
},
"fixVersions": [(0)],
"security": null,
"resolutiondate": "2011-09-26T15:44:39.220+1000",
"sub-tasks": [(0)],
"reporter": {
"self": "http://localhost:8090/jira/rest/api/2/user?username=admin",
"name": "admin",
"emailAddress": "admin@example.com",
"avatarUrls": {
"16x16": "http://localhost:8090/jira/secure/useravatar?size=small&avatarId=10062",
"48x48": "http://localhost:8090/jira/secure/useravatar?avatarId=10062"
},
"displayName": "Administrator",
"active": true
},
"project": {
"self": "http://localhost:8090/jira/rest/api/2/project/HSP",
"id": "10000",
"key": "HSP",
"name": "homosapien",
"roles": {},
"avatarUrls": {
"16x16": "http://localhost:8090/jira/secure/projectavatar?size=small&pid=10000&avatarId=10011",
"48x48": "http://localhost:8090/jira/secure/projectavatar?pid=10000&avatarId=10011"
}
},
"versions": [(0)],
"environment": null,
"created": "2011-09-26T15:44:23.888+1000",
"updated": "2011-09-26T15:44:39.295+1000",
"priority": {
"self": "http://localhost:8090/jira/rest/api/2/priority/5",
"iconUrl": "http://localhost:8090/jira/images/icons/priority_trivial.gif",
"name": "Trivial",
"id": "5"
},
"description": null,
"duedate": "2011-09-25",
"components": [(1)
{
"self": "http://localhost:8090/jira/rest/api/2/component/10000",
"id": "10000",
"name": "New Component 1"
}
],
"comment": {
"startAt": 0,
"maxResults": 0,
"total": 0,
"comments": [(0)]
},
"watches": {
"self": "http://localhost:8090/jira/rest/api/2/issue/HSP-1/watchers",
"watchCount": 0,
"isWatching": false
}
},
"transitions": "http://localhost:8090/jira/rest/api/2/issue/HSP-1/transitions",
"editmeta": "TODO",
"changelog": "TODO"
}


How to add OAuth support to your client
I suggest if you want to use OAuth to make request to JIRA to find a helper library which takes care of signing the requests and reading the tokens from the response.
The example above is using the net.oauth library.

<!--
<dependencies>
        <dependency>
            <groupId>net.oauth.core</groupId>
            <artifactId>oauth</artifactId>
            <version>20090617</version>
        </dependency>
        <dependency>
            <groupId>net.oauth.core</groupId>
            <artifactId>oauth-httpclient4</artifactId>
            <version>20090617</version>
        </dependency>
</dependencies>


-->    
</entry>
<entry [Mon 2013:04:22 13:42:17 EST] USE CONFLUENCE API FOR AGUA WIKI>

https://confluence.atlassian.com/display/DISC/Perl+XML-RPC+client

Hi Greg,

Here's the URL for the confluence API of the Services wiki:

https://ukch-confluence.illumina.com/rest/prototype/1/space/servicesSD

Some general docs for the Confluence API:

http://docs.atlassian.com/atlassian-confluence/REST/latest/
https://developer.atlassian.com/display/CONFDEV/Confluence+Developer+Documentation

Here are the docs for the Confluence.pm module:

https://confluence.atlassian.com/display/DISC/Perl+XML-RPC+client

I've also sent you confluence.pl as a command line script which takes the required inputs. You can run it as follows:

./confluence.pl \
--url https://ukch-confluence.illumina.com/rest/prototype/1/space \
--username gmcinnes \
--password yourPassword

... But it's only a shell right now - you'll need to add to it something like this (NB: call to 'updatePage') to upload a file:
<!--

use strict;
use Confluence;
 
my $url = "http://localhost:8080/rpc/xmlrpc";
my ($user, $pass, $spaceKey, $directory) = @ARGV;
 
die "Usage is $0 <user> <password> <spacekey> <directoryname>\n"
    unless ($spaceKey and -d $directory);
 
my $wiki = new Confluence($url, $user, $pass);
 
opendir DIR, $directory or die "Unable to access directory $directory";
chdir $directory or die "Unable to chdir to $directory";
 
while (my $filename = readdir DIR) {
    next unless -f $filename;
    my $title = $filename;
    $title =~ s/\.\w\w\w$//; # remove filename extension (.xxx)
    # read in the file
    open FILE, "<$filename" or die "Unable to open file $filename";
    my $content = join "", <FILE>;
    # create the page object
    my $newPage = {
        space => $spaceKey,
        title => $title,
        content => $content
        };
    print "loading $title\n";
    $wiki->updatePage($newPage);
    }
 
$wiki->logout();

-->    
</entry>
<entry [Thu 2013:01:31 02:56:34 EST] REMOVE THE 'created by' FROM THE END OF BLOG POSTS>


1. Open the file

em /opt/atlassian/confluence/confluence/decorators/includes/page-metadata.vm


2. Remove the following text:

<!--
                #if ($page.isLatestVersion() == true)
                    $action.getText('added.by.user.last.edited.on.date', ["#usernameLink ($page.creatorName)","#usernameLink \
($page.lastModifierName)","$action.dateFormatter.format( $page.lastModificationDate )"])
                    #set ($previousPage = $action.getPreviousVersion($page.previousVersion))
                    #if ($!previousPage)
                        <span class="noprint">&nbsp;(<a id="view-change-link" href="$req.contextPath/pages/diffpages.action?p\
ageId=${page.id}&originalId=$previousPage.id">$action.getText('view.change')</a>)</span>
                    #end
                #else
                    $action.getText('added.by.user.edited.on.date', ["#usernameLink ($page.creatorName)","#usernameLink ($pag\
e.lastModifierName)","$action.dateFormatter.format( $page.lastModificationDate )"])
                #end
-->

    
</entry>
<entry [Wed 2013:01:30 22:59:39 EST] CSS TWEAKS: HIDE CHILDREN SECTION, REDUCE NAVIGATION LIST INDENT, HIDE BLOG SUB-HEADING>

/* MOVE UP AGUA NEWS IMAGE */
.cell-aside .wiki-content .confluence-embedded-image {
    margin-top: -20px;
}

/* HIDE CHILDREN SECTION AT BOTTOM OF PAGE */
#children-section, #children-section-title {
    display: none !important;
    visibility: invisible !important;
}

/* REDUCE NAVIGATION LIST INDENT */
div.plugin_spacetree {
    margin-left: -10px !important;
}
    
div.plugin_spacetree ul.plugin_spacetree_children_list {
    list-style-type: none;
    -webkit-padding-start: 10px !important;
}

/* HID BLOG SUB-HEADING */
.blog-post-list .sub-heading {
    color: red !important;
    /*visibility: invisible;*/
}

</entry>
<entry [Wed 2013:01:30 22:55:41 EST] HOW TO WATCH A SPACE OR BLOGS>
    
    To watch an entire space: open the ‘Browse’ menu, click ‘Advanced’ and then ‘Start watching this space’.
To watch for new blog posts only, in a given space: open the ‘Browse’ menu, click ‘Advanced’ and then ‘Start watching space blogs’.


</entry>
<entry [Wed 2013:01:30 04:38:26 EST] FIX 'license has expired' ERROR WITH CUSTOMWARE COMPOSITION PLUGIN>

NOT MUCH USE:

http://community.customware.net/customware/topics/the_license_could_not_be_verified_license_certificate_has_expired


WENT TO CUSTOMWARE SITE AND 'BOUGHT' AN EVALUATION LICENSE


Confluence Admin --> CustomWare Plugins --> Composition -> Upload license

    OK!!
    

    The current license will expire in 29 days. Please arrange for a new license as soon as possible.
    
    Title:	 CustomWare Composition Plugin for Confluence
    Issued:	 Jan 30, 2013
    Valid From:	 Jan 30, 2013
    Valid Until:	 Mar 01, 2013
    Issuer:	 CN=CustomWare Asia Pacific, O=CustomWare Asia Pacific, C=Australia, DC=AU
    Holder:	 CN=Stuart Young, O=Stuart Young, STREET=204A Sunrise Drive, L=Key Biscayne, ST=FL, C=United States, DC=US



    
</entry>
<entry [Wed 2013:01:30 03:46:03 EST] FIX 'SERVER BASE URL' AFTER CHANGE CONFLUENCE WIKI TO hwiki.org>


1. EDIT server.xml

context path


3. UPDATE 'SERVER BASE URL' IN CONFLUENCD ADMIN

inside server.xml and the confluence option "Server Base Url" in the admin panel?
What version of the plugin/confluence are you using?



    
</entry>
<entry [Wed 2013:01:30 00:40:22 EST] SET DNS FOR CONFLUENCE 4.3.5 INSTANCE TO hwiki.org (REGISTERED WITH GODADDY)>


http://support.godaddy.com/help/article/7921/adding-or-editing-cname-records?locale=en


1. GET EC2 EXTERNAL IP OF CONFLUENCE 4.3.5 INSTANCE

ec2-describe-instances $head | egrep ^INSTANCE | cut -f4

ec2-54-234-114-245.compute-1.amazonaws.com


2. GET ELASTIC IP FOR CONFLUENCE INSTANCE

# DESCRIBE ADDRESSES - FIND OUT WHAT ELASTIC IPS ARE BEING USED
ec2daddr
    ADDRESS	54.243.226.229		standard				
    ADDRESS	54.243.251.46		standard	

# OR ALLOCATE A NEW ELASTIC IP
ec2-allocate-address

    ADDRESS	54.235.175.209		standard

# ASSOCIATE THE NEW ELASTIC IP WITH INSTANCE

ec2-associate-address -i i-05c12174 54.235.175.209

    ADDRESS	54.235.175.209	i-05c12174


3. CREATE 'A' RECORD POINTING TO ELASTIC IP

LOGIN TO GODADDY 'ACCOUNT MANAGER'

http://mya.godaddy.com/default.aspx?prog_id=GoDaddy

user: youngstuart
pass: r*****XXXX****999


NEXT TO Domains, CLICK Launch.

Tools --> DNS Manager --> CLICK Edit Zone TO RIGHT OF DOMAIN NAME


SET 'A' RECORD

Host: @                     (DEFAULTS TO DOMAIN NAME, E.G., www.hwiki.org)
Points to: 54.235.175.209   (CHANGED FROM 68.178.232.100)


4. SAVE ZONE FILE (TOP RIGHT BUTTON)


5. WAIT A FEW MINUTES


6. VERIFY DNS NAME HAS PROPAGATED

BROWSE TO INSTANCE AT www.hwiki.org

OR

TEST WITH PING, SEE ec2.quickref.xls
[Wed 2013:01:30 01:46:02 EST] HOW TO ENABLE PING

ping 54.235.175.209
    OK
    
ping hwiki.org
    OK

ping www.hwiki.org
    ***FAILS***


OR GO TO

http://www.whatsmydns.net

ENTER DOMAIN NAME --> THESE DNS SERVERS ALREADY HAD THE CORRECT IP:

    Seattle WA, United States (Speakeasy)	54.235.175.209	
    ...
    Auckland, New Zealand (Xtra)	54.235.175.209	



NOTES
-----

Adding or Editing CNAME Records
Date Submitted: 11-28-2012
A CNAME (Alias) record points to an A (Host) record. You can create multiple CNAME records and point them to an A record. The most common CNAME records are the subdomains www and ftp.

CNAME records make your DNS data easier to manage. If you change the IP address of an A record, all CNAME records pointed to that A record automatically follow the new IP address. The alternative solution, multiple A records, is not as simple as using CNAME records.

You can click Restore Defaults in the CNAME (Alias) section of the Zone File Editor to restore the default MX records for your domain name. For more information, see Restoring a Domain Name's Zone File Records.

To Access the Zone File Editor

Log in to your Account Manager.

Next to Domains, click Launch.
Do one of the following:

From the Tools menu, select DNS Manager, and then click Edit Zone for the domain name you want to update.
Click the domain name you want to update, and, in the DNS Manager section, click Launch.

To Add a CNAME Record
Go to the Zone File Editor for the domain name you want to update.
Click Add New Record. The Add DNS Record window displays.
From the Record type list, select CNAME (Alias).
Complete the following fields:

Enter an Alias Name — Enter the subdomain name for the alias assignment. For example, type www.
Points to Host Name — Enter the host name you want the alias to point to. For example, type @ to map the alias directly to your domain name.
TTL — Select how long the server should cache the information.
Click OK.
Click Save Zone File, and then click OK. The new CNAME record displays in the CNAME (Alias) section.

To Edit a CNAME Record
Go to the Zone File Editor for the domain name you want to update.
In the CNAME (Alias) section, click the CNAME record you want to edit.
Edit any of the following fields:
Host — Enter the subdomain name for the alias assignment. For example, type www.
Points to — Enter the host name you want the alias to point to. For example, type @ to map the alias directly to your domain name.
TTL — Select how long the server should cache the information.
Click Save Zone File, and then click OK.
Go back to Managing DNS for Your Domain Names.

    
</entry>
<entry [Thu 2013:01:17 16:42:09 EST] CUSTOMISE DEFAULT PERSONAL SPACE HOME PAGE>

https://confluence.atlassian.com/display/DOC/Customising+Default+Space+Content

    
</entry>
<entry [Thu 2013:01:17 16:40:58 EST] DISABLE PERSONAL PROFILE POPUP IN PERSONAL SPACE>

Why does a separate panel with my profile and recent updates appear to the right of all my pages in my personal space.
Permalink
Reply
 Aug 17, 2010
Sashidaran Jayaraman [Atlassian]
Hi,

This feature was introduced in Confluence 3.0. Here's the link to release notes that explains about this feature:

http://confluence.atlassian.com/display/CONF30/Confluence+3.0+Release+Notes#Confluence3.0ReleaseNotes-EnhancedUserProfiles
In case, you would like to disable it, please refer to this comment. You might need to remove the line:

#set ($showPersonalSidebar = ($sitemeshPage.getProperty("page.personal-sidebar") || $sitemeshPage.getProperty("page.show-personal-sidebar")))
altogether if you do not want it.

Hope this helps.

Cheers
JSashi
Permalink

    
</entry>
<entry [Thu 2013:01:17 16:40:06 EST] CUSTOMISE DEFAULT NEW PAGE>

How do I set default content for other pages?
Permalink
Reply
 Feb 16, 2009
Komathi Krishnan [Atlassian]
Hi there,

As far as I am concerned, you can try adding a custom layout for normal Confluence pages. Browse to Administration Console and click Layouts under Look and Feel. Click Create custom next to Page Layout and look for this line of codes:

<!--
<div class="wiki-content">
    $body
</div>
-->

Edit your content in between this line of codes where the $body has been define. Save the changes and try creating new page. Please note that this will affect all of the pages in the space.

Refer here for more details on Customising Layouts

http://confluence.atlassian.com/display/DOC/Customising+Layouts
Cheers,
Komathi
    
</entry>
<entry [Tue 2013:01:01 02:53:25 EST] RSS FEEDS BELOW SPACETREE MENU IN LEFT NAVBAR>

1. ADDED URLS TO WHITELIST

http://slyfox.bx.psu.edu:8080/feeds/latest
http://feeds.feedburner.com/seqanswers
http://feeds.feedburner.com/seqanswers
http://barf.jcowboy.org/bmcgenomics.xml
http://www.medworm.com/rss/medicalfeeds/source/Source+Code+for+Biology+and+Medicine.xml
http://barf.jcowboy.org/bioinformatics.xml
http://www.twibes.com/group/Bioinformatics/tweets.rss?screen_name=bioinformatics


{rss:url=http://api.twitt
er.com/1/statuses/user_timeline.rss?screen_name=bioinformatic

2. ADDED TO LEFT NAVBAR IN REFINEDWIKI GLOBAL LAYOUT

h2. {toggle-cloak:id=zero} Blogs

{cloak:id=zero}
Bioinformatics blogs
{cloak}

h2. {toggle-cloak:id=one} Forums

{cloak:id=one}

{rss:url=http://slyfox.bx.psu.edu:8080/feeds/latest|max=1|showTitlesOnly=true|titleBar=true}

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
<entry [Tue 2013:01:01 02:32:04 EST] SECOND XML BACKUP OF CONFLUENCE 4.3.5 AFTER COMPLETED JBROWSE SCREENSHOTS>

1. CREATED ZIPFILE

Confluence Admin --> Administration : Backup and Restore --> Backup Confluence Data

/var/atlassian/application-data/confluence/temp/xmlexport-20130101-073122-2.zip. 


2. COPIED ZIPFILE ON CONFLUENCE 4.3.5 INSTANCE

mkdir /root/confluence-backup
cp /var/atlassian/application-data/confluence/temp/xmlexport-20130101-073122-2.zip /root/confluence-backup/xmlexport-20130101-073122-2.zip


3. COPIED ZIPFILE TO TOSHIBA

ON TOSHIBA

su - aguadev
scp root@$HEADIP:/root/confluence-backup/xmlexport-20130101-073122-2.zip .
exit

mv /home/aguadev/xmlexport-20130101-073122-2.zip /home/syoung/notes/backup/confluence/confluence-4.3.5-xmlexport-20130101-073122-2.zip
chown -R syoung:syoung /home/syoung/notes/backup/confluence

    
</entry>
