document.write('<!-- Template Id = 3879 Template Name = Banner Creative (NEW NPG Flash) -->\n<!-- Created by Matt Peskett - 11-10-2006 clickTAG instead if clickTag. -->\n<!-- Copyright 2002 DoubleClick Inc., All rights reserved. -->\n<script src=\"http://m1.2mdn.net/879366/flashwrite_1_2.js\"><\/script>');document.write('\n');
 
var dcswf = "http://m1.2mdn.net/27743/epadvan_banner_300x250.swf"; 
var dcgif = "http://m1.2mdn.net/27743/epadvan_2008_2_300x250_banner.gif"; 
var advurl = "http://ad.doubleclick.net/click%3Bh=v8/379f/3/0/%2a/s%3B209779163%3B0-0%3B0%3B17389285%3B4307-300/250%3B29360923/29378802/1%3B%3B%7Esscs%3D%3fhttp://de.sitestat.com/eppendorf/com/s?nature.advantage_II_2008.banner&ns_type=clickin";
var dcadvurl = escape(advurl);
var dcminversion = 6;
var dcmaxversion = 9;
var plugin = false;
var dccreativewidth = "728";
var dccreativeheight = "90";
var dcwmode = "opaque";
var dcbgcolor = "";

if (((navigator.appName == "Netscape") && (navigator.userAgent.indexOf("Mozilla") != -1) && (parseFloat(navigator.appVersion) >= 4) && (navigator.javaEnabled()) && navigator.mimeTypes && navigator.mimeTypes["application/x-shockwave-flash"] && navigator.mimeTypes["application/x-shockwave-flash"].enabledPlugin)) {
var plugname=navigator.plugins['Shockwave Flash'].description;var plugsub=plugname.substring(plugname.indexOf("."),-1); var plugsubstr=plugsub.substr(-1)
if( plugsubstr >= dcminversion) { plugin = true;}
}
else if (navigator.userAgent && navigator.userAgent.indexOf("MSIE")>=0 && (navigator.userAgent.indexOf("Opera")<0) && (navigator.userAgent.indexOf("Windows 95")>=0 || navigator.userAgent.indexOf("Windows 98")>=0 || navigator.userAgent.indexOf("Windows NT")>=0) && document.all) 
{
document.write('<script language=VBScript>' + '\n' +
   'dcmaxversion = '+dcmaxversion + '\n' +
   'dcminversion = '+dcminversion + '\n' +
   'Do' + '\n' +
    'On Error Resume Next' + '\n' +
    'plugin = (IsObject(CreateObject(\"ShockwaveFlash.ShockwaveFlash.\" & dcmaxversion & \"\")))' + '\n' +
    'If plugin = true Then Exit Do' + '\n' +
    'dcmaxversion = dcmaxversion - 1' + '\n' +
    'Loop While dcmaxversion >= dcminversion' + '\n' +
  '<\/script>');
}
if ( plugin )  {
 adcode = '<OBJECT classid="clsid:D27CDB6E-AE6D-11cf-96B8-444553540000"'+
  ' ID=FLASH_AD WIDTH="'+ dccreativewidth +'" HEIGHT="'+ dccreativeheight +'">'+
  '<PARAM NAME=movie VALUE="' + dcswf + '?clickTAG='+ dcadvurl +'"><PARAM NAME=quality VALUE=high><PARAM NAME=bgcolor VALUE=#'+ dcbgcolor +'><PARAM NAME=wmode VALUE='+ dcwmode +'>'+
  '<EMBED src="' + dcswf + '?clickTAG='+ dcadvurl +'" quality=high wmode='+dcwmode+
  ' swLiveConnect=TRUE WIDTH="'+ dccreativewidth +'" HEIGHT="'+ dccreativeheight +'" bgcolor=#'+ dcbgcolor+
  ' TYPE="application/x-shockwave-flash" ></EMBED></OBJECT>';
if(('j'!="j")&&(typeof dclkFlashWrite!="undefined")){dclkFlashWrite(adcode);}else{document.write(adcode);}
} else if (!(navigator.appName && navigator.appName.indexOf("Netscape")>=0 && navigator.appVersion.indexOf("2.")>=0)){
 document.write('<A TARGET="blank" HREF="http://ad.doubleclick.net/click%3Bh=v8/379f/3/0/%2a/s%3B209779163%3B0-0%3B0%3B17389285%3B4307-300/250%3B29360923/29378802/1%3B%3B%7Esscs%3D%3fhttp://de.sitestat.com/eppendorf/com/s?nature.advantage_II_2008.banner&ns_type=clickin"><IMG SRC="' + dcgif + '" BORDER=0></A>');
}
//-->

document.write('<NOEMBED><A TARGET=\"blank\" HREF=\"http://ad.doubleclick.net/click%3Bh=v8/379f/3/0/%2a/s%3B209779163%3B0-0%3B0%3B17389285%3B4307-300/250%3B29360923/29378802/1%3B%3B%7Esscs%3D%3fhttp://de.sitestat.com/eppendorf/com/s?nature.advantage_II_2008.banner&ns_type=clickin\"><IMG SRC=\"http://m1.2mdn.net/27743/epadvan_2008_2_300x250_banner.gif\" BORDER=0></A></NOEMBED><NOSCRIPT><A TARGET=\"blank\" HREF=\"http://ad.doubleclick.net/click%3Bh=v8/379f/3/0/%2a/s%3B209779163%3B0-0%3B0%3B17389285%3B4307-300/250%3B29360923/29378802/1%3B%3B%7Esscs%3D%3fhttp://de.sitestat.com/eppendorf/com/s?nature.advantage_II_2008.banner&ns_type=clickin\"><IMG SRC=\"http://m1.2mdn.net/27743/epadvan_2008_2_300x250_banner.gif\" BORDER=0></A></NOSCRIPT>');
