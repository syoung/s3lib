//-- Urchin Tracking Module 6.1 (UTM 6.1) $Revision: 1.24 $
//-- Copyright 2004 Urchin Software Corporation, All Rights Reserved.

//-- Urchin On Demand Settings ONLY
var _u5_uacct="";			// set up the Urchin Account
var _u5_userv=0;			// service mode (0=local,1=remote,2=both)

//-- UTM User Settings
var _u5_ufsc=1;			// set client info flag (1=on|0=off)
var _u5_udn="auto";		// (auto|none|domain) set the domain name for cookies
var _u5_uhash="on";		// (on|off) unique domain hash for cookies
var _u5_utimeout="1800";   	// set the inactive session timeout in seconds
var _u5_ugifpath="/__utm.gif";	// set the web path to the __utm.gif file
var _u5_utsp="|";			// transaction field separator
var _u5_uflash=1;			// set flash version detect option (1=on|0=off)
var _u5_utitle=1;			// set the document title detect option (1=on|0=off)

//-- UTM Campaign Tracking Settings
var _u5_uctm=0;			// set campaign tracking module (1=on|0=off)
var _u5_ucto="15768000";		// set timeout in seconds (6 month default)
var _u5_uccn="utm_campaign";	// name
var _u5_ucmd="utm_medium";		// medium (cpc|cpm|link|email|organic)
var _u5_ucsr="utm_source";		// source
var _u5_uctr="utm_term";		// term/keyword
var _u5_ucct="utm_content";	// content
var _u5_ucid="utm_id";		// id number
var _u5_ucno="utm_nooverride";	// don't override

//-- Auto/Organic Sources and Keywords
var _u5_uOsr=new Array();
var _u5_uOkw=new Array();
_u5_uOsr[0]="google";	_u5_uOkw[0]="q";
_u5_uOsr[1]="yahoo";	_u5_uOkw[1]="p";
_u5_uOsr[2]="msn";		_u5_uOkw[2]="q";
_u5_uOsr[3]="aol";		_u5_uOkw[3]="query";
_u5_uOsr[4]="lycos";	_u5_uOkw[4]="query";
_u5_uOsr[5]="ask";		_u5_uOkw[5]="q";
_u5_uOsr[6]="altavista";	_u5_uOkw[6]="q";
_u5_uOsr[7]="search";	_u5_uOkw[7]="q";
_u5_uOsr[8]="netscape";	_u5_uOkw[8]="query";
_u5_uOsr[9]="earthlink";	_u5_uOkw[9]="q";
_u5_uOsr[10]="cnn";	_u5_uOkw[10]="query";
_u5_uOsr[11]="looksmart";	_u5_uOkw[11]="key";
_u5_uOsr[12]="about";	_u5_uOkw[12]="terms";
_u5_uOsr[13]="excite";	_u5_uOkw[13]="qkw";
_u5_uOsr[14]="mamma";	_u5_uOkw[14]="query";
_u5_uOsr[15]="alltheweb";	_u5_uOkw[15]="q";
_u5_uOsr[16]="gigablast";	_u5_uOkw[16]="q";
_u5_uOsr[17]="voila";	_u5_uOkw[17]="kw";
_u5_uOsr[18]="virgilio";	_u5_uOkw[18]="qs";
_u5_uOsr[19]="teoma";	_u5_uOkw[19]="q";

//-- Auto/Organic Keywords to Ignore
var _u5_uOno=new Array();
//_u5_uOno[0]="urchin";
//_u5_uOno[1]="urchin.com";
//_u5_uOno[2]="www.urchin.com";

//-- Referral domains to Ignore
var _u5_uRno=new Array();
//_u5_uRno[0]=".urchin.com";

//-- **** Don't modify below this point ***
var _u5_uff,_u5_udh,_u5_udt,_u5_udo="",_u5_uu,_u5_ufns=0,_u5_uns=0,_u5_ur="-",_u5_ufno=0,_u5_ust=0,_u5_ujv="-",_u5_ubd=document,_u5_udl=_u5_ubd.location,_u5_uwv="6.1";
var _u5_ugifpath2="http://service.urchin.com/__utm.gif";
if (_u5_udl.protocol=="https:") _u5_ugifpath2="https://service.urchin.com/__utm.gif";
function u5_urchinTracker(page) {
 if (_u5_udl.protocol=="file:") return;
 if (_u5_uff && (!page || page=="")) return;
 var a,b,c,v,x="",s="",f=0;
 var nx=" expires=Sun, 18 Jan 2038 00:00:00 GMT;";
 var dc=_u5_ubd.cookie;
 _u5_udh=_u5_uDomain();
 _u5_uu=Math.round(Math.random()*2147483647);
 _u5_udt=new Date();
 _u5_ust=Math.round(_u5_udt.getTime()/1000);
 a=dc.indexOf("__utma="+_u5_udh);
 b=dc.indexOf("__utmb="+_u5_udh);
 c=dc.indexOf("__utmc="+_u5_udh);
 if (_u5_udn && _u5_udn!="") { _u5_udo=" domain="+_u5_udn+";"; }
 if (_u5_utimeout && _u5_utimeout!="") {
  x=new Date(_u5_udt.getTime()+(_u5_utimeout*1000));
  x=" expires="+x.toGMTString()+";";
 }
 s=_u5_udl.search;
 if(s && s!="" && s.indexOf("__utma=")>=0) {
  a=_u5_uGC(s,"__utma=","&");
  b=_u5_uGC(s,"__utmb=","&");
  c=_u5_uGC(s,"__utmc=","&");
  if (a!="-" && b!="-" && c!="-") f=1;
  else if(a!="-") f=2;
 }
 if(f==1) {
  _u5_ubd.cookie="__utma="+a+"; path=/;"+nx;
  _u5_ubd.cookie="__utmb="+b+"; path=/;"+x;
  _u5_ubd.cookie="__utmc="+c+"; path=/;";
 } else if (f==2) {
  a=_u5_uFixA(s,"&",_u5_ust);
  _u5_ubd.cookie="__utma="+a+"; path=/;"+nx;
  _u5_ubd.cookie="__utmb="+_u5_udh+"; path=/;"+x;
  _u5_ubd.cookie="__utmc="+_u5_udh+"; path=/;";
  _u5_ufns=1;
 } else if (a>=0 && b>=0 && c>=0) {
  _u5_ubd.cookie="__utmb="+_u5_udh+"; path=/;"+x+_u5_udo;
 } else {
  if (a>=0) a=_u5_uFixA(_u5_ubd.cookie,";",_u5_ust);
  else a=_u5_udh+"."+_u5_uu+"."+_u5_ust+"."+_u5_ust+"."+_u5_ust+".1";
  _u5_ubd.cookie="__utma="+a+"; path=/;"+nx+_u5_udo;
  _u5_ubd.cookie="__utmb="+_u5_udh+"; path=/;"+x+_u5_udo;
  _u5_ubd.cookie="__utmc="+_u5_udh+"; path=/;"+_u5_udo;
  _u5_ufns=1;
 }
 if (s && s!="" && s.indexOf("__utmv=")>=0) {
  if ((v=_u5_uGC(s,"__utmv=","&"))!="-") {
   _u5_ubd.cookie="__utmv="+unescape(v)+"; path=/;"+nx+_u5_udo;
  }
 }
 _u5_uInfo(page);
 _u5_ufns=0;
 _u5_ufno=0;
 _u5_uff=1;
}
u5_urchinTracker();
function _u5_uInfo(page) {
 var p,s="",pg=_u5_udl.pathname+_u5_udl.search;
 if (page && page!="") pg=escape(page);
 _u5_ur=_u5_ubd.referrer;
 if (!_u5_ur || _u5_ur=="") { _u5_ur="-"; }
 else {
  p=_u5_ur.indexOf(_u5_ubd.domain);
  if ((p>=0) && (p<=8)) { _u5_ur="0"; }
  if (_u5_ur.indexOf("[")==0 && _u5_ur.lastIndexOf("]")==(_u5_ur.length-1)) { _u5_ur="-"; }
 }
 s+="&utmn="+_u5_uu;
 if (_u5_ufsc) s+=_u5_uBInfo(page);
 if (_u5_uctm && (!page || page=="")) s+=_u5_uCInfo();
 if (_u5_utitle && _u5_ubd.title && _u5_ubd.title!="") s+="&utmdt="+escape(_u5_ubd.title);
 if (_u5_udl.hostname && _u5_udl.hostname!="") s+="&utmhn="+escape(_u5_udl.hostname);
 if (!page || page=="") s+="&utmr="+_u5_ur;
 s+="&utmp="+pg;
 if (_u5_userv==0 || _u5_userv==2) {
  var i=new Image(1,1);
  i.src=_u5_ugifpath+"?"+"utmwv="+_u5_uwv+s;
  i.onload=function() {_u5_uVoid();}
 }
 if (_u5_userv==1 || _u5_userv==2) {
  var i2=new Image(1,1);
  i2.src=_u5_ugifpath2+"?"+"utmwv="+_u5_uwv+s+"&utmac="+_u5_uacct+"&utmcc="+_u5_uGCS();
  i2.onload=function() { _u5_uVoid(); }
 }
 return;
}
function _u5_uVoid() { return; }
function _u5_uCInfo() {
 if (!_u5_ucto || _u5_ucto=="") { _u5_ucto="15768000"; }
 var c="",t="-",t2="-",o=0,cs=0,cn=0;i=0;
 var s=_u5_udl.search;
 var z=_u5_uGC(s,"__utmz=","&");
 var x=new Date(_u5_udt.getTime()+(_u5_ucto*1000));
 var dc=_u5_ubd.cookie;
 x=" expires="+x.toGMTString()+";";
 if (z!="-") { _u5_ubd.cookie="__utmz="+unescape(z)+"; path=/;"+x+_u5_udo; return ""; }
 z=dc.indexOf("__utmz="+_u5_udh);
 if (z>-1) { z=_u5_uGC(dc,"__utmz="+_u5_udh,";"); }
 else { z="-"; }
 t=_u5_uGC(s,_u5_ucid+"=","&");
 t2=_u5_uGC(s,_u5_ucsr+"=","&");
 if ((t!="-" && t!="") || (t2!="-" && t2!="")) {
  if (t!="-" && t!="") { c+="utmcid="+_u5_uEC(t); if (t2!="-" && t2!="") c+="|utmcsr="+_u5_uEC(t2);
  } else { if (t2!="-" && t2!="") c+="utmcsr="+_u5_uEC(t2); }
  t=_u5_uGC(s,_u5_uccn+"=","&");
  if (t!="-" && t!="") c+="|utmccn="+_u5_uEC(t);
  else c+="|utmccn=(not+set)";
  t=_u5_uGC(s,_u5_ucmd+"=","&");
  if (t!="-" && t!="") c+="|utmcmd="+_u5_uEC(t);
  else  c+="|utmcmd=(not+set)";
  t=_u5_uGC(s,_u5_uctr+"=","&");
  if (t!="-" && t!="") c+="|utmctr="+_u5_uEC(t);
  else { t=_u5_uOrg(1); if (t!="-" && t!="") c+="|utmctr="+_u5_uEC(t); }
  t=_u5_uGC(s,_u5_ucct+"=","&");
  if (t!="-" && t!="") c+="|utmcct="+_u5_uEC(t);
  t=_u5_uGC(s,_u5_ucno+"=","&");
  if (t=="1") o=1;
  if (z!="-" && o==1) return "";
 }
 if (c=="-" || c=="") { c=_u5_uOrg(); if (z!="-" && _u5_ufno==1)  return ""; }
 if (c=="-" || c=="") { if (_u5_ufns==1)  c=_u5_uRef(); if (z!="-" && _u5_ufno==1)  return ""; }
 if (c=="-" || c=="") {
  if (z=="-" && _u5_ufns==1) { c="utmccn=(direct)|utmcsr=(direct)|utmcmd=(none)"; }
  if (c=="-" || c=="") return "";
 }
 if (z!="-") {
  i=z.indexOf(".");
  if (i>-1) i=z.indexOf(".",i+1);
  if (i>-1) i=z.indexOf(".",i+1);
  if (i>-1) i=z.indexOf(".",i+1);
  t=z.substring(i+1,z.length);
  if (t.toLowerCase()==c.toLowerCase()) cs=1;
  t=z.substring(0,i);
  if ((i=t.lastIndexOf(".")) > -1) {
   t=t.substring(i+1,t.length);
   cn=(t*1);
  }
 }
 if (cs==0 || _u5_ufns==1) {
  t=_u5_uGC(dc,"__utma="+_u5_udh,";");
  if ((i=t.lastIndexOf(".")) > 9) {
   _u5_uns=t.substring(i+1,t.length);
   _u5_uns=(_u5_uns*1);
  }
  cn++;
  if (_u5_uns==0) _u5_uns=1;
  _u5_ubd.cookie="__utmz="+_u5_udh+"."+_u5_ust+"."+_u5_uns+"."+cn+"."+c+"; path=/; "+x+_u5_udo;
 }
 if (cs==0 || _u5_ufns==1) return "&utmcn=1";
 else return "&utmcr=1";
}
function _u5_uRef() {
 if (_u5_ur=="0" || _u5_ur=="" || _u5_ur=="-") return "";
 var i=0,h,k,n;
 if ((i=_u5_ur.indexOf("://"))<0) return "";
 h=_u5_ur.substring(i+3,_u5_ur.length);
 if (h.indexOf("/") > -1) {
  k=h.substring(h.indexOf("/"),h.length);
  if (k.indexOf("?") > -1) k=k.substring(0,k.indexOf("?"));
  h=h.substring(0,h.indexOf("/"));
 }
 h=h.toLowerCase();
 n=h;
 if ((i=n.indexOf(":")) > -1) n=n.substring(0,i);
 for (var ii=0;ii<_u5_uRno.length;ii++) {
  if ((i=n.indexOf(_u5_uRno[ii].toLowerCase())) > -1 && n.length==(i+_u5_uRno[ii].length)) { _u5_ufno=1; break; }
 }
 if (h.indexOf("www.")==0) h=h.substring(4,h.length);
 return "utmccn=(referral)|utmcsr="+_u5_uEC(h)+"|"+"utmcct="+_u5_uEC(k)+"|utmcmd=referral";
}
function _u5_uOrg(t) {
 if (_u5_ur=="0" || _u5_ur=="" || _u5_ur=="-") return "";
 var i=0,h,k;
 if ((i=_u5_ur.indexOf("://")) < 0) return "";
 h=_u5_ur.substring(i+3,_u5_ur.length);
 if (h.indexOf("/") > -1) {
  h=h.substring(0,h.indexOf("/"));
 }
 for (var ii=0;ii<_u5_uOsr.length;ii++) {
  if (h.indexOf(_u5_uOsr[ii]) > -1) {
   if ((i=_u5_ur.indexOf("?"+_u5_uOkw[ii]+"=")) > -1 || (i=_u5_ur.indexOf("&"+_u5_uOkw[ii]+"=")) > -1) {
    k=_u5_ur.substring(i+_u5_uOkw[ii].length+2,_u5_ur.length);
    if ((i=k.indexOf("&")) > -1) k=k.substring(0,i);
    for (var yy=0;yy<_u5_uOno.length;yy++) {
     if (_u5_uOno[yy].toLowerCase()==k.toLowerCase()) { _u5_ufno=1; break; }
    }
    if (t) return _u5_uEC(k);
    else return "utmccn=(organic)|utmcsr="+_u5_uEC(_u5_uOsr[ii])+"|"+"utmctr="+_u5_uEC(k)+"|utmcmd=organic";
   }
  }
 }
 return "";
}
function _u5_uBInfo(page) {
 var sr="-",sc="-",ul="-",fl="-",je=1;
 var n=navigator;
 if (self.screen) {
  sr=screen.width+"x"+screen.height;
  sc=screen.colorDepth+"-bit";
 } else if (self.java) {
  var j=java.awt.Toolkit.getDefaultToolkit();
  var s=j.getScreenSize();
  sr=s.width+"x"+s.height;
 }
 if (_u5_ujv=="-" && (!page || page=="")) {
  for (var i=5;i>=0;i--) {
   var t="<script language='JavaScript1."+i+"'>_u5_ujv='1."+i+"';</script>";
   _u5_ubd.write(t);
   if (_u5_ujv!="-") break;
  }
 }
 if (n.language) { ul=n.language.toLowerCase(); }
 else if (n.browserLanguage) { ul=n.browserLanguage.toLowerCase(); }
 je=n.javaEnabled()?1:0;
 if (_u5_uflash) fl=_u5_uFlash();
 return "&utmsr="+sr+"&utmsc="+sc+"&utmul="+ul+"&utmje="+je+"&utmjv="+_u5_ujv+"&utmfl="+fl;
}
function _u5__utmSetTrans() {
 var e;
 if (_u5_ubd.getElementById) e=_u5_ubd.getElementById("utmtrans");
 else if (_u5_ubd.utmform && _u5_ubd.utmform.utmtrans) e=_u5_ubd.utmform.utmtrans;
 if (!e) return;
 var l=e.value.split("UTM:");
 var i,i2,c;
 if (_u5_userv==0 || _u5_userv==2) i=new Array();
 if (_u5_userv==1 || _u5_userv==2) { i2=new Array(); c=_u5_uGCS(); }

 for (var ii=0;ii<l.length;ii++) {
  l[ii]=_u5_uTrim(l[ii]);
  if (l[ii].charAt(0)!='T' && l[ii].charAt(0)!='I') continue;
  var r=Math.round(Math.random()*2147483647);
  if (!_u5_utsp || _u5_utsp=="") _u5_utsp="|";
  var f=l[ii].split(_u5_utsp),s="";
  if (f[0].charAt(0)=='T') {
   s="&utmt=tran"+"&utmn="+r;
   f[1]=_u5_uTrim(f[1]); if(f[1]&&f[1]!="") s+="&utmtid="+escape(f[1]);
   f[2]=_u5_uTrim(f[2]); if(f[2]&&f[2]!="") s+="&utmtst="+escape(f[2]);
   f[3]=_u5_uTrim(f[3]); if(f[3]&&f[3]!="") s+="&utmtto="+escape(f[3]);
   f[4]=_u5_uTrim(f[4]); if(f[4]&&f[4]!="") s+="&utmttx="+escape(f[4]);
   f[5]=_u5_uTrim(f[5]); if(f[5]&&f[5]!="") s+="&utmtsp="+escape(f[5]);
   f[6]=_u5_uTrim(f[6]); if(f[6]&&f[6]!="") s+="&utmtci="+escape(f[6]);
   f[7]=_u5_uTrim(f[7]); if(f[7]&&f[7]!="") s+="&utmtrg="+escape(f[7]);
   f[8]=_u5_uTrim(f[8]); if(f[8]&&f[8]!="") s+="&utmtco="+escape(f[8]);
  } else {
   s="&utmt=item"+"&utmn="+r;
   f[1]=_u5_uTrim(f[1]); if(f[1]&&f[1]!="") s+="&utmtid="+escape(f[1]);
   f[2]=_u5_uTrim(f[2]); if(f[2]&&f[2]!="") s+="&utmipc="+escape(f[2]);
   f[3]=_u5_uTrim(f[3]); if(f[3]&&f[3]!="") s+="&utmipn="+escape(f[3]);
   f[4]=_u5_uTrim(f[4]); if(f[4]&&f[4]!="") s+="&utmiva="+escape(f[4]);
   f[5]=_u5_uTrim(f[5]); if(f[5]&&f[5]!="") s+="&utmipr="+escape(f[5]);
   f[6]=_u5_uTrim(f[6]); if(f[6]&&f[6]!="") s+="&utmiqt="+escape(f[6]);
  }
  if (_u5_userv==0 || _u5_userv==2) {
   i[ii]=new Image(1,1);
   i[ii].src=_u5_ugifpath+"?"+"utmwv="+_u5_uwv+s;
   i[ii].onload=function() { _u5_uVoid(); }
  }
  if (_u5_userv==1 || _u5_userv==2) {
   i2[ii]=new Image(1,1);
   i2[ii].src=_u5_ugifpath2+"?"+"utmwv="+_u5_uwv+s+"&utmac="+_u5_uacct+"&utmcc="+c;
   i2[ii].onload=function() { _u5_uVoid(); }
  }
 }
 return;
}
function _u5_uFlash() {
 var f="-",n=navigator;
 if (n.plugins && n.plugins.length) {
  for (var ii=0;ii<n.plugins.length;ii++) {
   if (n.plugins[ii].name.indexOf('Shockwave Flash')!=-1) {
    f=n.plugins[ii].description.split('Shockwave Flash ')[1];
    break;
   }
  }
 } else if (window.ActiveXObject) {
  for (var ii=10;ii>=2;ii--) {
   try {
    var fl=eval("new ActiveXObject('ShockwaveFlash.ShockwaveFlash."+ii+"');");
    if (fl) { f=ii + '.0'; break; }
   }
   catch(e) {}
  }
 }
 return f;
}
function _u5__utmLinker(l) {
 var p,a="-",b="-",c="-",z="-",v="-";
 var dc=_u5_ubd.cookie;
 if (l && l!="") {
  if (dc) {
   a=_u5_uGC(dc,"__utma="+_u5_udh,";");
   b=_u5_uGC(dc,"__utmb="+_u5_udh,";");
   c=_u5_uGC(dc,"__utmc="+_u5_udh,";");
   z=_u5_uGC(dc,"__utmz="+_u5_udh,";");
   v=_u5_uGC(dc,"__utmv="+_u5_udh,";");
   p="__utma="+a+"&__utmb="+b+"&__utmc="+c+"&__utmz="+escape(z)+"&__utmv="+escape(v);
  }
  if (p) {
   if (l.indexOf("?")<=-1) { document.location=l+"?"+p; }
   else { document.location=l+"&"+p; }
  } else { document.location=l; }
 }
}
function _u5__utmLinkPost(f) {
 var p,a="-",b="-",c="-",z="-",v="-";
 var dc=_u5_ubd.cookie;
 if (!f || !f.action) return;
 if (dc) {
  a=_u5_uGC(dc,"__utma="+_u5_udh,";");
  b=_u5_uGC(dc,"__utmb="+_u5_udh,";");
  c=_u5_uGC(dc,"__utmc="+_u5_udh,";");
  z=_u5_uGC(dc,"__utmz="+_u5_udh,";");
  v=_u5_uGC(dc,"__utmv="+_u5_udh,";");
  p="__utma="+a+"&__utmb="+b+"&__utmc="+c+"&__utmz="+escape(z)+"&__utmv="+escape(v);
 }
 if (p) {
  if (f.action.indexOf("?")<=-1) f.action+="?"+p;
  else f.action+="&"+p;
 }
 return;
}
function _u5__utmSetVar(v) {
 if (!v || v=="") return;
 var r=Math.round(Math.random() * 2147483647);
 _u5_ubd.cookie="__utmv="+_u5_udh+"."+escape(v)+"; path=/; expires=Sun, 18 Jan 2038 00:00:00 GMT;"+_u5_udo;
 var s="&utmt=var&utmn="+r;
 if (_u5_userv==0 || _u5_userv==2) {
  var i=new Image(1,1);
  i.src=_u5_ugifpath+"?"+"utmwv="+_u5_uwv+s;
  i.onload=function() { _u5_uVoid(); }
 }
 if (_u5_userv==1 || _u5_userv==2) {
  var i2=new Image(1,1);
  i2.src=_u5_ugifpath2+"?"+"utmwv="+_u5_uwv+s+"&utmac="+_u5_uacct+"&utmcc="+_u5_uGCS();
  i2.onload=function() { _u5_uVoid(); }
 }
}
function _u5_uGCS() {
 var t,c="",dc=_u5_ubd.cookie;
 if ((t=_u5_uGC(dc,"__utma="+_u5_udh,";"))!="-") c+=escape("__utma="+t+";+");
 if ((t=_u5_uGC(dc,"__utmb="+_u5_udh,";"))!="-") c+=escape("__utmb="+t+";+");
 if ((t=_u5_uGC(dc,"__utmc="+_u5_udh,";"))!="-") c+=escape("__utmc="+t+";+");
 if ((t=_u5_uGC(dc,"__utmz="+_u5_udh,";"))!="-") c+=escape("__utmz="+t+";+");
 if ((t=_u5_uGC(dc,"__utmv="+_u5_udh,";"))!="-") c+=escape("__utmv="+t+";");
 if (c.charAt(c.length-1)=="+") c=c.substring(0,c.length-1);
 return c;
}
function _u5_uGC(l,n,s) {
 if (!l || l=="" || !n || n=="" || !s || s=="") return "-";
 var i,i2,i3,c="-";
 i=l.indexOf(n);
 i3=n.indexOf("=")+1;
 if (i > -1) {
  i2=l.indexOf(s,i); if (i2 < 0) { i2=l.length; }
  c=l.substring((i+i3),i2);
 }
 return c;
}
function _u5_uDomain() {
 if (!_u5_udn || _u5_udn=="" || _u5_udn=="none") { _u5_udn=""; return 1; }
 if (_u5_udn=="auto") {
  var d=_u5_ubd.domain;
  if (d.substring(0,4)=="www.") {
   d=d.substring(4,d.length);
  }
  _u5_udn=d;
 }
 if (_u5_uhash=="off") return 1;
 return _u5_uHash(_u5_udn);
}
function _u5_uHash(d) {
 if (!d || d=="") return 1;
 var h=0,g=0;
 for (var i=d.length-1;i>=0;i--) {
  var c=parseInt(d.charCodeAt(i));
  h=((h << 6) & 0xfffffff) + c + (c << 14);
  if ((g=h & 0xfe00000)!=0) h=(h ^ (g >> 21));
 }
 return h;
}
function _u5_uFixA(c,s,t) {
 if (!c || c=="" || !s || s=="" || !t || t=="") return "-";
 var a=_u5_uGC(c,"__utma="+_u5_udh,s);
 var lt=0,i=0;
 if ((i=a.lastIndexOf(".")) > 9) {
  _u5_uns=a.substring(i+1,a.length);
  _u5_uns=(_u5_uns*1)+1;
  a=a.substring(0,i);
  if ((i=a.lastIndexOf(".")) > 7) {
   lt=a.substring(i+1,a.length);
   a=a.substring(0,i);
  }
  if ((i=a.lastIndexOf(".")) > 5) {
   a=a.substring(0,i);
  }
  a+="."+lt+"."+t+"."+_u5_uns;
 }
 return a;
}
function _u5_uTrim(s) {
  if (!s || s=="") return "";
  while ((s.charAt(0)==' ') || (s.charAt(0)=='\n') || (s.charAt(0,1)=='\r')) s=s.substring(1,s.length);
  while ((s.charAt(s.length-1)==' ') || (s.charAt(s.length-1)=='\n') || (s.charAt(s.length-1)=='\r')) s=s.substring(0,s.length-1);
  return s;
}

function _u5_uEC(s) {
  var n="";
  if (!s || s=="") return "";
  for (var i=0;i<s.length;i++) {if (s.charAt(i)==" ") n+="+"; else n+=s.charAt(i);}
  return n;
}

function _u5__utmVisitorCode() {
 var r=0,t=0,i=0,i2=0,m=31;
 var a=_u5_uGC(_u5_ubd.cookie,"__utma="+_u5_udh,";");
 if ((i=a.indexOf(".",0))<0) return;
 if ((i2=a.indexOf(".",i+1))>0) r=a.substring(i+1,i2); else return "";  
 if ((i=a.indexOf(".",i2+1))>0) t=a.substring(i2+1,i); else return "";  
 var c=new Array('A','B','C','D','E','F','G','H','J','K','L','M','N','P','R','S','T','U','V','W','X','Y','Z','1','2','3','4','5','6','7','8','9');
 return c[r>>28&m]+c[r>>23&m]+c[r>>18&m]+c[r>>13&m]+"-"+c[r>>8&m]+c[r>>3&m]+c[((r&7)<<2)+(t>>30&3)]+c[t>>25&m]+c[t>>20&m]+"-"+c[t>>15&m]+c[t>>10&m]+c[t>>5&m]+c[t&m];
}
