proximic_widget_cl.data = proximic_widget_cl.data + "&" || "";
proximic_widget_cl.data += "mtC=80&mtL=4&maC=0&maL=0&hhD=1&hrB=1&hfT=1&hfS=1&hdA=1";
proximic_widget_cl.css = "@1{font:normal 11px Arial,Helvetica,_sans;@3#000;@6:#f7f3f7;*@4small;*font:x-small;text-align:left!important;}@1 table tr td{*@41em;*font:1em;}@1{border:1px solid #aaa;}@1 .prxmicBox{*@484.6%;}@1 h5{display:block;height:34px;text-indent:-2000px;@6:#c00 url(http://widget.proximic.com/img/logo_proximic.png) no-repeat;}* html @1 h5{@6-image:none;filter:progid:DXImageTransform.Microsoft.AlphaImageLoader(src='http://widget.proximic.com/img/logo_proximic.png',sizingMethod='crop');}@1 h6{height:20px;@6:#C00;@3#fff;@4.98em;padding:5px 0 0 11px;}@1 .prxmicBox{height:600px;overflow:auto;overflow-x:hidden;@9:relative;}* html @1 .prxmicBox{@5-right:-2px;}@1,@1 ul,@1 li,@1 dl,@1 dt,@1 dd,@1 h5,@1 h6{@5:0;padding:0;}@1 div{text-align:left!important;}@1 a{text-decoration:none;cursor:pointer;}@1 a:hover{text-decoration:underline;}@1 @2li{zoom:1;clear:left;list-style:none;@5:0 2px 0 2px;@6:none;}@1@8Plus,@1@8Minus,@1@8Blank{font-weight:bold;display:block;width:100%;@3#000;@6:url(http://widget.proximic.com/img/chn_sprite.png) no-repeat;padding-bottom:5px;}@1@8Plus{@6-@9:right 0;}@1@8Minus{@6-@9:right -39px;}@1@8Blank{@6-@9:right -79px;cursor:default;}@1@8Plus:hover,@1@8Minus:hover{@3#bbb;text-decoration:none;@6-@9:right -19px;}@1@8Blank:hover{text-decoration:none;}@1@8Minus:hover{@6-@9:right -59px;}@1@8Plus em,@1@8Minus em,@1@8Blank em{font-style:normal;@6:#f7f3f7;padding-right:5px;}* html @1@8Plus,* html @1@8Minus,* html @1@8Blank{@6:url(http://widget.proximic.com/img/chn_sprite.gif) no-repeat;}* html @1@8Plus{@6-@9:right 0;}* html @1@8Minus{@6-@9:right -39px;}* html @1@8Blank{@6-@9:right -79px;}* html @1@8Plus:hover,* html @1@8Minus:hover{@6-@9:right -19px;}* html @1@8Minus:hover{@6-@9:right -59px;}@1 @2dl{@3#000;clear:both;@5-bottom:10px;}@1 @2dl:after{content:'.';display:block;height:0;clear:both;visibility:hidden;}@1 @2dt em a{display:block;@3#c80000;font-weight:bold;font-style:normal;overflow:hidden;}@1 @2dt i{float:right;overflow:hidden;@5-top:3px;width:25px;height:7px;@6:#eee;}@1 @2dt i b{display:block;width:15px;height:7px;@6:#aaa;}@1 @2dt img{width:44px;float:left;@5-top:3px;padding:0;}@1 @2dd.prxImgRslt,@1 @2dt.prxImgRslt{@5-left:50px;}@1 ul.ablnks{width:100%;overflow:hidden;}@1 ul.ablnks li{display:inline;clear:none;padding-right:5px;@6:none;@3#666;@5:0;}@1 ul.ablnks li a{@3#666;}@1 .ft{height:16px;@9:relative;@5:0;overflow:hidden;@6:#aaa;*@484.6%;}@1 .ft ul{width:100%;overflow:hidden;padding-top:1px!important;}@1 .ft ul li{@3#fff;border-left-@3#fff;@4.9em;display:inline;clear:none;padding:0 2px 0 3px;@6:none;@5:0;}@1 .ft li.first{padding-left:0;}@1 .ft ul li a{@3#fff;text-decoration:underline;}@1 .ft li.prxHome{visibility:hidden;@9:absolute;top:2px;right:2px;border:0;}@1 .ft li.prxHome a{display:block;height:14px;width:16px;@6:url(http://widget.proximic.com/img/home_off.png) no-repeat;}@1 .ft li.prxHome a:hover{@6:url(http://widget.proximic.com/img/home_on.png);}* html @1 .ft li.prxHome a{@6-image:none;filter:progid:DXImageTransform.Microsoft.AlphaImageLoader(src='http://widget.proximic.com/img/home_off.png',sizingMethod='crop');}@7{z-index:999;@9:absolute;}@7_shadow{@6-@3#000;z-index:1;@9:absolute;top:3px;left:3px;opacity:.18;*filter:alpha(opacity=18);}@7_img{z-index:2;@9:absolute;top:0;left:0;}@7_img img{max-width:200px;max-height:200px;}";

if(typeof PROXIMIC=="undefined"||!PROXIMIC){PROXIMIC=function(){var G=1,A=(0||proximic_widget_cl.d),C="",E=(navigator.appVersion.indexOf("MSIE")>0),F=(navigator.userAgent.indexOf("Opera")>=0),H=document,B=function(K){var I=parseInt(K.width)||220,J=parseInt(K.height)||240;K.wP=K.width?((K.width.indexOf("%")>-1)?true:false):false;if(I<90&&!K.wP){I="90"}if(J<90){J="90"}K.width=I;K.height=J;K.exp=(K.channel_expand||K.exp||"").toUpperCase();K.chn=(K.channel_additional||K.chn||"");K.aid=K.aid?K.aid.toLowerCase():"";K.isIFRAME=K.isIFRAME||false;K.url=(K.query_url||K.url||H.location.href);if(K.isIFRAME&&K.url){K.url=unescape(K.url)}K.txt=(K.txt||K.query_text);K.query_ref=(unescape(K.query_ref)||"");K.style=(K.style||"basic");return K},D=function(J,I){try{J=(I&&I>-1&&I<J.length)?J.substring(0,I)+"...":J;return J.replace(/^\s+|\s+$/g,"")}catch(K){return J}};collectElementsByClass=function(I,J,L,M){var K,N;if(J==null){J=H}if(L==null){L=[]}if(J.className!=null){if(((" "+J.className+" ").indexOf(" "+I+" "))!=-1){L[L.length]=J;if(M){return L}}}N=J.childNodes.length;for(K=0;K<N;++K){collectElementsByClass(I,J.childNodes[K],L,M)}return L};rEc=function(J,I){var K=H.getElementById(J);if(K){K.innerHTML=I}};return{ver:"3_5",w:[0],prxFS:[],stID:0,prxCFP:[],pE:function(I){return(typeof encodeURIComponent=="function")?encodeURIComponent(I):escape(I)},cw:function(){var I=this.w[this.w.length]=new PROXIMIC.widget(),J;I.cl=proximic_widget_cl;I.id=this.w.length-1;this.pCE(I);if(I.cl.height<200&&I.cl.width>500&&!I.cl.wP){I.isHorizontal=true}else{I.isVertical=true}J=new this.jS(I);J.bT(I);J.aT();if(!F){H.write("<div id='ProximicWidget"+I.id+"'><div class=prxmic_"+I.cl.style+"><h5>Proximic</h5><div class=prxmicBox style='text-indent:-1000px'><b>Proximic</b></div></div></div>")}return I},pCE:function(J){var L,K,I=J.cl.exp.split(",");if(!(J.chE.GL=parseInt(I[0]))||I.length>1){for(L=0;L<I.length;L++){if(K=parseInt(I[L])){J.chE.GL=K}else{if((K=I[L].indexOf(":"))<0){J.chE[I[L]]=99}else{J.chE[I[L].substring(0,K)]=parseInt(I[L].substring(K+1))}}}}J.chE.GL=J.chE.GL||1},jC:function(L,J){var K,I;if(!A){K=H.getElementById("ProximicJscriptId"+L);if(K){K.parentNode.removeChild(K)}}I=PROXIMIC.w[L];if(J.error){PROXIMIC.rW(L)}else{I.jL=true;I.json=J;this.oH(L);this.aH(L);K=H.getElementById("ProximicWidget"+L);K.style.visibility="visible";K=H.getElementById("prx"+I.id+"Box");K.style.visibility="visible";this.aE(L);I.fsP=false}},jAC:function(N,J){var L,I,M,K=N.toString().split(".");if(!A){L=H.getElementById("ProximicJscriptId"+N);if(L){L.parentNode.removeChild(L)}}N=K[0];I=PROXIMIC.w[N];if(!J.error){I.apiJson=J;if(F){if(!H.getElementById("prx"+N+"CFP0_title")){H.getElementsByTagName("body")[0].addEventListener("load",function(){PROXIMIC.psR(N)},false)}else{window.setTimeout(function(){PROXIMIC.psR(N)},0)}}else{this.psR(N)}}else{if(K[1]){M=this.prxCFP[N][K[1]];if(M&&M.oldl){window.open(M.oldl,(I.acT?I.acT:"_top"))}}}},rW:function(K){var J=H.getElementById("ProximicWidget"+K),I=PROXIMIC.w[K];if(J){J.parentNode.removeChild(J)}I.json=PROXIMIC.w[K]=I=0},oC:function(){var J=proximic_widget_cl=B(proximic_widget_cl),I,L="#ProximicWidget"+G++,M=" .prxmicChannels li a.prxTitle",K="<style>";if(C.indexOf("-"+J.style+"-")<0&&J.css){I=J.css.replace(/@10/g,"Minus");I=I.replace(/@11/g,"Blank");I=I.replace(/@1/g,".prxmic_"+J.style+" ");I=I.replace(/@2/g,".prxmicChannels ");I=I.replace(/@3/g,"color:");I=I.replace(/@4/g,"font-size:");I=I.replace(/@5/g,"margin");I=I.replace(/@6/g,"background");I=I.replace(/@7/g,"#ProximicWidget_imgview");I=I.replace(/@8/g," a.prxTitle");I=I.replace(/@9/g,"position");K+=I;C+="-"+J.style+"-"}K+=L+" { display:none; visibility:hidden;width:"+J.width+(J.wP?"%;":"px;")+"height:"+J.height+"px;}"+(J.bordercolor?L+" .prxmic_"+J.style+", .prxmic_"+J.style+" table tr td {border-color:#"+J.bordercolor+";}":"")+L+" .prxmicBox, .prxmicBox table tr td{"+(J.bgcolor?" background:#"+J.bgcolor+";":"")+"}";K+=(J.channeltitlecolor?L+M+"Plus{color:#"+J.channeltitlecolor+"}"+L+M+"Minus{color:#"+J.channeltitlecolor+"}"+L+M+"Blank{color:#"+J.channeltitlecolor+"}":"")+(J.channeltitlecolor_mover?L+M+"Plus:hover{color:#"+J.channeltitlecolor_mover+"}"+L+M+"Minus:hover{color:#"+J.channeltitlecolor_mover+"}":"")+(J.bgcolor?L+M+"Plus em{background:#"+J.bgcolor+"}"+L+M+"Minus em{background:#"+J.bgcolor+"}"+L+M+"Blank em{background:#"+J.bgcolor+"}":"")+(J.headercolor?L+" h5,"+L+" h6{background-color:#"+J.headercolor+"}":"")+(J.titlecolor?L+" .prxmicChannels dt a{color:#"+J.titlecolor+"}":"")+(J.textcolor?L+" .prxmicChannels dl{color:#"+J.textcolor+"}":"")+(J.infocolor?L+" ul.ablnks li{color:#"+J.infocolor+"; border-color:#"+J.infocolor+";}"+L+" ul.ablnks li a{color:#"+J.infocolor+"}":"")+"</style>";H.write(K)},psR:function(K){var P=PROXIMIC.w[K],N,I,R,J,S,M,O,L,Q="prx"+K+"CFP";if(P){N=P.apiJson}if(!N){return }if(N.url&&""!=N.url){window.open(N.url,(P.acT?P.acT:"_top"))}else{if(N.item){for(M=0;M<N.item.length;M++){I=N.item[M];if(I.error){continue}R=I.offers.offer[0];if(!R){continue}L=I.num;if(R.name){rEc(Q+L+"_domain",R.name)}if(R.price){rEc(Q+L+"_price",(I.currency?I.currency:"")+R.price)}if(R.url){J=H.getElementById(Q+L+"_title").parentNode.parentNode.parentNode;if(J){J=J.getElementsByTagName("a")}for(O=0;O<J.length;O++){S=J[O];if(S.id.indexOf(Q+L)!=-1){S.href=R.url}}}}}}},oH:function(S,d){var L=H.getElementById("ProximicWidget"+S),N=this.w[S],Y,X,V,f,e,Q,M,R,K,J,O,P,Z=N.json,b="",U="",W="",T,I=0;if(!N.fsC&&N.cl.data){M=N.cl.data.split("&");for(X=0;X<M.length;X++){Q=M[X].split("=");N[Q[0]]=(isNaN(Q[1])?Q[1]:parseInt(Q[1]))}if(N.ilS){if(N.ilS_top==null){N.ilS_top=15}if(N.ilS_left==null){N.ilS_left=7}}}if(Z.aspect[1]&&!Z.aspect[1].channel){Z.aspect.length=1}P="<div class=prxmic_"+N.cl.style+">";P+=(!N.hhD?"<h5>Proximic</h5>":"");if(parseInt(N.cl.width)>400&&Z.aspect.length>1){N.twoCol=true;if(!N.hhD){P+='<h6 style="width:50%; float:right; margin-top:-28px; overflow:hidden;"><span style="padding-left:10px">Infotizement</span></h6>'}}P+="<div class=prxmicBox id=prx"+S+'Box style="'+(N.bD?"height:"+N.bD+"px;":"")+((!N.cl.exp&&N.chns.length<2)?"overflow:hidden;":"")+'">';O=this.prxFS[S]=new Array();T=this.prxCFP[S]=new Array();if(N.fsC){N.chns=[]}N.cI=false;Z.words.fs="find similar";Z.words.home="home";if(Z.words&&Z.words.word){for(Y in Z.words.word){if(Z.words.word[Y].key=="findsimilar"){Z.words.fs=Z.words.word[Y].$}else{if(Z.words.word[Y].key=="home"){Z.words.home=Z.words.word[Y].$}}}}for(Y=0;Y<Z.aspect.length;Y++){f=Z.aspect[Y];if(f.name=="Infotizement"&&Z.aspect.length>1&&!N.twoCol){P+="<h6>Infotizement</h6>"}if(N.twoCol){if(Y==0){P+="<table cellpadding=0 cellspacing=0 border=0 width=";P+="100%";P+="><tr><td valign=top width='";P+=parseInt(N.cl.width/2-1)+"px'>"}else{P+="<td valign=top>"}}P+="<ul class=prxmicChannels>";for(X=0;X<f.channel.length;X++){e=f.channel[X];M="prx"+S+"_"+Y+"Chn"+X;P+="<li id="+M;if(N.twoCol&&E&&Y==0){P+=' style="margin-right:0"'}P+=">";N.chns[N.chns.length]={name:e.name.toUpperCase(),id:M};K=(N.chE[e.name.toUpperCase()]||N.chE.GL);if(f.channel.length>1||Z.aspect.length>1){P+="<a class=prxTitle"+((K>=e.cluster.length)?"Blank":"Plus")+"><em>"+e.name+" ("+e.cluster.length+")</em></a>"}for(V=0;V<e.cluster.length;V++){if(Z.aspect.length==1&&f.channel.length==1&&N.chE[e.name.toUpperCase()]&&V>=N.chE[e.name.toUpperCase()]){break}Q=e.cluster[V].result[0];M="";P+="<dl>";J="url=prxEsc"+Q.title.link+"prxEsc&cid="+e.id+"&cp="+e.cluster[V].id+"&docid="+Q.title.id;if(Q.title.plink){U=' id="prx'+S+"CFP"+I+'_%s"';if(Q.type){if((Q.type).indexOf("info")!=-1){b+=(""!=b?"|":"")+Q.title.ads+"|"+I+"|"+Q.title.plink}if((Q.type).indexOf("link")!=-1){U+=' class="prxCFP"';W=Q.title.link;Q.title.link="#"}else{W=""}}}else{U=""}if(Q.image.link&&Q.image.link!=""&N.cl.img!="0"&&(parseInt(N.cl.width)>100||N.cl.wP)&&N.cl.height>89){N.cI=true;P+="<dt class=img><a"+U.replace(/%s/,"image")+"  name='"+J+"&target=image' href='"+Q.title.link+"'"+(N.acT?" target='"+N.acT+"'":"")+"><img border=0 vspace=0 hspace=0 src="+Q.image.link+"></a></dt>";M=" class=prxImgRslt"}P+="<dt"+M+">"+((Q.proximity&&!N.hrB)?"<i><b style='width:"+parseInt(0.5+Q.proximity.val/100*25)+"px'></b></i>":"")+"<em><a"+U.replace(/%s/,"title")+" name='"+J+"&target=title' href='"+Q.title.link+"'"+(N.acT?" target='"+N.acT+"'":"")+((!N.mtC||N.mtC<=Q.title.$.length)?" title='"+(Q.title.$.replace?Q.title.$.replace(/\'/g,'"'):"")+"'":"")+">";Q.title.$=D(Q.title.$,N.mtC);Q["abstract"]=D(Q["abstract"],N.maC);P+=((N.mtC!=0&&N.mtL!=0)?Q.title.$:"")+"</a></em></dt><dd"+M+">"+((N.maC!=0&&N.maL!=0)?"<span>"+Q["abstract"]+"</span>":"")+"<ul class=ablnks>";R=false;if(!N.hdM&&(Q.domain.$||Q.domain)){P+="<li><a"+U.replace(/%s/,"domain")+" name='"+J+"&target=domain' href='"+(Q.domain.$&&""==U?Q.domain.link:Q.title.link)+"'"+(N.acT?" target='"+N.acT+"'":"")+" class=prxDomain>"+(Q.domain.$||Q.domain)+"</a></li>";R=true}if(!N.hdA&&Q.date){if(R){P+="<li>|</li>"}else{R=true}P+="<li>"+Q.date.$+"</li>"}if(!N.hdP&&Q.price){if(R){P+="<li>|</li>"}else{R=true}P+="<li><a"+U.replace(/%s/,"price")+" name='"+J+"&target=price' href='"+Q.title.link+"'"+(N.acT?" target='"+N.acT+"'":"")+" class=prxDomain>"+(Q.currency?Q.currency:"")+Q.price+"</a></li>"}if(!N.hfR){if(R){P+="<li>|</li>"}P+="<li><a href='#' class=prxFS id='prx"+S+"FS"+O.length+"'>"+Z.words.fs+"</a></li>"}P+="</ul></dd></dl>";O[O.length]=""!=W?W:Q.title.link;if(""!=U){if(""!=W){T[I]={oldl:W,pl:Q.title.ads+"|"+I+"|"+Q.title.plink}}I++}}P+="</li>"}P+="</ul>"}if(""!=b){PROXIMIC.sAR(S,b)}if(N.twoCol){P+="</td>";if(Y!=0){P+="</tr></table>"}}P+="</div>";if(!N.hfO){P+="<div class=ft><ul>"+(N.hfT?"":'<li><a href="http://www.proximic.com/en/about-us/contact-us.html?div_id=prTellafriendDiv&styles=clN_single_theme" target="_blank">Tell a friend</a></li>')+"<li>"+(N.hfT?"":"| ")+'<a href="http://www.proximic.com/" target="_blank">powered by Proximic</a>'+(N.hfS?"":" |")+"</li>"+(N.hfS?"":"<li>"+Z.search_time+"</li>")+'<li class=prxHome><a id="prx'+S+'Home" href="#" title="'+Z.words.home+'"></a></li></ul></div>'}P+="</div>";L.style.display="block";if(N.mtL||N.maL){if(!N.est_font_size&&N.est_font_size!=0){f=L.getElementsByTagName("b");N.est_font_size=f[0].offsetHeight;if(N.est_font_size<13&&N.est_font_size>0){N.est_font_size+=1}}}L.innerHTML=P;P="";if(N.fsC){L=H.getElementById("prx"+S+"Home");if(L&&L.style.visibility!="visible"){L.style.visibility="visible"}}},aH:function(J,V){var M,K,I,Q,L,U,O,T,S,N,R=this.w[J],P=H.getElementById("ProximicWidget"+J);if(!R.bD){N=R.cl.height;if(!R.hhD){O=P.getElementsByTagName("h5");N-=(O[0]?O[0].offsetHeight:0)}if(!R.hfO){N-=P.firstChild.lastChild.offsetHeight}N-=2;K=H.getElementById("prx"+R.id+"Box");if(K){K.style.height=N+"px"}R.bD=N}if(!R.cl.exp&&R.chns.length<2){I=H.getElementById("prx"+R.id+"Box");if(I&&(I.scrollHeight-5)>I.clientHeight){K=H.getElementById(R.chns[0].id);O=K.getElementsByTagName("dl");M=O.length-1;while((I.scrollHeight-5)>I.clientHeight&&M>0){O[M--].style.display="none"}}}else{for(M in R.chns){if(K=H.getElementById(R.chns[M].id)){U=R.chE[R.chns[M].name]||R.chE.GL;if(U==99){continue}O=K.getElementsByTagName("dl");if(O.length<=U){continue}for(L=U;L<O.length;L++){if(O[L]){O[L].style.display="none"}}}}}if(R.isHorizontal){this.aR(R)}if(R.est_font_size&&R.est_font_size>0){T=R.est_font_size*R.mtL;T+=(F?2:3);O=P.getElementsByTagName("dt");if(R.mtL>0){for(M=0;M<O.length;M++){K=O[M];I=K.firstChild;if(I.nodeName!="A"){if(I.nodeName=="I"){I=I.nextSibling}Q=I.firstChild;if(Q.offsetHeight>T){U=Q.innerHTML;if(!Q.title){Q.title=U}if((S=U.indexOf("..."))==(U.length-3)){Q.innerHTML=U.substring(0,S)}L=0;while((L++)<80&&Q.offsetHeight>T&&Q.innerHTML.length>10){Q.innerHTML=Q.innerHTML.substring(0,Q.innerHTML.length-2)}S=Q.innerHTML.lastIndexOf(";");if(S>Q.innerHTML.length-4){S+=1}else{S=Q.innerHTML.length-3}Q.innerHTML=Q.innerHTML.substring(0,S)+"..."}}}}if((R.maC>0||R.maC==null)&&R.maL>0){T=R.est_font_size*(R.maL+1);O=P.getElementsByTagName("dd");for(M=0;M<O.length;M++){K=O[M].firstChild;if(K.offsetHeight>=T){if(K.offsetHeight>(T*2)){K.firstChild.data=K.firstChild.data.substring(0,parseInt(K.firstChild.data.length/1.7))}L=0;while((L++)<100&&K.offsetHeight>=T&&K.firstChild.data.length>10){K.firstChild.data=K.firstChild.data.substring(0,K.firstChild.data.length-6)}K.firstChild.data=K.firstChild.data.substring(0,K.firstChild.data.length-3)+"..."}}}}if(!R.cI&&R.json.aspect.length==1&&R.json.aspect[0].channel.length==1&&!V){this.aR(R)}},aE:function(N){var K,J=this.w[N],I,L=H.getElementById("ProximicWidget"+N),M=L.getElementsByTagName("dt");I=collectElementsByClass("prxDomain",L);for(K=0;K<I.length;K++){I[K].onclick=this.aC}I=collectElementsByClass("prxFS",L);for(K=0;K<I.length;K++){I[K].onclick=this.fS}I=collectElementsByClass("prxTitleBlank",L);I=collectElementsByClass("prxTitlePlus",L,I);for(K=0;K<I.length;K++){I[K].onclick=this.cT;I[K].href="#"}for(K=0;K<M.length;K++){L=M[K].firstChild;if(L.nodeName=="A"&&L.firstChild.nodeName=="IMG"){L.onclick=this.aC;if(!J.cl.exp&&J.chns.length<2&&L.parentNode.parentNode.style.display!="none"){L.firstChild.onload=this.iL;L.firstChild.id="prx"+J.id+"ImgLoad"+J.imgCount++}L.firstChild.onerror=PROXIMIC.iLError;L.firstChild.onmouseover=this.iM;L.firstChild.onmouseout=this.iO}else{if(L.nodeName=="I"){L=L.nextSibling}L.firstChild.onclick=this.aC}}I=collectElementsByClass("prxCFP",H.getElementById("ProximicWidget"+N));for(K=0;K<I.length;K++){I[K].onclick=this.gPL}L=H.getElementById("prx"+J.id+"Home");if(L){L.onclick=this.rH}},gPL:function(){var K=this.id,I=K.substring(3,K.indexOf("CFP")),J=K.substring(K.indexOf("CFP")+3,K.lastIndexOf("_"));if(PROXIMIC.prxCFP[I][J]&&""!=PROXIMIC.prxCFP[I][J].pl){PROXIMIC.aC(null,this);PROXIMIC.sAR(I+"."+J,PROXIMIC.prxCFP[I][J].pl+"&action=link")}return false},sAR:function(N,K){if(!N||!K){return false}var J=N.toString().split("."),I=PROXIMIC.w[J[0]],M,L=I.json.query_proxy+K;M=new PROXIMIC.jS(I,N,L,true);M.bT(I);M.aT()},fS:function(){var M=this.id,J=M.substring(3,M.indexOf("FS")),L=M.substring(M.indexOf("FS")+2),I=PROXIMIC.w[J],K;if(I.fsP){return false}I.fsP=true;I.fsC=true;I.jL=false;K=new PROXIMIC.jS(I,J,PROXIMIC.prxFS[J][L]);K.bT(I);K.aT();return false},rH:function(){var K=this.id,J=K.substring(3,K.indexOf("Home")),I=PROXIMIC.w[J];I.fsC=false;I.jL=false;I.chns=[];jObj=new PROXIMIC.jS(I,J);jObj.bT(I);jObj.aT();return false},aC:function(R,T){var P=H.getElementsByTagName("head").item(0),N,O,J,I,Q,L,K="",M=T?T:R?R.target:this,S=H.createElement("link");S.type="text/css";S.rel="stylesheet";J=M;for(O=0;O<5;O++){J=J.parentNode;if((I=J.id)){break}}if(!I){return }Q=I.substring(3,4);L=PROXIMIC.w[Q];K="http://publisher.proximic.com"+L.json.click;N=M.name.split("prxEsc");for(O=0;O<N.length;O++){K+=(O%2==1)?PROXIMIC.pE(N[O]):N[O]}S.href=K;P.appendChild(S)},cT:function(){var R=this.parentNode.id,O=R.substring(3,R.indexOf("_")),P=PROXIMIC.w[O],I,N,M,K,Q,L,J;if(this.className=="prxTitlePlus"){if(P.twoCol){L=R.substring(R.indexOf("_")+1,R.indexOf("Chn"))}for(M in P.chns){Q=P.chE[P.chns[M].name]||P.chE.GL;if(I=H.getElementById(P.chns[M].id)){if(P.twoCol){J=P.chns[M].id.substring(P.chns[M].id.indexOf("_")+1,P.chns[M].id.indexOf("Chn"));if(J!=L){continue}}N=I.getElementsByTagName("dl");I.firstChild.className="prxTitlePlus";if(P.chns[M].id==R){I.firstChild.className="prxTitle"+((Q>=N.length)?"Blank":"Minus")}for(K=0;K<N.length;K++){if(P.chns[M].id==R){N[K].style.display="block"}else{N[K].style.display="none"}}}}}else{if(this.className=="prxTitleMinus"){for(M in P.chns){Q=P.chE[P.chns[M].name]||P.chE.GL;if(I=H.getElementById(P.chns[M].id)){N=I.getElementsByTagName("dl");I.firstChild.className="prxTitle"+((Q>=N.length)?"Blank":"Plus");for(K=0;K<N.length;K++){if(K<Q){N[K].style.display="block"}else{N[K].style.display="none"}}}}}}I=H.getElementById("prx"+O+"Box");I.scrollTop=this.offsetTop-10;return false},iL:function(){var I;if(!this.id||!(I=PROXIMIC.w[this.id.substring(3,4)])){return }if(I.isVertical){PROXIMIC.aR(I)}},aR:function(I){if(I.daL){return }if(I.isHorizontal){this.aRHorizontally(I)}else{if(I.isVertical){this.aRVertically(I)}}},aRHorizontally:function(I){var N=H.getElementById("ProximicWidget"+I.id).getElementsByTagName("dl"),M=H.getElementById("prx"+I.id+"Box"),J=[],K,L,O;for(K=0;K<N.length;K++){if(N[K].style.display!="none"){J[J.length]=K}}N[J[0]].className="first";N[J[J.length-1]].className="last";if(I.chns.length<2&&N.length<3){O=H.getElementById("prx"+I.id+"Box");O=O.nextSibling;L=parseInt(I.cl.width/3);if(O&&O.className=="ft"){O.style.width=parseInt(L*N.length)+"px"}O=O.parentNode;if(O&&O.className=="prxmic_"+I.cl.style){O.style.paddingLeft=parseInt((I.cl.width-(L*N.length))/2)+"px"}L-=10}else{L=parseInt((I.cl.width/J.length)+1)}do{for(K=0;K<J.length;K++){O=N[J[K]];O.style.width=L+"px"}L--;if(N[J[0]].offsetTop==N[J[J.length-1]].offsetTop){break}}while(M.scrollHeight>(I.cl.height+30)&&parseInt(O.style.width)>100)},aRVertically:function(O){var N=H.getElementById("ProximicWidget"+O.id),J,M,P=[],R=0,Q=0,K,L=N.getElementsByTagName("dl"),I=H.getElementById("prx"+O.id+"Box");if(L.length<2){return }if(I.clientHeight==0){return }if((I.scrollHeight-5)>I.clientHeight){I.style.visibility="hidden";for(J=(L.length-1);J>0;J--){L[J].style.marginTop="5px"}for(J=(L.length-1);J>0;J--){if((I.scrollHeight-5)<=I.clientHeight){break}if(L[J]){L[J].style.display="none"}}}for(J=0;J<L.length;J++){if(L[J].style.display!="none"){P[P.length]=J;R+=L[J].offsetHeight}}Q=parseInt(I.clientHeight-R);Q=parseInt(Q/(P.length+1));if(isNaN(Q)){return }for(J=0;J<P.length;J++){K=L[P[J]];if(E){K.style.display="inline-block"}if(E&&J==0&&!O.ilS){K.style.marginTop=parseInt(Q-10)+"px"}else{M=parseInt(Q);if(O.ilS){K.style.paddingTop=parseInt(M/2)+"px";K.style.paddingBottom=parseInt(M/2)+"px";K.style.backgroundPosition=O.ilS_left+"px "+parseInt(O.ilS_top+(M/2))+"px"}else{K.style.marginTop=M+"px"}}K.style.marginBottom="0"}I.style.visibility="visible";return },iLError:function(){var I,J=this.parentNode.parentNode.parentNode,K=J.getElementsByTagName("dt");for(I=0;I<K.length;I++){if(K[I].className=="prxImgRslt"){K[I].className=""}}K=J.getElementsByTagName("dd");for(I=0;I<K.length;I++){if(K[I].className=="prxImgRslt"){K[I].className=""}}this.parentNode.removeChild(this)},iM:function(M,J,I,N){var L=H.getElementById("ProximicWidget_imgview"),K;if(!L){L=H.createElement("div");L.id="ProximicWidget_imgview";K=H.createElement("div");K.id="ProximicWidget_imgview_img";L.appendChild(K);K=H.createElement("div");K.id="ProximicWidget_imgview_shadow";L.appendChild(K);H.getElementsByTagName("body")[0].appendChild(L)}if(!J){this.onmousemove=function(P){var O=H.getElementById("ProximicWidget_imgview");if(!P){P=window.event}if(O){O.style.left=(parseInt(P.pageX||P.clientX)+10)+"px";O.style.top=parseInt(P.pageY||(P.clientY+H.body.scrollTop))+"px"}};if(!M){M=window.event}if(typeof (stID)!="undefined"){clearTimeout(stID)}stID=setTimeout("PROXIMIC.iM(0,'"+this.src+"',"+parseInt(M.pageX||M.clientX)+","+parseInt(M.pageY||M.clientY)+")",250)}if(J){L=H.getElementById("ProximicWidget_imgview");L.style.display="block";L=H.getElementById("ProximicWidget_imgview_img");L.innerHTML="<img src='"+J+"' onload='PROXIMIC.aZ(this)' >"}},aZ:function(I){if(I.width>200){I.width="200"}else{if(I.height>200){I.height="200"}}var J=H.getElementById("ProximicWidget_imgview_shadow");J.style.height=I.height+"px";J.style.width=I.width+"px"},iO:function(){if(typeof (stID)!="undefined"){clearTimeout(stID)}this.onmousemove="";var I=H.getElementById("ProximicWidget_imgview");if(I){I.style.display="none"}I=H.getElementById("ProximicWidget_imgview_img");if(I){I.innerHTML=""}}}}();PROXIMIC.jS=function(A,C,D,G){var B,F=navigator,E=document;return{fullUrl:(!G?"http://publisher.proximic.com/search"+(A.cl.aid?"/"+A.cl.aid:"")+"?rft=js&lan="+(A.cl.lan?A.cl.lan:(F?(F.systemLanguage||F.browserLanguage||F.userLanguage||F.language):"en").substring(0,2))+(A.cl.chn?"&chn="+A.cl.chn:"")+(A.cl.exp?"&exp="+A.cl.exp:"")+"&aid="+A.cl.aid+"&id=widget"+(A.cl.loc?"&loc="+A.cl.loc:"")+(A.cl.pre?"&pre="+A.cl.pre:"")+(A.cl.enc?"&enc="+A.cl.enc:"")+"&client=js"+PROXIMIC.ver+"&url="+PROXIMIC.pE(D||A.cl.url)+(!A.cl.isIFRAME&&(D||A.cl.url)!=E.location.href?"&ref="+PROXIMIC.pE(E.location.href):"")+(A.cl.isIFRAME&&(A.cl.query_ref!=(D||A.cl.url))?"&ref="+PROXIMIC.pE(A.cl.query_ref):"")+(D?"":(A.cl.txt?"&txt="+PROXIMIC.pE(A.cl.txt):"")):D)+"&call=PROXIMIC."+(G?"jAC":"jC")+"("+(C||PROXIMIC.jS.sC)+",$)&noCacheIE="+(new Date()).getTime(),headLoc:E.getElementsByTagName("head").item(0),scriptId:"ProximicJscriptId"+(C||PROXIMIC.jS.sC++),scriptObj:"",bT:function(){B=E.createElement("script");B.setAttribute("type","text/javascript");B.setAttribute("charset","utf-8");B.setAttribute("src",this.fullUrl);B.setAttribute("id",this.scriptId)},aT:function(){this.headLoc.appendChild(B)}}};PROXIMIC.jS.sC=1;PROXIMIC.widget=function(){return{cl:null,est_font_size:null,fsC:false,fsP:false,twoCol:false,id:null,chE:[],chns:[],jL:false,mtC:null,mtL:null,maC:null,maL:null,dtBlocks:[],imgCount:0,cI:false,bD:0,isVertical:false,isHorizontal:false}}}(function(){if(!document.styleSheets||(navigator.appVersion.indexOf("MSIE")>0&&navigator.appVersion.indexOf("Mac")>0)||navigator.vendor=="KDE"){document.write("<h1>not supported</h1>");return }PROXIMIC.oC();if(navigator.userAgent.indexOf("Opera")>-1){if(!PROXIMIC.oP){PROXIMIC.oP=1}document.write("<div id='ProximicWidget"+(PROXIMIC.oP++)+"'><div class=prxmic><h5>Proximic</h5><div class=prxmicBox style='text-indent:-1000px'><b>Proximic</b></div></div></div>");window.addEventListener("load",PROXIMIC.cw(),false)}else{PROXIMIC.cw()}})();