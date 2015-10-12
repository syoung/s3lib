/* ###########################################################################

GLOBAL ASSETS RELEASE v3.8.1

MENUCONTENT.JS v6.3

BUILD DATE: 20080610

COPYRIGHT SUN MICROSYSTEMS INC. 2008

CONTACT US AT http://www.sun.com/secure/contact/cer.jsp?id=1073e17d-8d6c-43f6-b7e8-cf210cc89ba9 WITH ANY QUESTIONS

########################################################################### */

// TEXT TO LOCALIZE
var ltxt = {
	showDetails: 'Show Details',
	hideDetails: 'Hide Details',
	seeall: 'See All',
	processingRequest: 'Processing Request'
};

// LOCATION OF YOUR LOCAL IM & CSS DIRECTORIES
var imdir = "/im";
var cssdir = "/css";
var jsdir = "/js";

var shutoff = {
	global: false, // true disables global menus
	share: false, // true disables share page
	pop: false, // true disables k2
	misc: false
};

// A2 MENU ITEMS
a2['Products'] = '\
<li><a href="http://www.sun.com/software/">Software</a></li>\
<li><a href="http://www.sun.com/desktop/">Desktop Systems</a></li>\
<li><a href="http://www.sun.com/servers/">Servers</a></li>\
<li><a href="http://www.sun.com/storage/">Storage</a></li>\
<li><a href="http://www.sun.com/products/microelectronics/index.jsp">Microelectronics</a></li>\
<li><a href="http://www.sun.com/tryandbuy/index.jsp">Free 60-Day Product Trials</a></li>\
<li><a href="http://www.sun.com/outlet/index.jsp?intcmp=1201">Sun Outlet</a></li>\
<li><a href="http://www.sun.com/tradeins/">Trade-In Program</a></li>\
<li><a href="http://www.sun.com/optionsandspares/">Options &amp; Spares</a></li>\
<li><a href="http://www.sun.com/ibb/remanufactured/">Remanufactured Systems</a></li>\
<li><a href="http://www.sun.com/sales/leasing/">Financing</a></li>\
';

a2['Downloads'] = '\
<li><a href="http://www.sun.com/software/solaris/get.jsp">Solaris 10</a></li>\
<li><a href="http://java.sun.com/j2se/downloads/">Java SE</a></li>\
<li><a href="http://www.sun.com/software/products/mysql/getit.jsp">MySQL</a></li>\
<li><a href="http://www.sun.com/download/index.jsp?cat=Application%20Development&tab=3&subcat=Development%20Tools">Developer Tools</a></li>\
<li><a href="http://www.sun.com/download/index.jsp?tab=5">Top Downloads</a></li>\
<li><a href="http://www.sun.com/download/index.jsp?tab=4">New Downloads</a></li>\
<li><a href="http://www.sun.com/download/index.jsp?cat=Patches%20%26%20Updates&tab=3">Patches &amp; Updates</a></li>\
';

a2['Services &amp; Solutions'] = '\
<li><a href="http://www.sun.com/service/serviceplans/index.jsp">Service Plans</a></li>\
<li><a href="http://www.sun.com/service/warranty/index.xml">Warranties</a></li>\
<li><a href="http://www.sun.com/service/consulting/">Consulting &amp; IT Services</a></li>\
<li><a href="http://www.sun.com/servers/hpc/index.jsp">High Performance Computing</a></li>\
<li><a href="http://www.sun.com/service/sungrid/overview.jsp">Utility Computing</a></li>\
<li><a href="http://www.sun.com/service/managedservices/">Managed Services</a></li>\
<li><a href="http://www.sun.com/service/sunconnection/">Secure IT Network Services</a></li>\
<li><a href="http://www.sun.com/servicessolutions/infrastructure/">Sun Solutions Portfolio</a></li>\
';

a2['Support'] = '\
<li><a href="http://sunsolve.sun.com/handbook_pub/">Sun System Handbook</a></li>\
<li><a href="http://www.sun.com/support/membersupportcenter/index.jsp">Member Support Center</a></li>\
<li><a href="http://www.sun.com/support/knowledge/index.jsp">Knowledge Resources</a></li>\
<li><a href="http://sunsolve.sun.com/show.do?target=patchpage">Patches &amp; Updates</a></li>\
<li><a href="http://www.sun.com/documentation/index.html">Product Documentation</a></li>\
<li><a href="http://www.sun.com/support/communities/index.jsp">Community Resources</a></li>\
<li><a href="http://www.sun.com/support/tools/index.jsp">Proactive &amp; Diagnostic Tools</a></li>\
<li><a href="http://sunsolve.sun.com/">SunSolve Knowledgebase</a></li>\
';

a2['Training'] = '\
<li><a href="http://www.sun.com/training/catalog/">Course Catalog</a></li>\
<li><a href="http://www.sun.com/training/certification/">Certification</a></li>\
<li><a href="http://www.sun.com/training/team/consulting/index.html">Consulting Solutions</a></li>\
<li><a href="http://nettalk.sun.com/bhive/t/1000/index.jsp">Net Talks</a></li>\
';

a2['Developer'] = '\
<li><a href="https://reg.sun.com/register?program=sdn">Join Sun Developer Network</a></li>\
<li><a href="http://java.sun.com/reference/api/index.html">APIs &amp; Docs</a></li>\
<li><a href="http://developers.sun.com/forums/">Forums</a></li>\
<li><a href="http://java.sun.com/">Java For Developers</a></li>\
<li><a href="http://developers.sun.com/prodtech/solaris/index.html">Solaris For Developers</a></li>\
<li><a href="http://developers.sun.com/prodtech/index.html">Technologies</a></li>\
<li><a href="http://developers.sun.com/services/">Developer Services</a></li>\
';

a2['Services'] = '\
<li><a href="http://www.sun.com/service/consulting/index.jsp?tsubcat=Architect%20Your%20Environment&tab=task">Architect</a></li>\
<li><a href="http://www.sun.com/service/consulting/index.jsp?tsubcat=Implement%20and%20Migrate%20Your%20Environment&tab=task">Implement &amp; Migrate</a></li>\
<li><a href="http://www.sun.com/service/consulting/index.jsp?tsubcat=Install%20Your%20IT%20Environment&tab=4">Install</a></li>\
<li><a href="http://www.sun.com/service/serviceplans/index.jsp">Support</a></li>\
<li><a href="http://www.sun.com/service/consulting/index.jsp?tsubcat=Assess%20Your%20IT%20Environment&tab=task">Assess</a></li>\
<li><a href="http://www.sun.com/service/managedservices/offerings.jsp">Manage</a></li>\
<li><a href="http://www.sun.com/service/warranty/index.xml">Warranties</a></li>\
<li><a href="http://www.sun.com/service/serviceplans/index.jsp">Service Plans</a></li>\
<li><a href="http://www.sun.com/service/systempacks/index.jsp">System Packs</a></li>\
';

a2['Solutions'] = '\
<li><a href="http://www.sun.com/servicessolutions/industries/">Industry Solutions</a></li>\
<li><a href="http://www.sun.com/oem/">Sun OEM Solutions</a></li>\
<li><a href="http://www.sun.com/third-party/global/">Global Partner Solutions</a></li>\
<li><a href="http://www.sun.com/solutioncenters/index.jsp">Sun Solutions Centers</a></li>\
<li><a href="http://www.sun.com/third-party/srsc/">Solaris Solutions</a></li>\
<li><a href="http://www.sun.com/storagetek/">Storage Solutions</a></li>\
<li><a href="http://www.sun.com/servers/hpc/index.jsp">High Performance Computing</a></li>\
<li><a href="http://www.sun.com/solutions/eco_innovation/index.jsp">Eco Innovation Initiative</a></li>\
<li><a href="http://www.sun.com/datacenter/consolidation/index.jsp">Virtualization</a></li>\
<li><a href="http://www.sun.com/solutions/web_scale/index.jsp">Web Scale</a></li>\
';


// A1 MENU ITEMS
a1['Java'] ='\
<ul class="bluearrows">\
<li><a href="http://www.sun.com/java/">Java at Sun</a></li>\
<li><a href="http://www.sun.com/software/opensource/java/">Free and Open Source Java</a></li>\
<li><a href="http://java.com/download/">Java for your computer</a></li>\
<li><a href="http://java.sun.com/javase/downloads/">Download the latest JDK</a></li>\
<li><a href="http://www.netbeans.org/downloads/index.html">Download NetBeans IDE</a></li>\
<li><a href="http://developers.sun.com/prodtech/javatools/">Java Developer Tools</a></li>\
<li><a href="http://java.sun.com/">Java Developer Resources</a></li>\
<li><a href="http://java.sun.com/javase/">Java Standard Edition</a></li>\
<li><a href="http://java.sun.com/javaee/">Java Enterprise Edition</a></li>\
<li><a href="http://java.sun.com/javame/">Java Micro Edition</a></li>\
<li><a href="http://java.sun.com/learning/training/">Java Training</a></li>\
<li><a href="http://developers.sun.com/services/">Java Support</a></li>\
</ul>\
';

a1['Solaris'] ='\
<ul class="bluearrows">\
<li><a href="http://www.sun.com/software/solaris/">Solaris</a><p>The free and open Solaris OS.</p></li>\
<li><a href="http://developers.sun.com/sunstudio/">Sun Studio</a><p>Optimizing compilers and tools for C/C++/Fortran for application development.</p></li>\
<li><a href="http://developers.sun.com/prodtech/solaris/">Solaris Developer Resources</a><p>Find what you need at the Solaris developers center.</p></li>\
<li><a href="http://developers.sun.com/services/">Solaris Developer Services</a><p>Get dedicated Solaris support and more with Sun Developer Services. </p></li>\
<li><a href="http://www.sun.com/third-party/srsc/index.jsp">Solaris ISV Applications</a><p>ISV applications shipping on Solaris 10.</p></li>\
<li><a href="http://www.sun.com/bigadmin/home/index.html">Solaris System Administrator Resources</a><p>Get all the Solaris information you need. </p></li>\
<li><a href="http://www.opensolaris.org/">OpenSolaris</a><p>The OpenSolaris project is an open source community and a place for collaboration and conversation around OpenSolaris technology.</p></li>\
</ul>\
';

a1['Communities'] ='\
<div class="a1-2colwrap">\
<div class="a1-2colul">\
<ul class="bluearrows">\
<li><a href="http://www.sun.com/communities/">Communities at Sun</a><p>Networks connect more than computers. Find out more about Sun communities.</p></li>\
<li><a href="http://developers.sun.com/">Developers</a><p>Join the Sun Developer Network, a worldwide community of over 2 million developers, and get your BackStage Pass to technical information,  developer tools, discounted books and training, and more.</p></li>\
<li><a href="http://www.sun.com/bigadmin/home/index.html">System Administrators</a><p>Find online articles and participate in community forums on the BigAdmin portal.</p></li>\
<li><a href="http://www.sun.com/aboutsun/investor/">Investors</a><p>Access Sun earnings announcements, annual reports, and company information.</p></li>\
<li><a href="http://www.sun.com/partners/">Partners</a><p>Sun\'s partner network delivers innovation and value to customers around the world.</p></li>\
</ul>\
<ul class="bluearrows">\
<li><a href="http://www.sun.com/products-n-solutions/edu/">Education</a><p>Find out about Sun programs, software, and systems for students and educators.</p></li>\
<li><a href="http://www.sun.com/aboutsun/media/index.jsp">Press</a><p>See the latest news from Sun, and hear what the industry is saying.</p></li>\
<li><a href="http://research.sun.com/">Research</a><p>What\'s happening in Sun Labs?</p></li>\
<li><a href="http://www.sun.com/customers/index.xml">Customers</a><p>Success stories about business problems solved by collaboration with Sun.</p></li>\
<li><a href="http://java.sun.com/">Java Technology</a><p>Find out what\'s happening with the Java programming language &mdash; in mobile devices, smart cards, and data centers.</p></li>\
<li><a href="http://blogs.sun.com/">Sun Blogs</a><p>Join the conversation &mdash; meet the people at Sun who are passionate about their jobs.</p></li>\
</ul>\
</div>\
</div>\
<br class="clear">\
';

a1['About Sun'] ='\
<div class="a1-2colwrap">\
<div class="a1-2colul">\
<ul class="bluearrows">\
<li><a href="http://www.sun.com/aboutsun/company/index.jsp">Our Company</a><p>Since our inception in 1982, the vision of "The Network is the Computer" has evolved into the Participation Age. We see everyone and everything participating on the network.</p></li>\
<li><a href="http://www.sun.com/aboutsun/media/index.jsp">Sun News Center</a><p>Get the latest news and information about Sun.</p></li>\
<li><a href="http://sunfeedroom.sun.com/ifr_main.jsp?nsid=b7d910b32:110f044bb29:-288c&st=1172264235694&mp=FLV&cpf=false&fr=022307_035715_7d910b32x110f044bb29xw288b&rdm=476814.5163635833">Multimedia Center</a><p>Sun\'s Multimedia Center has multiple channels with lots of rich media content.</p></li>\
<li><a href="http://www.sun.com/aboutsun/investor/index.jsp">Investor Relations</a><p>Find information and resources for Sun\'s investor community.</p></li>\
<li><a href="http://www.sun.com/aboutsun/executives/">Executive Perspectives</a><p>Get the latest inside thinking from Sun\'s executive leadership team.</p></li>\
<li><a href="http://www.sun.com/company/cgov/index.jsp">Corporate Governance</a><p>Sun has always been dedicated to the highest standards of business integrity, and over the past two decades we\'ve continually taken steps to reinforce that commitment.</p></li>\
</ul>\
<ul class="bluearrows">\
<li><a href="http://www.sun.com/aboutsun/csr/">Corporate Responsibility</a><p>The economic, environmental and social sustainability of the communities where we operate is among our top priorities.</p></li>\
<li><a href="http://www.sun.com/aboutsun/environment/">Eco Responsibility</a><p>Sun is committed to designing eco-responsible products and sharing information and technology so that we can all move forward to a more sustainable model.</p></li>\
<li><a href="http://www.sun.com/aboutsun/sunfederal/">Sun Microsystems Federal, Inc.</a><p>Sun Microsystems Federal Inc., a wholly owned subsidiary of Sun Microsystems, Inc., manages strategic opportunities that bring Sun\'s solutions to the U.S. Federal government.</p></li>\
<li><a href="http://www.sun.com/corp_emp/">Employment at Sun</a><p>Find jobs in countries around the globe.</p></li>\
<li><a href="http://www.sun.com/secure/contact/">Contact Sun</a><p>Find a way to get in touch.</p></li>\
</ul>\
</div>\
</div>\
<br class="clear">\
';

a1['How to Buy'] = '\
<ul class="bluearrows">\
<li><a href="http://www.sun.com/sales/index.jsp">How to Buy</a><p>Find out about buying at Sun in the U.S. and worldwide.</p></li>\
</ul>\
';

a1['My Sun Connection'] = '\
<ul class="bluearrows">\
<li><a href="http://portal.sun.com/portal/dt?JSPTabContainer.setSelected=PartnersTabContainerProvider&last=false">Partners</a><p>Access the Sun Partner Advantage Membership Center.</p></li>\
<li><a href="https://portal.sun.com/portal/dt?JSPTabContainer.setSelected=MyAccountTabContainer&last=false">My Account</a><p>View and change profile and account information.</p></li>\
<li><a href="https://reg.sun.com/register?goto='+encodeURIComponent(document.location)+'">Register Now</a><p>Get a login to access Sun resources.</p></li>\
</ul>\
';

a1['My Account'] = '\
<ul class="bluearrows">\
<li><a href="https://portal.sun.com/portal/dt">My Sun Connection</a><p>Your personal portal to Sun products, services, and support.</p></li>\
<li><a href="https://reg.sun.com/register?goto='+encodeURIComponent(document.location)+'">Register Now</a><p>Get a login to access Sun resources.</p></li>\
</ul>\
';

a1['Cart'] = '\
<ul class="bluearrows">\
<li><a href="http://shop.sun.com/cart">My Cart</a></li>\
<li><a href="http://shop.sun.com/saved_items">Saved Items</a></li>\
<li><a href="http://shop.sun.com/quotes">Quotes</a></li>\
<li><a href="http://shop.sun.com/orders">Orders</a></li>\
</ul>\
';

// SHARE THIS PAGE
// Turn off share page widget for all pages linking to this file by commenting out the "sharetxt" var

var sharetxt = [
'Sun Web Page: ',
'Check out this page on sun.com: ',
'Email this page to a friend',
'See who links to this page on Technorati',
'Bookmark this page in del.icio.us',
'Submit this page to Digg',
'Submit this page to Slashdot',
'Show available feeds'
]
