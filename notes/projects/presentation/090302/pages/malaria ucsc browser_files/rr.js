<!--
function mmLoadMenus() {
  if (window.mm_menu_0119095745_0) return;
      window.mm_menu_0119095745_0 = new Menu("root",200,22,"Verdana, Arial, Helvetica, sans-serif",10,"#FFFFFF","#000000","#7B9EC6","#FFCC00","left","middle",3,0,300,-5,7,true,false,true,0,true,true);
  mm_menu_0119095745_0.addMenuItem("-&nbsp;Introduction","location='aboutus.htm'");
mm_menu_0119095745_0.addMenuItem("-&nbsp;Advisory&nbsp;Board&nbsp;&&nbsp;Management","location='advisory.htm'");
  mm_menu_0119095745_0.addMenuItem("-&nbsp;Main&nbsp;Industry&nbsp;Sectors","location='industrysector.htm'");
  //mm_menu_0119095745_0.addMenuItem("-&nbsp;Testimonials","location='testimonials.htm'");
   mm_menu_0119095745_0.fontWeight="bold";
   mm_menu_0119095745_0.hideOnMouseOut=true;
   mm_menu_0119095745_0.bgColor='#555555';
   mm_menu_0119095745_0.menuBorder=1;
   mm_menu_0119095745_0.menuLiteBgColor='#FFFFFF';
   mm_menu_0119095745_0.menuBorderBgColor='#777777';
window.mm_menu_0119100803_0 = new Menu("root",186,22,"Verdana, Arial, Helvetica, sans-serif",10,"#FFFFFF","#000000","#7B9EC6","#FFCC00","left","middle",3,0,300,-5,7,true,false,true,0,true,true);
  mm_menu_0119100803_0.addMenuItem("-&nbsp;&nbsp;Partner&nbsp;Search","location='partnersearch.htm'");
  mm_menu_0119100803_0.addMenuItem("-&nbsp;&nbsp;Market&nbsp;Analysis","location='marketanalysis.htm'");
  mm_menu_0119100803_0.addMenuItem("-&nbsp;&nbsp;New&nbsp;Market&nbsp;Exploration","location='marketexploration.htm'");
  mm_menu_0119100803_0.addMenuItem("-&nbsp;&nbsp;Competitor&nbsp;Intelligence","location='competition.htm'");
   mm_menu_0119100803_0.fontWeight="bold";
   mm_menu_0119100803_0.hideOnMouseOut=true;
   mm_menu_0119100803_0.bgColor='#555555';
   mm_menu_0119100803_0.menuBorder=1;
   mm_menu_0119100803_0.menuLiteBgColor='#FFFFFF';
   mm_menu_0119100803_0.menuBorderBgColor='#777777';

  window.mm_menu_0119101244_0 = new Menu("root",105,22,"Verdana, Arial, Helvetica, sans-serif",10,"#FFFFFF","#000000","#7B9EC6","#FFCC00","left","middle",3,0,300,-5,7,true,false,true,0,true,true);
   
   mm_menu_0119101244_0.addMenuItem("-&nbsp;&nbsp;Contact&nbsp;Details","location='contactus.htm'");
  mm_menu_0119101244_0.addMenuItem("-&nbsp;&nbsp;Enquiry&nbsp;Form","location='enquiryform.htm'");
   mm_menu_0119101244_0.fontWeight="bold";
   mm_menu_0119101244_0.hideOnMouseOut=true;
   mm_menu_0119101244_0.bgColor='#555555';
   mm_menu_0119101244_0.menuBorder=1;
   mm_menu_0119101244_0.menuLiteBgColor='#FFFFFF';
   mm_menu_0119101244_0.menuBorderBgColor='#777777';

mm_menu_0119101244_0.writeMenus();
} // mmLoadMenus()

function MM_preloadImages() { //v3.0
  var d=document; if(d.images){ if(!d.MM_p) d.MM_p=new Array();
    var i,j=d.MM_p.length,a=MM_preloadImages.arguments; for(i=0; i<a.length; i++)
    if (a[i].indexOf("#")!=0){ d.MM_p[j]=new Image; d.MM_p[j++].src=a[i];}}
}

function MM_swapImgRestore() { //v3.0
  var i,x,a=document.MM_sr; for(i=0;a&&i<a.length&&(x=a[i])&&x.oSrc;i++) x.src=x.oSrc;
}

function MM_findObj(n, d) { //v4.01
  var p,i,x;  if(!d) d=document; if((p=n.indexOf("?"))>0&&parent.frames.length) {
    d=parent.frames[n.substring(p+1)].document; n=n.substring(0,p);}
  if(!(x=d[n])&&d.all) x=d.all[n]; for (i=0;!x&&i<d.forms.length;i++) x=d.forms[i][n];
  for(i=0;!x&&d.layers&&i<d.layers.length;i++) x=MM_findObj(n,d.layers[i].document);
  if(!x && d.getElementById) x=d.getElementById(n); return x;
}

function MM_swapImage() { //v3.0
  var i,j=0,x,a=MM_swapImage.arguments; document.MM_sr=new Array; for(i=0;i<(a.length-2);i+=3)
   if ((x=MM_findObj(a[i]))!=null){document.MM_sr[j++]=x; if(!x.oSrc) x.oSrc=x.src; x.src=a[i+2];}
}
//-->