/*!
 * jQuery JavaScript Library v1.4.4
 * http://jquery.com/
 *
 * Copyright 2010, John Resig
 * Dual licensed under the MIT or GPL Version 2 licenses.
 * http://jquery.org/license
 *
 * Includes Sizzle.js
 * http://sizzlejs.com/
 * Copyright 2010, The Dojo Foundation
 * Released under the MIT, BSD, and GPL Licenses.
 *
 * Date: Thu Nov 11 19:04:53 2010 -0500
 */
(function(E,B){function ka(a,b,d){if(d===B&&a.nodeType===1){d=a.getAttribute("data-"+b);if(typeof d==="string"){try{d=d==="true"?true:d==="false"?false:d==="null"?null:!c.isNaN(d)?parseFloat(d):Ja.test(d)?c.parseJSON(d):d}catch(e){}c.data(a,b,d)}else d=B}return d}function U(){return false}function ca(){return true}function la(a,b,d){d[0].type=a;return c.event.handle.apply(b,d)}function Ka(a){var b,d,e,f,h,l,k,o,x,r,A,C=[];f=[];h=c.data(this,this.nodeType?"events":"__events__");if(typeof h==="function")h=h.events;if(!(a.liveFired===this||!h||!h.live||a.button&&a.type==="click")){if(a.namespace)A=RegExp("(^|\\.)"+a.namespace.split(".").join("\\.(?:.*\\.)?")+"(\\.|$)");a.liveFired=this;var J=h.live.slice(0);for(k=0;k<J.length;k++){h=J[k];h.origType.replace(X,"")===a.type?f.push(h.selector):J.splice(k--,1)}f=c(a.target).closest(f,a.currentTarget);o=0;for(x=f.length;o<x;o++){r=f[o];for(k=0;k<J.length;k++){h=J[k];if(r.selector===h.selector&&(!A||A.test(h.namespace))){l=r.elem;e=null;if(h.preType==="mouseenter"||h.preType==="mouseleave"){a.type=h.preType;e=c(a.relatedTarget).closest(h.selector)[0]}if(!e||e!==l)C.push({elem:l,handleObj:h,level:r.level})}}}o=0;for(x=C.length;o<x;o++){f=C[o];if(d&&f.level>d)break;a.currentTarget=f.elem;a.data=f.handleObj.data;a.handleObj=f.handleObj;A=f.handleObj.origHandler.apply(f.elem,arguments);if(A===false||a.isPropagationStopped()){d=f.level;if(A===false)b=false;if(a.isImmediatePropagationStopped())break}}return b}}function Y(a,b){return(a&&a!=="*"?a+".":"")+b.replace(La,"`").replace(Ma,"&")}function ma(a,b,d){if(c.isFunction(b))return c.grep(a,function(f,h){return!!b.call(f,h,f)===d});else if(b.nodeType)return c.grep(a,function(f){return f===b===d});else if(typeof b==="string"){var e=c.grep(a,function(f){return f.nodeType===1});if(Na.test(b))return c.filter(b,e,!d);else b=c.filter(b,e)}return c.grep(a,function(f){return c.inArray(f,b)>=0===d})}function na(a,b){var d=0;b.each(function(){if(this.nodeName===(a[d]&&a[d].nodeName)){var e=c.data(a[d++]),f=c.data(this,e);if(e=e&&e.events){delete f.handle;f.events={};for(var h in e)for(var l in e[h])c.event.add(this,h,e[h][l],e[h][l].data)}}})}function Oa(a,b){b.src?c.ajax({url:b.src,async:false,dataType:"script"}):c.globalEval(b.text||b.textContent||b.innerHTML||"");b.parentNode&&b.parentNode.removeChild(b)}function oa(a,b,d){var e=b==="width"?a.offsetWidth:a.offsetHeight;if(d==="border")return e;c.each(b==="width"?Pa:Qa,function(){d||(e-=parseFloat(c.css(a,"padding"+this))||0);if(d==="margin")e+=parseFloat(c.css(a,"margin"+this))||0;else e-=parseFloat(c.css(a,"border"+this+"Width"))||0});return e}function da(a,b,d,e){if(c.isArray(b)&&b.length)c.each(b,function(f,h){d||Ra.test(a)?e(a,h):da(a+"["+(typeof h==="object"||c.isArray(h)?f:"")+"]",h,d,e)});else if(!d&&b!=null&&typeof b==="object")c.isEmptyObject(b)?e(a,""):c.each(b,function(f,h){da(a+"["+f+"]",h,d,e)});else e(a,b)}function S(a,b){var d={};c.each(pa.concat.apply([],pa.slice(0,b)),function(){d[this]=a});return d}function qa(a){if(!ea[a]){var b=c("<"+
a+">").appendTo("body"),d=b.css("display");b.remove();if(d==="none"||d==="")d="block";ea[a]=d}return ea[a]}function fa(a){return c.isWindow(a)?a:a.nodeType===9?a.defaultView||a.parentWindow:false}var t=E.document,c=function(){function a(){if(!b.isReady){try{t.documentElement.doScroll("left")}catch(j){setTimeout(a,1);return}b.ready()}}var b=function(j,s){return new b.fn.init(j,s)},d=E.jQuery,e=E.$,f,h=/^(?:[^<]*(<[\w\W]+>)[^>]*$|#([\w\-]+)$)/,l=/\S/,k=/^\s+/,o=/\s+$/,x=/\W/,r=/\d/,A=/^<(\w+)\s*\/?>(?:<\/\1>)?$/,C=/^[\],:{}\s]*$/,J=/\\(?:["\\\/bfnrt]|u[0-9a-fA-F]{4})/g,w=/"[^"\\\n\r]*"|true|false|null|-?\d+(?:\.\d*)?(?:[eE][+\-]?\d+)?/g,I=/(?:^|:|,)(?:\s*\[)+/g,L=/(webkit)[ \/]([\w.]+)/,g=/(opera)(?:.*version)?[ \/]([\w.]+)/,i=/(msie) ([\w.]+)/,n=/(mozilla)(?:.*? rv:([\w.]+))?/,m=navigator.userAgent,p=false,q=[],u,y=Object.prototype.toString,F=Object.prototype.hasOwnProperty,M=Array.prototype.push,N=Array.prototype.slice,O=String.prototype.trim,D=Array.prototype.indexOf,R={};b.fn=b.prototype={init:function(j,s){var v,z,H;if(!j)return this;if(j.nodeType){this.context=this[0]=j;this.length=1;return this}if(j==="body"&&!s&&t.body){this.context=t;this[0]=t.body;this.selector="body";this.length=1;return this}if(typeof j==="string")if((v=h.exec(j))&&(v[1]||!s))if(v[1]){H=s?s.ownerDocument||s:t;if(z=A.exec(j))if(b.isPlainObject(s)){j=[t.createElement(z[1])];b.fn.attr.call(j,s,true)}else j=[H.createElement(z[1])];else{z=b.buildFragment([v[1]],[H]);j=(z.cacheable?z.fragment.cloneNode(true):z.fragment).childNodes}return b.merge(this,j)}else{if((z=t.getElementById(v[2]))&&z.parentNode){if(z.id!==v[2])return f.find(j);this.length=1;this[0]=z}this.context=t;this.selector=j;return this}else if(!s&&!x.test(j)){this.selector=j;this.context=t;j=t.getElementsByTagName(j);return b.merge(this,j)}else return!s||s.jquery?(s||f).find(j):b(s).find(j);else if(b.isFunction(j))return f.ready(j);if(j.selector!==B){this.selector=j.selector;this.context=j.context}return b.makeArray(j,this)},selector:"",jquery:"1.4.4",length:0,size:function(){return this.length},toArray:function(){return N.call(this,0)},get:function(j){return j==null?this.toArray():j<0?this.slice(j)[0]:this[j]},pushStack:function(j,s,v){var z=b();b.isArray(j)?M.apply(z,j):b.merge(z,j);z.prevObject=this;z.context=this.context;if(s==="find")z.selector=this.selector+(this.selector?" ":"")+v;else if(s)z.selector=this.selector+"."+s+"("+v+")";return z},each:function(j,s){return b.each(this,j,s)},ready:function(j){b.bindReady();if(b.isReady)j.call(t,b);else q&&q.push(j);return this},eq:function(j){return j===-1?this.slice(j):this.slice(j,+j+1)},first:function(){return this.eq(0)},last:function(){return this.eq(-1)},slice:function(){return this.pushStack(N.apply(this,arguments),"slice",N.call(arguments).join(","))},map:function(j){return this.pushStack(b.map(this,function(s,v){return j.call(s,v,s)}))},end:function(){return this.prevObject||b(null)},push:M,sort:[].sort,splice:[].splice};b.fn.init.prototype=b.fn;b.extend=b.fn.extend=function(){var j,s,v,z,H,G=arguments[0]||{},K=1,Q=arguments.length,ga=false;if(typeof G==="boolean"){ga=G;G=arguments[1]||{};K=2}if(typeof G!=="object"&&!b.isFunction(G))G={};if(Q===K){G=this;--K}for(;K<Q;K++)if((j=arguments[K])!=null)for(s in j){v=G[s];z=j[s];if(G!==z)if(ga&&z&&(b.isPlainObject(z)||(H=b.isArray(z)))){if(H){H=false;v=v&&b.isArray(v)?v:[]}else v=v&&b.isPlainObject(v)?v:{};G[s]=b.extend(ga,v,z)}else if(z!==B)G[s]=z}return G};b.extend({noConflict:function(j){E.$=e;if(j)E.jQuery=d;return b},isReady:false,readyWait:1,ready:function(j){j===true&&b.readyWait--;if(!b.readyWait||j!==true&&!b.isReady){if(!t.body)return setTimeout(b.ready,1);b.isReady=true;if(!(j!==true&&--b.readyWait>0))if(q){var s=0,v=q;for(q=null;j=v[s++];)j.call(t,b);b.fn.trigger&&b(t).trigger("ready").unbind("ready")}}},bindReady:function(){if(!p){p=true;if(t.readyState==="complete")return setTimeout(b.ready,1);if(t.addEventListener){t.addEventListener("DOMContentLoaded",u,false);E.addEventListener("load",b.ready,false)}else if(t.attachEvent){t.attachEvent("onreadystatechange",u);E.attachEvent("onload",b.ready);var j=false;try{j=E.frameElement==null}catch(s){}t.documentElement.doScroll&&j&&a()}}},isFunction:function(j){return b.type(j)==="function"},isArray:Array.isArray||function(j){return b.type(j)==="array"},isWindow:function(j){return j&&typeof j==="object"&&"setInterval"in j},isNaN:function(j){return j==null||!r.test(j)||isNaN(j)},type:function(j){return j==null?String(j):R[y.call(j)]||"object"},isPlainObject:function(j){if(!j||b.type(j)!=="object"||j.nodeType||b.isWindow(j))return false;if(j.constructor&&!F.call(j,"constructor")&&!F.call(j.constructor.prototype,"isPrototypeOf"))return false;for(var s in j);return s===B||F.call(j,s)},isEmptyObject:function(j){for(var s in j)return false;return true},error:function(j){throw j;},parseJSON:function(j){if(typeof j!=="string"||!j)return null;j=b.trim(j);if(C.test(j.replace(J,"@").replace(w,"]").replace(I,"")))return E.JSON&&E.JSON.parse?E.JSON.parse(j):(new Function("return "+j))();else b.error("Invalid JSON: "+j)},noop:function(){},globalEval:function(j){if(j&&l.test(j)){var s=t.getElementsByTagName("head")[0]||t.documentElement,v=t.createElement("script");v.type="text/javascript";if(b.support.scriptEval)v.appendChild(t.createTextNode(j));else v.text=j;s.insertBefore(v,s.firstChild);s.removeChild(v)}},nodeName:function(j,s){return j.nodeName&&j.nodeName.toUpperCase()===s.toUpperCase()},each:function(j,s,v){var z,H=0,G=j.length,K=G===B||b.isFunction(j);if(v)if(K)for(z in j){if(s.apply(j[z],v)===false)break}else for(;H<G;){if(s.apply(j[H++],v)===false)break}else if(K)for(z in j){if(s.call(j[z],z,j[z])===false)break}else for(v=j[0];H<G&&s.call(v,H,v)!==false;v=j[++H]);return j},trim:O?function(j){return j==null?"":O.call(j)}:function(j){return j==null?"":j.toString().replace(k,"").replace(o,"")},makeArray:function(j,s){var v=s||[];if(j!=null){var z=b.type(j);j.length==null||z==="string"||z==="function"||z==="regexp"||b.isWindow(j)?M.call(v,j):b.merge(v,j)}return v},inArray:function(j,s){if(s.indexOf)return s.indexOf(j);for(var v=0,z=s.length;v<z;v++)if(s[v]===j)return v;return-1},merge:function(j,s){var v=j.length,z=0;if(typeof s.length==="number")for(var H=s.length;z<H;z++)j[v++]=s[z];else for(;s[z]!==B;)j[v++]=s[z++];j.length=v;return j},grep:function(j,s,v){var z=[],H;v=!!v;for(var G=0,K=j.length;G<K;G++){H=!!s(j[G],G);v!==H&&z.push(j[G])}return z},map:function(j,s,v){for(var z=[],H,G=0,K=j.length;G<K;G++){H=s(j[G],G,v);if(H!=null)z[z.length]=H}return z.concat.apply([],z)},guid:1,proxy:function(j,s,v){if(arguments.length===2)if(typeof s==="string"){v=j;j=v[s];s=B}else if(s&&!b.isFunction(s)){v=s;s=B}if(!s&&j)s=function(){return j.apply(v||this,arguments)};if(j)s.guid=j.guid=j.guid||s.guid||b.guid++;return s},access:function(j,s,v,z,H,G){var K=j.length;if(typeof s==="object"){for(var Q in s)b.access(j,Q,s[Q],z,H,v);return j}if(v!==B){z=!G&&z&&b.isFunction(v);for(Q=0;Q<K;Q++)H(j[Q],s,z?v.call(j[Q],Q,H(j[Q],s)):v,G);return j}return K?H(j[0],s):B},now:function(){return(new Date).getTime()},uaMatch:function(j){j=j.toLowerCase();j=L.exec(j)||g.exec(j)||i.exec(j)||j.indexOf("compatible")<0&&n.exec(j)||[];return{browser:j[1]||"",version:j[2]||"0"}},browser:{}});b.each("Boolean Number String Function Array Date RegExp Object".split(" "),function(j,s){R["[object "+s+"]"]=s.toLowerCase()});m=b.uaMatch(m);if(m.browser){b.browser[m.browser]=true;b.browser.version=m.version}if(b.browser.webkit)b.browser.safari=true;if(D)b.inArray=function(j,s){return D.call(s,j)};if(!/\s/.test("\u00a0")){k=/^[\s\xA0]+/;o=/[\s\xA0]+$/}f=b(t);if(t.addEventListener)u=function(){t.removeEventListener("DOMContentLoaded",u,false);b.ready()};else if(t.attachEvent)u=function(){if(t.readyState==="complete"){t.detachEvent("onreadystatechange",u);b.ready()}};return E.jQuery=E.$=b}();(function(){c.support={};var a=t.documentElement,b=t.createElement("script"),d=t.createElement("div"),e="script"+c.now();d.style.display="none";d.innerHTML="   <link/><table></table><a href='/a' style='color:red;float:left;opacity:.55;'>a</a><input type='checkbox'/>";var f=d.getElementsByTagName("*"),h=d.getElementsByTagName("a")[0],l=t.createElement("select"),k=l.appendChild(t.createElement("option"));if(!(!f||!f.length||!h)){c.support={leadingWhitespace:d.firstChild.nodeType===3,tbody:!d.getElementsByTagName("tbody").length,htmlSerialize:!!d.getElementsByTagName("link").length,style:/red/.test(h.getAttribute("style")),hrefNormalized:h.getAttribute("href")==="/a",opacity:/^0.55$/.test(h.style.opacity),cssFloat:!!h.style.cssFloat,checkOn:d.getElementsByTagName("input")[0].value==="on",optSelected:k.selected,deleteExpando:true,optDisabled:false,checkClone:false,scriptEval:false,noCloneEvent:true,boxModel:null,inlineBlockNeedsLayout:false,shrinkWrapBlocks:false,reliableHiddenOffsets:true};l.disabled=true;c.support.optDisabled=!k.disabled;b.type="text/javascript";try{b.appendChild(t.createTextNode("window."+e+"=1;"))}catch(o){}a.insertBefore(b,a.firstChild);if(E[e]){c.support.scriptEval=true;delete E[e]}try{delete b.test}catch(x){c.support.deleteExpando=false}a.removeChild(b);if(d.attachEvent&&d.fireEvent){d.attachEvent("onclick",function r(){c.support.noCloneEvent=false;d.detachEvent("onclick",r)});d.cloneNode(true).fireEvent("onclick")}d=t.createElement("div");d.innerHTML="<input type='radio' name='radiotest' checked='checked'/>";a=t.createDocumentFragment();a.appendChild(d.firstChild);c.support.checkClone=a.cloneNode(true).cloneNode(true).lastChild.checked;c(function(){var r=t.createElement("div");r.style.width=r.style.paddingLeft="1px";t.body.appendChild(r);c.boxModel=c.support.boxModel=r.offsetWidth===2;if("zoom"in r.style){r.style.display="inline";r.style.zoom=1;c.support.inlineBlockNeedsLayout=r.offsetWidth===2;r.style.display="";r.innerHTML="<div style='width:4px;'></div>";c.support.shrinkWrapBlocks=r.offsetWidth!==2}r.innerHTML="<table><tr><td style='padding:0;display:none'></td><td>t</td></tr></table>";var A=r.getElementsByTagName("td");c.support.reliableHiddenOffsets=A[0].offsetHeight===0;A[0].style.display="";A[1].style.display="none";c.support.reliableHiddenOffsets=c.support.reliableHiddenOffsets&&A[0].offsetHeight===0;r.innerHTML="";t.body.removeChild(r).style.display="none"});a=function(r){var A=t.createElement("div");r="on"+r;var C=r in A;if(!C){A.setAttribute(r,"return;");C=typeof A[r]==="function"}return C};c.support.submitBubbles=a("submit");c.support.changeBubbles=a("change");a=b=d=f=h=null}})();var ra={},Ja=/^(?:\{.*\}|\[.*\])$/;c.extend({cache:{},uuid:0,expando:"jQuery"+c.now(),noData:{embed:true,object:"clsid:D27CDB6E-AE6D-11cf-96B8-444553540000",applet:true},data:function(a,b,d){if(c.acceptData(a)){a=a==E?ra:a;var e=a.nodeType,f=e?a[c.expando]:null,h=c.cache;if(!(e&&!f&&typeof b==="string"&&d===B)){if(e)f||(a[c.expando]=f=++c.uuid);else h=a;if(typeof b==="object")if(e)h[f]=c.extend(h[f],b);else c.extend(h,b);else if(e&&!h[f])h[f]={};a=e?h[f]:h;if(d!==B)a[b]=d;return typeof b==="string"?a[b]:a}}},removeData:function(a,b){if(c.acceptData(a)){a=a==E?ra:a;var d=a.nodeType,e=d?a[c.expando]:a,f=c.cache,h=d?f[e]:e;if(b){if(h){delete h[b];d&&c.isEmptyObject(h)&&c.removeData(a)}}else if(d&&c.support.deleteExpando)delete a[c.expando];else if(a.removeAttribute)a.removeAttribute(c.expando);else if(d)delete f[e];else for(var l in a)delete a[l]}},acceptData:function(a){if(a.nodeName){var b=c.noData[a.nodeName.toLowerCase()];if(b)return!(b===true||a.getAttribute("classid")!==b)}return true}});c.fn.extend({data:function(a,b){var d=null;if(typeof a==="undefined"){if(this.length){var e=this[0].attributes,f;d=c.data(this[0]);for(var h=0,l=e.length;h<l;h++){f=e[h].name;if(f.indexOf("data-")===0){f=f.substr(5);ka(this[0],f,d[f])}}}return d}else if(typeof a==="object")return this.each(function(){c.data(this,a)});var k=a.split(".");k[1]=k[1]?"."+k[1]:"";if(b===B){d=this.triggerHandler("getData"+k[1]+"!",[k[0]]);if(d===B&&this.length){d=c.data(this[0],a);d=ka(this[0],a,d)}return d===B&&k[1]?this.data(k[0]):d}else return this.each(function(){var o=c(this),x=[k[0],b];o.triggerHandler("setData"+k[1]+"!",x);c.data(this,a,b);o.triggerHandler("changeData"+k[1]+"!",x)})},removeData:function(a){return this.each(function(){c.removeData(this,a)})}});c.extend({queue:function(a,b,d){if(a){b=(b||"fx")+"queue";var e=c.data(a,b);if(!d)return e||[];if(!e||c.isArray(d))e=c.data(a,b,c.makeArray(d));else e.push(d);return e}},dequeue:function(a,b){b=b||"fx";var d=c.queue(a,b),e=d.shift();if(e==="inprogress")e=d.shift();if(e){b==="fx"&&d.unshift("inprogress");e.call(a,function(){c.dequeue(a,b)})}}});c.fn.extend({queue:function(a,b){if(typeof a!=="string"){b=a;a="fx"}if(b===B)return c.queue(this[0],a);return this.each(function(){var d=c.queue(this,a,b);a==="fx"&&d[0]!=="inprogress"&&c.dequeue(this,a)})},dequeue:function(a){return this.each(function(){c.dequeue(this,a)})},delay:function(a,b){a=c.fx?c.fx.speeds[a]||a:a;b=b||"fx";return this.queue(b,function(){var d=this;setTimeout(function(){c.dequeue(d,b)},a)})},clearQueue:function(a){return this.queue(a||"fx",[])}});var sa=/[\n\t]/g,ha=/\s+/,Sa=/\r/g,Ta=/^(?:href|src|style)$/,Ua=/^(?:button|input)$/i,Va=/^(?:button|input|object|select|textarea)$/i,Wa=/^a(?:rea)?$/i,ta=/^(?:radio|checkbox)$/i;c.props={"for":"htmlFor","class":"className",readonly:"readOnly",maxlength:"maxLength",cellspacing:"cellSpacing",rowspan:"rowSpan",colspan:"colSpan",tabindex:"tabIndex",usemap:"useMap",frameborder:"frameBorder"};c.fn.extend({attr:function(a,b){return c.access(this,a,b,true,c.attr)},removeAttr:function(a){return this.each(function(){c.attr(this,a,"");this.nodeType===1&&this.removeAttribute(a)})},addClass:function(a){if(c.isFunction(a))return this.each(function(x){var r=c(this);r.addClass(a.call(this,x,r.attr("class")))});if(a&&typeof a==="string")for(var b=(a||"").split(ha),d=0,e=this.length;d<e;d++){var f=this[d];if(f.nodeType===1)if(f.className){for(var h=" "+f.className+" ",l=f.className,k=0,o=b.length;k<o;k++)if(h.indexOf(" "+b[k]+" ")<0)l+=" "+b[k];f.className=c.trim(l)}else f.className=a}return this},removeClass:function(a){if(c.isFunction(a))return this.each(function(o){var x=c(this);x.removeClass(a.call(this,o,x.attr("class")))});if(a&&typeof a==="string"||a===B)for(var b=(a||"").split(ha),d=0,e=this.length;d<e;d++){var f=this[d];if(f.nodeType===1&&f.className)if(a){for(var h=(" "+f.className+" ").replace(sa," "),l=0,k=b.length;l<k;l++)h=h.replace(" "+b[l]+" "," ");f.className=c.trim(h)}else f.className=""}return this},toggleClass:function(a,b){var d=typeof a,e=typeof b==="boolean";if(c.isFunction(a))return this.each(function(f){var h=c(this);h.toggleClass(a.call(this,f,h.attr("class"),b),b)});return this.each(function(){if(d==="string")for(var f,h=0,l=c(this),k=b,o=a.split(ha);f=o[h++];){k=e?k:!l.hasClass(f);l[k?"addClass":"removeClass"](f)}else if(d==="undefined"||d==="boolean"){this.className&&c.data(this,"__className__",this.className);this.className=this.className||a===false?"":c.data(this,"__className__")||""}})},hasClass:function(a){a=" "+a+" ";for(var b=0,d=this.length;b<d;b++)if((" "+this[b].className+" ").replace(sa," ").indexOf(a)>-1)return true;return false},val:function(a){if(!arguments.length){var b=this[0];if(b){if(c.nodeName(b,"option")){var d=b.attributes.value;return!d||d.specified?b.value:b.text}if(c.nodeName(b,"select")){var e=b.selectedIndex;d=[];var f=b.options;b=b.type==="select-one";if(e<0)return null;var h=b?e:0;for(e=b?e+1:f.length;h<e;h++){var l=f[h];if(l.selected&&(c.support.optDisabled?!l.disabled:l.getAttribute("disabled")===null)&&(!l.parentNode.disabled||!c.nodeName(l.parentNode,"optgroup"))){a=c(l).val();if(b)return a;d.push(a)}}return d}if(ta.test(b.type)&&!c.support.checkOn)return b.getAttribute("value")===null?"on":b.value;return(b.value||"").replace(Sa,"")}return B}var k=c.isFunction(a);return this.each(function(o){var x=c(this),r=a;if(this.nodeType===1){if(k)r=a.call(this,o,x.val());if(r==null)r="";else if(typeof r==="number")r+="";else if(c.isArray(r))r=c.map(r,function(C){return C==null?"":C+""});if(c.isArray(r)&&ta.test(this.type))this.checked=c.inArray(x.val(),r)>=0;else if(c.nodeName(this,"select")){var A=c.makeArray(r);c("option",this).each(function(){this.selected=c.inArray(c(this).val(),A)>=0});if(!A.length)this.selectedIndex=-1}else this.value=r}})}});c.extend({attrFn:{val:true,css:true,html:true,text:true,data:true,width:true,height:true,offset:true},attr:function(a,b,d,e){if(!a||a.nodeType===3||a.nodeType===8)return B;if(e&&b in c.attrFn)return c(a)[b](d);e=a.nodeType!==1||!c.isXMLDoc(a);var f=d!==B;b=e&&c.props[b]||b;var h=Ta.test(b);if((b in a||a[b]!==B)&&e&&!h){if(f){b==="type"&&Ua.test(a.nodeName)&&a.parentNode&&c.error("type property can't be changed");if(d===null)a.nodeType===1&&a.removeAttribute(b);else a[b]=d}if(c.nodeName(a,"form")&&a.getAttributeNode(b))return a.getAttributeNode(b).nodeValue;if(b==="tabIndex")return(b=a.getAttributeNode("tabIndex"))&&b.specified?b.value:Va.test(a.nodeName)||Wa.test(a.nodeName)&&a.href?0:B;return a[b]}if(!c.support.style&&e&&b==="style"){if(f)a.style.cssText=""+d;return a.style.cssText}f&&a.setAttribute(b,""+d);if(!a.attributes[b]&&a.hasAttribute&&!a.hasAttribute(b))return B;a=!c.support.hrefNormalized&&e&&h?a.getAttribute(b,2):a.getAttribute(b);return a===null?B:a}});var X=/\.(.*)$/,ia=/^(?:textarea|input|select)$/i,La=/\./g,Ma=/ /g,Xa=/[^\w\s.|`]/g,Ya=function(a){return a.replace(Xa,"\\$&")},ua={focusin:0,focusout:0};c.event={add:function(a,b,d,e){if(!(a.nodeType===3||a.nodeType===8)){if(c.isWindow(a)&&a!==E&&!a.frameElement)a=E;if(d===false)d=U;else if(!d)return;var f,h;if(d.handler){f=d;d=f.handler}if(!d.guid)d.guid=c.guid++;if(h=c.data(a)){var l=a.nodeType?"events":"__events__",k=h[l],o=h.handle;if(typeof k==="function"){o=k.handle;k=k.events}else if(!k){a.nodeType||(h[l]=h=function(){});h.events=k={}}if(!o)h.handle=o=function(){return typeof c!=="undefined"&&!c.event.triggered?c.event.handle.apply(o.elem,arguments):B};o.elem=a;b=b.split(" ");for(var x=0,r;l=b[x++];){h=f?c.extend({},f):{handler:d,data:e};if(l.indexOf(".")>-1){r=l.split(".");l=r.shift();h.namespace=r.slice(0).sort().join(".")}else{r=[];h.namespace=""}h.type=l;if(!h.guid)h.guid=d.guid;var A=k[l],C=c.event.special[l]||{};if(!A){A=k[l]=[];if(!C.setup||C.setup.call(a,e,r,o)===false)if(a.addEventListener)a.addEventListener(l,o,false);else a.attachEvent&&a.attachEvent("on"+l,o)}if(C.add){C.add.call(a,h);if(!h.handler.guid)h.handler.guid=d.guid}A.push(h);c.event.global[l]=true}a=null}}},global:{},remove:function(a,b,d,e){if(!(a.nodeType===3||a.nodeType===8)){if(d===false)d=U;var f,h,l=0,k,o,x,r,A,C,J=a.nodeType?"events":"__events__",w=c.data(a),I=w&&w[J];if(w&&I){if(typeof I==="function"){w=I;I=I.events}if(b&&b.type){d=b.handler;b=b.type}if(!b||typeof b==="string"&&b.charAt(0)==="."){b=b||"";for(f in I)c.event.remove(a,f+b)}else{for(b=b.split(" ");f=b[l++];){r=f;k=f.indexOf(".")<0;o=[];if(!k){o=f.split(".");f=o.shift();x=RegExp("(^|\\.)"+
c.map(o.slice(0).sort(),Ya).join("\\.(?:.*\\.)?")+"(\\.|$)")}if(A=I[f])if(d){r=c.event.special[f]||{};for(h=e||0;h<A.length;h++){C=A[h];if(d.guid===C.guid){if(k||x.test(C.namespace)){e==null&&A.splice(h--,1);r.remove&&r.remove.call(a,C)}if(e!=null)break}}if(A.length===0||e!=null&&A.length===1){if(!r.teardown||r.teardown.call(a,o)===false)c.removeEvent(a,f,w.handle);delete I[f]}}else for(h=0;h<A.length;h++){C=A[h];if(k||x.test(C.namespace)){c.event.remove(a,r,C.handler,h);A.splice(h--,1)}}}if(c.isEmptyObject(I)){if(b=w.handle)b.elem=null;delete w.events;delete w.handle;if(typeof w==="function")c.removeData(a,J);else c.isEmptyObject(w)&&c.removeData(a)}}}}},trigger:function(a,b,d,e){var f=a.type||a;if(!e){a=typeof a==="object"?a[c.expando]?a:c.extend(c.Event(f),a):c.Event(f);if(f.indexOf("!")>=0){a.type=f=f.slice(0,-1);a.exclusive=true}if(!d){a.stopPropagation();c.event.global[f]&&c.each(c.cache,function(){this.events&&this.events[f]&&c.event.trigger(a,b,this.handle.elem)})}if(!d||d.nodeType===3||d.nodeType===8)return B;a.result=B;a.target=d;b=c.makeArray(b);b.unshift(a)}a.currentTarget=d;(e=d.nodeType?c.data(d,"handle"):(c.data(d,"__events__")||{}).handle)&&e.apply(d,b);e=d.parentNode||d.ownerDocument;try{if(!(d&&d.nodeName&&c.noData[d.nodeName.toLowerCase()]))if(d["on"+f]&&d["on"+f].apply(d,b)===false){a.result=false;a.preventDefault()}}catch(h){}if(!a.isPropagationStopped()&&e)c.event.trigger(a,b,e,true);else if(!a.isDefaultPrevented()){var l;e=a.target;var k=f.replace(X,""),o=c.nodeName(e,"a")&&k==="click",x=c.event.special[k]||{};if((!x._default||x._default.call(d,a)===false)&&!o&&!(e&&e.nodeName&&c.noData[e.nodeName.toLowerCase()])){try{if(e[k]){if(l=e["on"+k])e["on"+k]=null;c.event.triggered=true;e[k]()}}catch(r){}if(l)e["on"+k]=l;c.event.triggered=false}}},handle:function(a){var b,d,e,f;d=[];var h=c.makeArray(arguments);a=h[0]=c.event.fix(a||E.event);a.currentTarget=this;b=a.type.indexOf(".")<0&&!a.exclusive;if(!b){e=a.type.split(".");a.type=e.shift();d=e.slice(0).sort();e=RegExp("(^|\\.)"+
d.join("\\.(?:.*\\.)?")+"(\\.|$)")}a.namespace=a.namespace||d.join(".");f=c.data(this,this.nodeType?"events":"__events__");if(typeof f==="function")f=f.events;d=(f||{})[a.type];if(f&&d){d=d.slice(0);f=0;for(var l=d.length;f<l;f++){var k=d[f];if(b||e.test(k.namespace)){a.handler=k.handler;a.data=k.data;a.handleObj=k;k=k.handler.apply(this,h);if(k!==B){a.result=k;if(k===false){a.preventDefault();a.stopPropagation()}}if(a.isImmediatePropagationStopped())break}}}return a.result},props:"altKey attrChange attrName bubbles button cancelable charCode clientX clientY ctrlKey currentTarget data detail eventPhase fromElement handler keyCode layerX layerY metaKey newValue offsetX offsetY pageX pageY prevValue relatedNode relatedTarget screenX screenY shiftKey srcElement target toElement view wheelDelta which".split(" "),fix:function(a){if(a[c.expando])return a;var b=a;a=c.Event(b);for(var d=this.props.length,e;d;){e=this.props[--d];a[e]=b[e]}if(!a.target)a.target=a.srcElement||t;if(a.target.nodeType===3)a.target=a.target.parentNode;if(!a.relatedTarget&&a.fromElement)a.relatedTarget=a.fromElement===a.target?a.toElement:a.fromElement;if(a.pageX==null&&a.clientX!=null){b=t.documentElement;d=t.body;a.pageX=a.clientX+(b&&b.scrollLeft||d&&d.scrollLeft||0)-(b&&b.clientLeft||d&&d.clientLeft||0);a.pageY=a.clientY+(b&&b.scrollTop||d&&d.scrollTop||0)-(b&&b.clientTop||d&&d.clientTop||0)}if(a.which==null&&(a.charCode!=null||a.keyCode!=null))a.which=a.charCode!=null?a.charCode:a.keyCode;if(!a.metaKey&&a.ctrlKey)a.metaKey=a.ctrlKey;if(!a.which&&a.button!==B)a.which=a.button&1?1:a.button&2?3:a.button&4?2:0;return a},guid:1E8,proxy:c.proxy,special:{ready:{setup:c.bindReady,teardown:c.noop},live:{add:function(a){c.event.add(this,Y(a.origType,a.selector),c.extend({},a,{handler:Ka,guid:a.handler.guid}))},remove:function(a){c.event.remove(this,Y(a.origType,a.selector),a)}},beforeunload:{setup:function(a,b,d){if(c.isWindow(this))this.onbeforeunload=d},teardown:function(a,b){if(this.onbeforeunload===b)this.onbeforeunload=null}}}};c.removeEvent=t.removeEventListener?function(a,b,d){a.removeEventListener&&a.removeEventListener(b,d,false)}:function(a,b,d){a.detachEvent&&a.detachEvent("on"+b,d)};c.Event=function(a){if(!this.preventDefault)return new c.Event(a);if(a&&a.type){this.originalEvent=a;this.type=a.type}else this.type=a;this.timeStamp=c.now();this[c.expando]=true};c.Event.prototype={preventDefault:function(){this.isDefaultPrevented=ca;var a=this.originalEvent;if(a)if(a.preventDefault)a.preventDefault();else a.returnValue=false},stopPropagation:function(){this.isPropagationStopped=ca;var a=this.originalEvent;if(a){a.stopPropagation&&a.stopPropagation();a.cancelBubble=true}},stopImmediatePropagation:function(){this.isImmediatePropagationStopped=ca;this.stopPropagation()},isDefaultPrevented:U,isPropagationStopped:U,isImmediatePropagationStopped:U};var va=function(a){var b=a.relatedTarget;try{for(;b&&b!==this;)b=b.parentNode;if(b!==this){a.type=a.data;c.event.handle.apply(this,arguments)}}catch(d){}},wa=function(a){a.type=a.data;c.event.handle.apply(this,arguments)};c.each({mouseenter:"mouseover",mouseleave:"mouseout"},function(a,b){c.event.special[a]={setup:function(d){c.event.add(this,b,d&&d.selector?wa:va,a)},teardown:function(d){c.event.remove(this,b,d&&d.selector?wa:va)}}});if(!c.support.submitBubbles)c.event.special.submit={setup:function(){if(this.nodeName.toLowerCase()!=="form"){c.event.add(this,"click.specialSubmit",function(a){var b=a.target,d=b.type;if((d==="submit"||d==="image")&&c(b).closest("form").length){a.liveFired=B;return la("submit",this,arguments)}});c.event.add(this,"keypress.specialSubmit",function(a){var b=a.target,d=b.type;if((d==="text"||d==="password")&&c(b).closest("form").length&&a.keyCode===13){a.liveFired=B;return la("submit",this,arguments)}})}else return false},teardown:function(){c.event.remove(this,".specialSubmit")}};if(!c.support.changeBubbles){var V,xa=function(a){var b=a.type,d=a.value;if(b==="radio"||b==="checkbox")d=a.checked;else if(b==="select-multiple")d=a.selectedIndex>-1?c.map(a.options,function(e){return e.selected}).join("-"):"";else if(a.nodeName.toLowerCase()==="select")d=a.selectedIndex;return d},Z=function(a,b){var d=a.target,e,f;if(!(!ia.test(d.nodeName)||d.readOnly)){e=c.data(d,"_change_data");f=xa(d);if(a.type!=="focusout"||d.type!=="radio")c.data(d,"_change_data",f);if(!(e===B||f===e))if(e!=null||f){a.type="change";a.liveFired=B;return c.event.trigger(a,b,d)}}};c.event.special.change={filters:{focusout:Z,beforedeactivate:Z,click:function(a){var b=a.target,d=b.type;if(d==="radio"||d==="checkbox"||b.nodeName.toLowerCase()==="select")return Z.call(this,a)},keydown:function(a){var b=a.target,d=b.type;if(a.keyCode===13&&b.nodeName.toLowerCase()!=="textarea"||a.keyCode===32&&(d==="checkbox"||d==="radio")||d==="select-multiple")return Z.call(this,a)},beforeactivate:function(a){a=a.target;c.data(a,"_change_data",xa(a))}},setup:function(){if(this.type==="file")return false;for(var a in V)c.event.add(this,a+".specialChange",V[a]);return ia.test(this.nodeName)},teardown:function(){c.event.remove(this,".specialChange");return ia.test(this.nodeName)}};V=c.event.special.change.filters;V.focus=V.beforeactivate}t.addEventListener&&c.each({focus:"focusin",blur:"focusout"},function(a,b){function d(e){e=c.event.fix(e);e.type=b;return c.event.trigger(e,null,e.target)}c.event.special[b]={setup:function(){ua[b]++===0&&t.addEventListener(a,d,true)},teardown:function(){--ua[b]===0&&t.removeEventListener(a,d,true)}}});c.each(["bind","one"],function(a,b){c.fn[b]=function(d,e,f){if(typeof d==="object"){for(var h in d)this[b](h,e,d[h],f);return this}if(c.isFunction(e)||e===false){f=e;e=B}var l=b==="one"?c.proxy(f,function(o){c(this).unbind(o,l);return f.apply(this,arguments)}):f;if(d==="unload"&&b!=="one")this.one(d,e,f);else{h=0;for(var k=this.length;h<k;h++)c.event.add(this[h],d,l,e)}return this}});c.fn.extend({unbind:function(a,b){if(typeof a==="object"&&!a.preventDefault)for(var d in a)this.unbind(d,a[d]);else{d=0;for(var e=this.length;d<e;d++)c.event.remove(this[d],a,b)}return this},delegate:function(a,b,d,e){return this.live(b,d,e,a)},undelegate:function(a,b,d){return arguments.length===0?this.unbind("live"):this.die(b,null,d,a)},trigger:function(a,b){return this.each(function(){c.event.trigger(a,b,this)})},triggerHandler:function(a,b){if(this[0]){var d=c.Event(a);d.preventDefault();d.stopPropagation();c.event.trigger(d,b,this[0]);return d.result}},toggle:function(a){for(var b=arguments,d=1;d<b.length;)c.proxy(a,b[d++]);return this.click(c.proxy(a,function(e){var f=(c.data(this,"lastToggle"+a.guid)||0)%d;c.data(this,"lastToggle"+a.guid,f+1);e.preventDefault();return b[f].apply(this,arguments)||false}))},hover:function(a,b){return this.mouseenter(a).mouseleave(b||a)}});var ya={focus:"focusin",blur:"focusout",mouseenter:"mouseover",mouseleave:"mouseout"};c.each(["live","die"],function(a,b){c.fn[b]=function(d,e,f,h){var l,k=0,o,x,r=h||this.selector;h=h?this:c(this.context);if(typeof d==="object"&&!d.preventDefault){for(l in d)h[b](l,e,d[l],r);return this}if(c.isFunction(e)){f=e;e=B}for(d=(d||"").split(" ");(l=d[k++])!=null;){o=X.exec(l);x="";if(o){x=o[0];l=l.replace(X,"")}if(l==="hover")d.push("mouseenter"+x,"mouseleave"+x);else{o=l;if(l==="focus"||l==="blur"){d.push(ya[l]+x);l+=x}else l=(ya[l]||l)+x;if(b==="live"){x=0;for(var A=h.length;x<A;x++)c.event.add(h[x],"live."+Y(l,r),{data:e,selector:r,handler:f,origType:l,origHandler:f,preType:o})}else h.unbind("live."+Y(l,r),f)}}return this}});c.each("blur focus focusin focusout load resize scroll unload click dblclick mousedown mouseup mousemove mouseover mouseout mouseenter mouseleave change select submit keydown keypress keyup error".split(" "),function(a,b){c.fn[b]=function(d,e){if(e==null){e=d;d=null}return arguments.length>0?this.bind(b,d,e):this.trigger(b)};if(c.attrFn)c.attrFn[b]=true});E.attachEvent&&!E.addEventListener&&c(E).bind("unload",function(){for(var a in c.cache)if(c.cache[a].handle)try{c.event.remove(c.cache[a].handle.elem)}catch(b){}});(function(){function a(g,i,n,m,p,q){p=0;for(var u=m.length;p<u;p++){var y=m[p];if(y){var F=false;for(y=y[g];y;){if(y.sizcache===n){F=m[y.sizset];break}if(y.nodeType===1&&!q){y.sizcache=n;y.sizset=p}if(y.nodeName.toLowerCase()===i){F=y;break}y=y[g]}m[p]=F}}}function b(g,i,n,m,p,q){p=0;for(var u=m.length;p<u;p++){var y=m[p];if(y){var F=false;for(y=y[g];y;){if(y.sizcache===n){F=m[y.sizset];break}if(y.nodeType===1){if(!q){y.sizcache=n;y.sizset=p}if(typeof i!=="string"){if(y===i){F=true;break}}else if(k.filter(i,[y]).length>0){F=y;break}}y=y[g]}m[p]=F}}}var d=/((?:\((?:\([^()]+\)|[^()]+)+\)|\[(?:\[[^\[\]]*\]|['"][^'"]*['"]|[^\[\]'"]+)+\]|\\.|[^ >+~,(\[\\]+)+|[>+~])(\s*,\s*)?((?:.|\r|\n)*)/g,e=0,f=Object.prototype.toString,h=false,l=true;[0,0].sort(function(){l=false;return 0});var k=function(g,i,n,m){n=n||[];var p=i=i||t;if(i.nodeType!==1&&i.nodeType!==9)return[];if(!g||typeof g!=="string")return n;var q,u,y,F,M,N=true,O=k.isXML(i),D=[],R=g;do{d.exec("");if(q=d.exec(R)){R=q[3];D.push(q[1]);if(q[2]){F=q[3];break}}}while(q);if(D.length>1&&x.exec(g))if(D.length===2&&o.relative[D[0]])u=L(D[0]+D[1],i);else for(u=o.relative[D[0]]?[i]:k(D.shift(),i);D.length;){g=D.shift();if(o.relative[g])g+=D.shift();u=L(g,u)}else{if(!m&&D.length>1&&i.nodeType===9&&!O&&o.match.ID.test(D[0])&&!o.match.ID.test(D[D.length-1])){q=k.find(D.shift(),i,O);i=q.expr?k.filter(q.expr,q.set)[0]:q.set[0]}if(i){q=m?{expr:D.pop(),set:C(m)}:k.find(D.pop(),D.length===1&&(D[0]==="~"||D[0]==="+")&&i.parentNode?i.parentNode:i,O);u=q.expr?k.filter(q.expr,q.set):q.set;if(D.length>0)y=C(u);else N=false;for(;D.length;){q=M=D.pop();if(o.relative[M])q=D.pop();else M="";if(q==null)q=i;o.relative[M](y,q,O)}}else y=[]}y||(y=u);y||k.error(M||g);if(f.call(y)==="[object Array]")if(N)if(i&&i.nodeType===1)for(g=0;y[g]!=null;g++){if(y[g]&&(y[g]===true||y[g].nodeType===1&&k.contains(i,y[g])))n.push(u[g])}else for(g=0;y[g]!=null;g++)y[g]&&y[g].nodeType===1&&n.push(u[g]);else n.push.apply(n,y);else C(y,n);if(F){k(F,p,n,m);k.uniqueSort(n)}return n};k.uniqueSort=function(g){if(w){h=l;g.sort(w);if(h)for(var i=1;i<g.length;i++)g[i]===g[i-1]&&g.splice(i--,1)}return g};k.matches=function(g,i){return k(g,null,null,i)};k.matchesSelector=function(g,i){return k(i,null,null,[g]).length>0};k.find=function(g,i,n){var m;if(!g)return[];for(var p=0,q=o.order.length;p<q;p++){var u,y=o.order[p];if(u=o.leftMatch[y].exec(g)){var F=u[1];u.splice(1,1);if(F.substr(F.length-1)!=="\\"){u[1]=(u[1]||"").replace(/\\/g,"");m=o.find[y](u,i,n);if(m!=null){g=g.replace(o.match[y],"");break}}}}m||(m=i.getElementsByTagName("*"));return{set:m,expr:g}};k.filter=function(g,i,n,m){for(var p,q,u=g,y=[],F=i,M=i&&i[0]&&k.isXML(i[0]);g&&i.length;){for(var N in o.filter)if((p=o.leftMatch[N].exec(g))!=null&&p[2]){var O,D,R=o.filter[N];D=p[1];q=false;p.splice(1,1);if(D.substr(D.length-1)!=="\\"){if(F===y)y=[];if(o.preFilter[N])if(p=o.preFilter[N](p,F,n,y,m,M)){if(p===true)continue}else q=O=true;if(p)for(var j=0;(D=F[j])!=null;j++)if(D){O=R(D,p,j,F);var s=m^!!O;if(n&&O!=null)if(s)q=true;else F[j]=false;else if(s){y.push(D);q=true}}if(O!==B){n||(F=y);g=g.replace(o.match[N],"");if(!q)return[];break}}}if(g===u)if(q==null)k.error(g);else break;u=g}return F};k.error=function(g){throw"Syntax error, unrecognized expression: "+g;};var o=k.selectors={order:["ID","NAME","TAG"],match:{ID:/#((?:[\w\u00c0-\uFFFF\-]|\\.)+)/,CLASS:/\.((?:[\w\u00c0-\uFFFF\-]|\\.)+)/,NAME:/\[name=['"]*((?:[\w\u00c0-\uFFFF\-]|\\.)+)['"]*\]/,ATTR:/\[\s*((?:[\w\u00c0-\uFFFF\-]|\\.)+)\s*(?:(\S?=)\s*(['"]*)(.*?)\3|)\s*\]/,TAG:/^((?:[\w\u00c0-\uFFFF\*\-]|\\.)+)/,CHILD:/:(only|nth|last|first)-child(?:\((even|odd|[\dn+\-]*)\))?/,POS:/:(nth|eq|gt|lt|first|last|even|odd)(?:\((\d*)\))?(?=[^\-]|$)/,PSEUDO:/:((?:[\w\u00c0-\uFFFF\-]|\\.)+)(?:\((['"]?)((?:\([^\)]+\)|[^\(\)]*)+)\2\))?/},leftMatch:{},attrMap:{"class":"className","for":"htmlFor"},attrHandle:{href:function(g){return g.getAttribute("href")}},relative:{"+":function(g,i){var n=typeof i==="string",m=n&&!/\W/.test(i);n=n&&!m;if(m)i=i.toLowerCase();m=0;for(var p=g.length,q;m<p;m++)if(q=g[m]){for(;(q=q.previousSibling)&&q.nodeType!==1;);g[m]=n||q&&q.nodeName.toLowerCase()===i?q||false:q===i}n&&k.filter(i,g,true)},">":function(g,i){var n,m=typeof i==="string",p=0,q=g.length;if(m&&!/\W/.test(i))for(i=i.toLowerCase();p<q;p++){if(n=g[p]){n=n.parentNode;g[p]=n.nodeName.toLowerCase()===i?n:false}}else{for(;p<q;p++)if(n=g[p])g[p]=m?n.parentNode:n.parentNode===i;m&&k.filter(i,g,true)}},"":function(g,i,n){var m,p=e++,q=b;if(typeof i==="string"&&!/\W/.test(i)){m=i=i.toLowerCase();q=a}q("parentNode",i,p,g,m,n)},"~":function(g,i,n){var m,p=e++,q=b;if(typeof i==="string"&&!/\W/.test(i)){m=i=i.toLowerCase();q=a}q("previousSibling",i,p,g,m,n)}},find:{ID:function(g,i,n){if(typeof i.getElementById!=="undefined"&&!n)return(g=i.getElementById(g[1]))&&g.parentNode?[g]:[]},NAME:function(g,i){if(typeof i.getElementsByName!=="undefined"){for(var n=[],m=i.getElementsByName(g[1]),p=0,q=m.length;p<q;p++)m[p].getAttribute("name")===g[1]&&n.push(m[p]);return n.length===0?null:n}},TAG:function(g,i){return i.getElementsByTagName(g[1])}},preFilter:{CLASS:function(g,i,n,m,p,q){g=" "+g[1].replace(/\\/g,"")+" ";if(q)return g;q=0;for(var u;(u=i[q])!=null;q++)if(u)if(p^(u.className&&(" "+u.className+" ").replace(/[\t\n]/g," ").indexOf(g)>=0))n||m.push(u);else if(n)i[q]=false;return false},ID:function(g){return g[1].replace(/\\/g,"")},TAG:function(g){return g[1].toLowerCase()},CHILD:function(g){if(g[1]==="nth"){var i=/(-?)(\d*)n((?:\+|-)?\d*)/.exec(g[2]==="even"&&"2n"||g[2]==="odd"&&"2n+1"||!/\D/.test(g[2])&&"0n+"+g[2]||g[2]);g[2]=i[1]+(i[2]||1)-0;g[3]=i[3]-0}g[0]=e++;return g},ATTR:function(g,i,n,m,p,q){i=g[1].replace(/\\/g,"");if(!q&&o.attrMap[i])g[1]=o.attrMap[i];if(g[2]==="~=")g[4]=" "+g[4]+" ";return g},PSEUDO:function(g,i,n,m,p){if(g[1]==="not")if((d.exec(g[3])||"").length>1||/^\w/.test(g[3]))g[3]=k(g[3],null,null,i);else{g=k.filter(g[3],i,n,true^p);n||m.push.apply(m,g);return false}else if(o.match.POS.test(g[0])||o.match.CHILD.test(g[0]))return true;return g},POS:function(g){g.unshift(true);return g}},filters:{enabled:function(g){return g.disabled===false&&g.type!=="hidden"},disabled:function(g){return g.disabled===true},checked:function(g){return g.checked===true},selected:function(g){return g.selected===true},parent:function(g){return!!g.firstChild},empty:function(g){return!g.firstChild},has:function(g,i,n){return!!k(n[3],g).length},header:function(g){return/h\d/i.test(g.nodeName)},text:function(g){return"text"===g.type},radio:function(g){return"radio"===g.type},checkbox:function(g){return"checkbox"===g.type},file:function(g){return"file"===g.type},password:function(g){return"password"===g.type},submit:function(g){return"submit"===g.type},image:function(g){return"image"===g.type},reset:function(g){return"reset"===g.type},button:function(g){return"button"===g.type||g.nodeName.toLowerCase()==="button"},input:function(g){return/input|select|textarea|button/i.test(g.nodeName)}},setFilters:{first:function(g,i){return i===0},last:function(g,i,n,m){return i===m.length-1},even:function(g,i){return i%2===0},odd:function(g,i){return i%2===1},lt:function(g,i,n){return i<n[3]-0},gt:function(g,i,n){return i>n[3]-0},nth:function(g,i,n){return n[3]-
0===i},eq:function(g,i,n){return n[3]-0===i}},filter:{PSEUDO:function(g,i,n,m){var p=i[1],q=o.filters[p];if(q)return q(g,n,i,m);else if(p==="contains")return(g.textContent||g.innerText||k.getText([g])||"").indexOf(i[3])>=0;else if(p==="not"){i=i[3];n=0;for(m=i.length;n<m;n++)if(i[n]===g)return false;return true}else k.error("Syntax error, unrecognized expression: "+p)},CHILD:function(g,i){var n=i[1],m=g;switch(n){case"only":case"first":for(;m=m.previousSibling;)if(m.nodeType===1)return false;if(n==="first")return true;m=g;case"last":for(;m=m.nextSibling;)if(m.nodeType===1)return false;return true;case"nth":n=i[2];var p=i[3];if(n===1&&p===0)return true;var q=i[0],u=g.parentNode;if(u&&(u.sizcache!==q||!g.nodeIndex)){var y=0;for(m=u.firstChild;m;m=m.nextSibling)if(m.nodeType===1)m.nodeIndex=++y;u.sizcache=q}m=g.nodeIndex-p;return n===0?m===0:m%n===0&&m/n>=0}},ID:function(g,i){return g.nodeType===1&&g.getAttribute("id")===i},TAG:function(g,i){return i==="*"&&g.nodeType===1||g.nodeName.toLowerCase()===i},CLASS:function(g,i){return(" "+(g.className||g.getAttribute("class"))+" ").indexOf(i)>-1},ATTR:function(g,i){var n=i[1];n=o.attrHandle[n]?o.attrHandle[n](g):g[n]!=null?g[n]:g.getAttribute(n);var m=n+"",p=i[2],q=i[4];return n==null?p==="!=":p==="="?m===q:p==="*="?m.indexOf(q)>=0:p==="~="?(" "+m+" ").indexOf(q)>=0:!q?m&&n!==false:p==="!="?m!==q:p==="^="?m.indexOf(q)===0:p==="$="?m.substr(m.length-q.length)===q:p==="|="?m===q||m.substr(0,q.length+1)===q+"-":false},POS:function(g,i,n,m){var p=o.setFilters[i[2]];if(p)return p(g,n,i,m)}}},x=o.match.POS,r=function(g,i){return"\\"+(i-0+1)},A;for(A in o.match){o.match[A]=RegExp(o.match[A].source+/(?![^\[]*\])(?![^\(]*\))/.source);o.leftMatch[A]=RegExp(/(^(?:.|\r|\n)*?)/.source+o.match[A].source.replace(/\\(\d+)/g,r))}var C=function(g,i){g=Array.prototype.slice.call(g,0);if(i){i.push.apply(i,g);return i}return g};try{Array.prototype.slice.call(t.documentElement.childNodes,0)}catch(J){C=function(g,i){var n=0,m=i||[];if(f.call(g)==="[object Array]")Array.prototype.push.apply(m,g);else if(typeof g.length==="number")for(var p=g.length;n<p;n++)m.push(g[n]);else for(;g[n];n++)m.push(g[n]);return m}}var w,I;if(t.documentElement.compareDocumentPosition)w=function(g,i){if(g===i){h=true;return 0}if(!g.compareDocumentPosition||!i.compareDocumentPosition)return g.compareDocumentPosition?-1:1;return g.compareDocumentPosition(i)&4?-1:1};else{w=function(g,i){var n,m,p=[],q=[];n=g.parentNode;m=i.parentNode;var u=n;if(g===i){h=true;return 0}else if(n===m)return I(g,i);else if(n){if(!m)return 1}else return-1;for(;u;){p.unshift(u);u=u.parentNode}for(u=m;u;){q.unshift(u);u=u.parentNode}n=p.length;m=q.length;for(u=0;u<n&&u<m;u++)if(p[u]!==q[u])return I(p[u],q[u]);return u===n?I(g,q[u],-1):I(p[u],i,1)};I=function(g,i,n){if(g===i)return n;for(g=g.nextSibling;g;){if(g===i)return-1;g=g.nextSibling}return 1}}k.getText=function(g){for(var i="",n,m=0;g[m];m++){n=g[m];if(n.nodeType===3||n.nodeType===4)i+=n.nodeValue;else if(n.nodeType!==8)i+=k.getText(n.childNodes)}return i};(function(){var g=t.createElement("div"),i="script"+(new Date).getTime(),n=t.documentElement;g.innerHTML="<a name='"+i+"'/>";n.insertBefore(g,n.firstChild);if(t.getElementById(i)){o.find.ID=function(m,p,q){if(typeof p.getElementById!=="undefined"&&!q)return(p=p.getElementById(m[1]))?p.id===m[1]||typeof p.getAttributeNode!=="undefined"&&p.getAttributeNode("id").nodeValue===m[1]?[p]:B:[]};o.filter.ID=function(m,p){var q=typeof m.getAttributeNode!=="undefined"&&m.getAttributeNode("id");return m.nodeType===1&&q&&q.nodeValue===p}}n.removeChild(g);n=g=null})();(function(){var g=t.createElement("div");g.appendChild(t.createComment(""));if(g.getElementsByTagName("*").length>0)o.find.TAG=function(i,n){var m=n.getElementsByTagName(i[1]);if(i[1]==="*"){for(var p=[],q=0;m[q];q++)m[q].nodeType===1&&p.push(m[q]);m=p}return m};g.innerHTML="<a href='#'></a>";if(g.firstChild&&typeof g.firstChild.getAttribute!=="undefined"&&g.firstChild.getAttribute("href")!=="#")o.attrHandle.href=function(i){return i.getAttribute("href",2)};g=null})();t.querySelectorAll&&function(){var g=k,i=t.createElement("div");i.innerHTML="<p class='TEST'></p>";if(!(i.querySelectorAll&&i.querySelectorAll(".TEST").length===0)){k=function(m,p,q,u){p=p||t;m=m.replace(/\=\s*([^'"\]]*)\s*\]/g,"='$1']");if(!u&&!k.isXML(p))if(p.nodeType===9)try{return C(p.querySelectorAll(m),q)}catch(y){}else if(p.nodeType===1&&p.nodeName.toLowerCase()!=="object"){var F=p.getAttribute("id"),M=F||"__sizzle__";F||p.setAttribute("id",M);try{return C(p.querySelectorAll("#"+M+" "+m),q)}catch(N){}finally{F||p.removeAttribute("id")}}return g(m,p,q,u)};for(var n in g)k[n]=g[n];i=null}}();(function(){var g=t.documentElement,i=g.matchesSelector||g.mozMatchesSelector||g.webkitMatchesSelector||g.msMatchesSelector,n=false;try{i.call(t.documentElement,"[test!='']:sizzle")}catch(m){n=true}if(i)k.matchesSelector=function(p,q){q=q.replace(/\=\s*([^'"\]]*)\s*\]/g,"='$1']");if(!k.isXML(p))try{if(n||!o.match.PSEUDO.test(q)&&!/!=/.test(q))return i.call(p,q)}catch(u){}return k(q,null,null,[p]).length>0}})();(function(){var g=t.createElement("div");g.innerHTML="<div class='test e'></div><div class='test'></div>";if(!(!g.getElementsByClassName||g.getElementsByClassName("e").length===0)){g.lastChild.className="e";if(g.getElementsByClassName("e").length!==1){o.order.splice(1,0,"CLASS");o.find.CLASS=function(i,n,m){if(typeof n.getElementsByClassName!=="undefined"&&!m)return n.getElementsByClassName(i[1])};g=null}}})();k.contains=t.documentElement.contains?function(g,i){return g!==i&&(g.contains?g.contains(i):true)}:t.documentElement.compareDocumentPosition?function(g,i){return!!(g.compareDocumentPosition(i)&16)}:function(){return false};k.isXML=function(g){return(g=(g?g.ownerDocument||g:0).documentElement)?g.nodeName!=="HTML":false};var L=function(g,i){for(var n,m=[],p="",q=i.nodeType?[i]:i;n=o.match.PSEUDO.exec(g);){p+=n[0];g=g.replace(o.match.PSEUDO,"")}g=o.relative[g]?g+"*":g;n=0;for(var u=q.length;n<u;n++)k(g,q[n],m);return k.filter(p,m)};c.find=k;c.expr=k.selectors;c.expr[":"]=c.expr.filters;c.unique=k.uniqueSort;c.text=k.getText;c.isXMLDoc=k.isXML;c.contains=k.contains})();var Za=/Until$/,$a=/^(?:parents|prevUntil|prevAll)/,ab=/,/,Na=/^.[^:#\[\.,]*$/,bb=Array.prototype.slice,cb=c.expr.match.POS;c.fn.extend({find:function(a){for(var b=this.pushStack("","find",a),d=0,e=0,f=this.length;e<f;e++){d=b.length;c.find(a,this[e],b);if(e>0)for(var h=d;h<b.length;h++)for(var l=0;l<d;l++)if(b[l]===b[h]){b.splice(h--,1);break}}return b},has:function(a){var b=c(a);return this.filter(function(){for(var d=0,e=b.length;d<e;d++)if(c.contains(this,b[d]))return true})},not:function(a){return this.pushStack(ma(this,a,false),"not",a)},filter:function(a){return this.pushStack(ma(this,a,true),"filter",a)},is:function(a){return!!a&&c.filter(a,this).length>0},closest:function(a,b){var d=[],e,f,h=this[0];if(c.isArray(a)){var l,k={},o=1;if(h&&a.length){e=0;for(f=a.length;e<f;e++){l=a[e];k[l]||(k[l]=c.expr.match.POS.test(l)?c(l,b||this.context):l)}for(;h&&h.ownerDocument&&h!==b;){for(l in k){e=k[l];if(e.jquery?e.index(h)>-1:c(h).is(e))d.push({selector:l,elem:h,level:o})}h=h.parentNode;o++}}return d}l=cb.test(a)?c(a,b||this.context):null;e=0;for(f=this.length;e<f;e++)for(h=this[e];h;)if(l?l.index(h)>-1:c.find.matchesSelector(h,a)){d.push(h);break}else{h=h.parentNode;if(!h||!h.ownerDocument||h===b)break}d=d.length>1?c.unique(d):d;return this.pushStack(d,"closest",a)},index:function(a){if(!a||typeof a==="string")return c.inArray(this[0],a?c(a):this.parent().children());return c.inArray(a.jquery?a[0]:a,this)},add:function(a,b){var d=typeof a==="string"?c(a,b||this.context):c.makeArray(a),e=c.merge(this.get(),d);return this.pushStack(!d[0]||!d[0].parentNode||d[0].parentNode.nodeType===11||!e[0]||!e[0].parentNode||e[0].parentNode.nodeType===11?e:c.unique(e))},andSelf:function(){return this.add(this.prevObject)}});c.each({parent:function(a){return(a=a.parentNode)&&a.nodeType!==11?a:null},parents:function(a){return c.dir(a,"parentNode")},parentsUntil:function(a,b,d){return c.dir(a,"parentNode",d)},next:function(a){return c.nth(a,2,"nextSibling")},prev:function(a){return c.nth(a,2,"previousSibling")},nextAll:function(a){return c.dir(a,"nextSibling")},prevAll:function(a){return c.dir(a,"previousSibling")},nextUntil:function(a,b,d){return c.dir(a,"nextSibling",d)},prevUntil:function(a,b,d){return c.dir(a,"previousSibling",d)},siblings:function(a){return c.sibling(a.parentNode.firstChild,a)},children:function(a){return c.sibling(a.firstChild)},contents:function(a){return c.nodeName(a,"iframe")?a.contentDocument||a.contentWindow.document:c.makeArray(a.childNodes)}},function(a,b){c.fn[a]=function(d,e){var f=c.map(this,b,d);Za.test(a)||(e=d);if(e&&typeof e==="string")f=c.filter(e,f);f=this.length>1?c.unique(f):f;if((this.length>1||ab.test(e))&&$a.test(a))f=f.reverse();return this.pushStack(f,a,bb.call(arguments).join(","))}});c.extend({filter:function(a,b,d){if(d)a=":not("+a+")";return b.length===1?c.find.matchesSelector(b[0],a)?[b[0]]:[]:c.find.matches(a,b)},dir:function(a,b,d){var e=[];for(a=a[b];a&&a.nodeType!==9&&(d===B||a.nodeType!==1||!c(a).is(d));){a.nodeType===1&&e.push(a);a=a[b]}return e},nth:function(a,b,d){b=b||1;for(var e=0;a;a=a[d])if(a.nodeType===1&&++e===b)break;return a},sibling:function(a,b){for(var d=[];a;a=a.nextSibling)a.nodeType===1&&a!==b&&d.push(a);return d}});var za=/ jQuery\d+="(?:\d+|null)"/g,$=/^\s+/,Aa=/<(?!area|br|col|embed|hr|img|input|link|meta|param)(([\w:]+)[^>]*)\/>/ig,Ba=/<([\w:]+)/,db=/<tbody/i,eb=/<|&#?\w+;/,Ca=/<(?:script|object|embed|option|style)/i,Da=/checked\s*(?:[^=]|=\s*.checked.)/i,fb=/\=([^="'>\s]+\/)>/g,P={option:[1,"<select multiple='multiple'>","</select>"],legend:[1,"<fieldset>","</fieldset>"],thead:[1,"<table>","</table>"],tr:[2,"<table><tbody>","</tbody></table>"],td:[3,"<table><tbody><tr>","</tr></tbody></table>"],col:[2,"<table><tbody></tbody><colgroup>","</colgroup></table>"],area:[1,"<map>","</map>"],_default:[0,"",""]};P.optgroup=P.option;P.tbody=P.tfoot=P.colgroup=P.caption=P.thead;P.th=P.td;if(!c.support.htmlSerialize)P._default=[1,"div<div>","</div>"];c.fn.extend({text:function(a){if(c.isFunction(a))return this.each(function(b){var d=c(this);d.text(a.call(this,b,d.text()))});if(typeof a!=="object"&&a!==B)return this.empty().append((this[0]&&this[0].ownerDocument||t).createTextNode(a));return c.text(this)},wrapAll:function(a){if(c.isFunction(a))return this.each(function(d){c(this).wrapAll(a.call(this,d))});if(this[0]){var b=c(a,this[0].ownerDocument).eq(0).clone(true);this[0].parentNode&&b.insertBefore(this[0]);b.map(function(){for(var d=this;d.firstChild&&d.firstChild.nodeType===1;)d=d.firstChild;return d}).append(this)}return this},wrapInner:function(a){if(c.isFunction(a))return this.each(function(b){c(this).wrapInner(a.call(this,b))});return this.each(function(){var b=c(this),d=b.contents();d.length?d.wrapAll(a):b.append(a)})},wrap:function(a){return this.each(function(){c(this).wrapAll(a)})},unwrap:function(){return this.parent().each(function(){c.nodeName(this,"body")||c(this).replaceWith(this.childNodes)}).end()},append:function(){return this.domManip(arguments,true,function(a){this.nodeType===1&&this.appendChild(a)})},prepend:function(){return this.domManip(arguments,true,function(a){this.nodeType===1&&this.insertBefore(a,this.firstChild)})},before:function(){if(this[0]&&this[0].parentNode)return this.domManip(arguments,false,function(b){this.parentNode.insertBefore(b,this)});else if(arguments.length){var a=c(arguments[0]);a.push.apply(a,this.toArray());return this.pushStack(a,"before",arguments)}},after:function(){if(this[0]&&this[0].parentNode)return this.domManip(arguments,false,function(b){this.parentNode.insertBefore(b,this.nextSibling)});else if(arguments.length){var a=this.pushStack(this,"after",arguments);a.push.apply(a,c(arguments[0]).toArray());return a}},remove:function(a,b){for(var d=0,e;(e=this[d])!=null;d++)if(!a||c.filter(a,[e]).length){if(!b&&e.nodeType===1){c.cleanData(e.getElementsByTagName("*"));c.cleanData([e])}e.parentNode&&e.parentNode.removeChild(e)}return this},empty:function(){for(var a=0,b;(b=this[a])!=null;a++)for(b.nodeType===1&&c.cleanData(b.getElementsByTagName("*"));b.firstChild;)b.removeChild(b.firstChild);return this},clone:function(a){var b=this.map(function(){if(!c.support.noCloneEvent&&!c.isXMLDoc(this)){var d=this.outerHTML,e=this.ownerDocument;if(!d){d=e.createElement("div");d.appendChild(this.cloneNode(true));d=d.innerHTML}return c.clean([d.replace(za,"").replace(fb,'="$1">').replace($,"")],e)[0]}else return this.cloneNode(true)});if(a===true){na(this,b);na(this.find("*"),b.find("*"))}return b},html:function(a){if(a===B)return this[0]&&this[0].nodeType===1?this[0].innerHTML.replace(za,""):null;else if(typeof a==="string"&&!Ca.test(a)&&(c.support.leadingWhitespace||!$.test(a))&&!P[(Ba.exec(a)||["",""])[1].toLowerCase()]){a=a.replace(Aa,"<$1></$2>");try{for(var b=0,d=this.length;b<d;b++)if(this[b].nodeType===1){c.cleanData(this[b].getElementsByTagName("*"));this[b].innerHTML=a}}catch(e){this.empty().append(a)}}else c.isFunction(a)?this.each(function(f){var h=c(this);h.html(a.call(this,f,h.html()))}):this.empty().append(a);return this},replaceWith:function(a){if(this[0]&&this[0].parentNode){if(c.isFunction(a))return this.each(function(b){var d=c(this),e=d.html();d.replaceWith(a.call(this,b,e))});if(typeof a!=="string")a=c(a).detach();return this.each(function(){var b=this.nextSibling,d=this.parentNode;c(this).remove();b?c(b).before(a):c(d).append(a)})}else return this.pushStack(c(c.isFunction(a)?a():a),"replaceWith",a)},detach:function(a){return this.remove(a,true)},domManip:function(a,b,d){var e,f,h,l=a[0],k=[];if(!c.support.checkClone&&arguments.length===3&&typeof l==="string"&&Da.test(l))return this.each(function(){c(this).domManip(a,b,d,true)});if(c.isFunction(l))return this.each(function(x){var r=c(this);a[0]=l.call(this,x,b?r.html():B);r.domManip(a,b,d)});if(this[0]){e=l&&l.parentNode;e=c.support.parentNode&&e&&e.nodeType===11&&e.childNodes.length===this.length?{fragment:e}:c.buildFragment(a,this,k);h=e.fragment;if(f=h.childNodes.length===1?h=h.firstChild:h.firstChild){b=b&&c.nodeName(f,"tr");f=0;for(var o=this.length;f<o;f++)d.call(b?c.nodeName(this[f],"table")?this[f].getElementsByTagName("tbody")[0]||this[f].appendChild(this[f].ownerDocument.createElement("tbody")):this[f]:this[f],f>0||e.cacheable||this.length>1?h.cloneNode(true):h)}k.length&&c.each(k,Oa)}return this}});c.buildFragment=function(a,b,d){var e,f,h;b=b&&b[0]?b[0].ownerDocument||b[0]:t;if(a.length===1&&typeof a[0]==="string"&&a[0].length<512&&b===t&&!Ca.test(a[0])&&(c.support.checkClone||!Da.test(a[0]))){f=true;if(h=c.fragments[a[0]])if(h!==1)e=h}if(!e){e=b.createDocumentFragment();c.clean(a,b,e,d)}if(f)c.fragments[a[0]]=h?e:1;return{fragment:e,cacheable:f}};c.fragments={};c.each({appendTo:"append",prependTo:"prepend",insertBefore:"before",insertAfter:"after",replaceAll:"replaceWith"},function(a,b){c.fn[a]=function(d){var e=[];d=c(d);var f=this.length===1&&this[0].parentNode;if(f&&f.nodeType===11&&f.childNodes.length===1&&d.length===1){d[b](this[0]);return this}else{f=0;for(var h=d.length;f<h;f++){var l=(f>0?this.clone(true):this).get();c(d[f])[b](l);e=e.concat(l)}return this.pushStack(e,a,d.selector)}}});c.extend({clean:function(a,b,d,e){b=b||t;if(typeof b.createElement==="undefined")b=b.ownerDocument||b[0]&&b[0].ownerDocument||t;for(var f=[],h=0,l;(l=a[h])!=null;h++){if(typeof l==="number")l+="";if(l){if(typeof l==="string"&&!eb.test(l))l=b.createTextNode(l);else if(typeof l==="string"){l=l.replace(Aa,"<$1></$2>");var k=(Ba.exec(l)||["",""])[1].toLowerCase(),o=P[k]||P._default,x=o[0],r=b.createElement("div");for(r.innerHTML=o[1]+l+o[2];x--;)r=r.lastChild;if(!c.support.tbody){x=db.test(l);k=k==="table"&&!x?r.firstChild&&r.firstChild.childNodes:o[1]==="<table>"&&!x?r.childNodes:[];for(o=k.length-
1;o>=0;--o)c.nodeName(k[o],"tbody")&&!k[o].childNodes.length&&k[o].parentNode.removeChild(k[o])}!c.support.leadingWhitespace&&$.test(l)&&r.insertBefore(b.createTextNode($.exec(l)[0]),r.firstChild);l=r.childNodes}if(l.nodeType)f.push(l);else f=c.merge(f,l)}}if(d)for(h=0;f[h];h++)if(e&&c.nodeName(f[h],"script")&&(!f[h].type||f[h].type.toLowerCase()==="text/javascript"))e.push(f[h].parentNode?f[h].parentNode.removeChild(f[h]):f[h]);else{f[h].nodeType===1&&f.splice.apply(f,[h+1,0].concat(c.makeArray(f[h].getElementsByTagName("script"))));d.appendChild(f[h])}return f},cleanData:function(a){for(var b,d,e=c.cache,f=c.event.special,h=c.support.deleteExpando,l=0,k;(k=a[l])!=null;l++)if(!(k.nodeName&&c.noData[k.nodeName.toLowerCase()]))if(d=k[c.expando]){if((b=e[d])&&b.events)for(var o in b.events)f[o]?c.event.remove(k,o):c.removeEvent(k,o,b.handle);if(h)delete k[c.expando];else k.removeAttribute&&k.removeAttribute(c.expando);delete e[d]}}});var Ea=/alpha\([^)]*\)/i,gb=/opacity=([^)]*)/,hb=/-([a-z])/ig,ib=/([A-Z])/g,Fa=/^-?\d+(?:px)?$/i,jb=/^-?\d/,kb={position:"absolute",visibility:"hidden",display:"block"},Pa=["Left","Right"],Qa=["Top","Bottom"],W,Ga,aa,lb=function(a,b){return b.toUpperCase()};c.fn.css=function(a,b){if(arguments.length===2&&b===B)return this;return c.access(this,a,b,true,function(d,e,f){return f!==B?c.style(d,e,f):c.css(d,e)})};c.extend({cssHooks:{opacity:{get:function(a,b){if(b){var d=W(a,"opacity","opacity");return d===""?"1":d}else return a.style.opacity}}},cssNumber:{zIndex:true,fontWeight:true,opacity:true,zoom:true,lineHeight:true},cssProps:{"float":c.support.cssFloat?"cssFloat":"styleFloat"},style:function(a,b,d,e){if(!(!a||a.nodeType===3||a.nodeType===8||!a.style)){var f,h=c.camelCase(b),l=a.style,k=c.cssHooks[h];b=c.cssProps[h]||h;if(d!==B){if(!(typeof d==="number"&&isNaN(d)||d==null)){if(typeof d==="number"&&!c.cssNumber[h])d+="px";if(!k||!("set"in k)||(d=k.set(a,d))!==B)try{l[b]=d}catch(o){}}}else{if(k&&"get"in k&&(f=k.get(a,false,e))!==B)return f;return l[b]}}},css:function(a,b,d){var e,f=c.camelCase(b),h=c.cssHooks[f];b=c.cssProps[f]||f;if(h&&"get"in h&&(e=h.get(a,true,d))!==B)return e;else if(W)return W(a,b,f)},swap:function(a,b,d){var e={},f;for(f in b){e[f]=a.style[f];a.style[f]=b[f]}d.call(a);for(f in b)a.style[f]=e[f]},camelCase:function(a){return a.replace(hb,lb)}});c.curCSS=c.css;c.each(["height","width"],function(a,b){c.cssHooks[b]={get:function(d,e,f){var h;if(e){if(d.offsetWidth!==0)h=oa(d,b,f);else c.swap(d,kb,function(){h=oa(d,b,f)});if(h<=0){h=W(d,b,b);if(h==="0px"&&aa)h=aa(d,b,b);if(h!=null)return h===""||h==="auto"?"0px":h}if(h<0||h==null){h=d.style[b];return h===""||h==="auto"?"0px":h}return typeof h==="string"?h:h+"px"}},set:function(d,e){if(Fa.test(e)){e=parseFloat(e);if(e>=0)return e+"px"}else return e}}});if(!c.support.opacity)c.cssHooks.opacity={get:function(a,b){return gb.test((b&&a.currentStyle?a.currentStyle.filter:a.style.filter)||"")?parseFloat(RegExp.$1)/100+"":b?"1":""},set:function(a,b){var d=a.style;d.zoom=1;var e=c.isNaN(b)?"":"alpha(opacity="+b*100+")",f=d.filter||"";d.filter=Ea.test(f)?f.replace(Ea,e):d.filter+" "+e}};if(t.defaultView&&t.defaultView.getComputedStyle)Ga=function(a,b,d){var e;d=d.replace(ib,"-$1").toLowerCase();if(!(b=a.ownerDocument.defaultView))return B;if(b=b.getComputedStyle(a,null)){e=b.getPropertyValue(d);if(e===""&&!c.contains(a.ownerDocument.documentElement,a))e=c.style(a,d)}return e};if(t.documentElement.currentStyle)aa=function(a,b){var d,e,f=a.currentStyle&&a.currentStyle[b],h=a.style;if(!Fa.test(f)&&jb.test(f)){d=h.left;e=a.runtimeStyle.left;a.runtimeStyle.left=a.currentStyle.left;h.left=b==="fontSize"?"1em":f||0;f=h.pixelLeft+"px";h.left=d;a.runtimeStyle.left=e}return f===""?"auto":f};W=Ga||aa;if(c.expr&&c.expr.filters){c.expr.filters.hidden=function(a){var b=a.offsetHeight;return a.offsetWidth===0&&b===0||!c.support.reliableHiddenOffsets&&(a.style.display||c.css(a,"display"))==="none"};c.expr.filters.visible=function(a){return!c.expr.filters.hidden(a)}}var mb=c.now(),nb=/<script\b[^<]*(?:(?!<\/script>)<[^<]*)*<\/script>/gi,ob=/^(?:select|textarea)/i,pb=/^(?:color|date|datetime|email|hidden|month|number|password|range|search|tel|text|time|url|week)$/i,qb=/^(?:GET|HEAD)$/,Ra=/\[\]$/,T=/\=\?(&|$)/,ja=/\?/,rb=/([?&])_=[^&]*/,sb=/^(\w+:)?\/\/([^\/?#]+)/,tb=/%20/g,ub=/#.*$/,Ha=c.fn.load;c.fn.extend({load:function(a,b,d){if(typeof a!=="string"&&Ha)return Ha.apply(this,arguments);else if(!this.length)return this;var e=a.indexOf(" ");if(e>=0){var f=a.slice(e,a.length);a=a.slice(0,e)}e="GET";if(b)if(c.isFunction(b)){d=b;b=null}else if(typeof b==="object"){b=c.param(b,c.ajaxSettings.traditional);e="POST"}var h=this;c.ajax({url:a,type:e,dataType:"html",data:b,complete:function(l,k){if(k==="success"||k==="notmodified")h.html(f?c("<div>").append(l.responseText.replace(nb,"")).find(f):l.responseText);d&&h.each(d,[l.responseText,k,l])}});return this},serialize:function(){return c.param(this.serializeArray())},serializeArray:function(){return this.map(function(){return this.elements?c.makeArray(this.elements):this}).filter(function(){return this.name&&!this.disabled&&(this.checked||ob.test(this.nodeName)||pb.test(this.type))}).map(function(a,b){var d=c(this).val();return d==null?null:c.isArray(d)?c.map(d,function(e){return{name:b.name,value:e}}):{name:b.name,value:d}}).get()}});c.each("ajaxStart ajaxStop ajaxComplete ajaxError ajaxSuccess ajaxSend".split(" "),function(a,b){c.fn[b]=function(d){return this.bind(b,d)}});c.extend({get:function(a,b,d,e){if(c.isFunction(b)){e=e||d;d=b;b=null}return c.ajax({type:"GET",url:a,data:b,success:d,dataType:e})},getScript:function(a,b){return c.get(a,null,b,"script")},getJSON:function(a,b,d){return c.get(a,b,d,"json")},post:function(a,b,d,e){if(c.isFunction(b)){e=e||d;d=b;b={}}return c.ajax({type:"POST",url:a,data:b,success:d,dataType:e})},ajaxSetup:function(a){c.extend(c.ajaxSettings,a)},ajaxSettings:{url:location.href,global:true,type:"GET",contentType:"application/x-www-form-urlencoded",processData:true,async:true,xhr:function(){return new E.XMLHttpRequest},accepts:{xml:"application/xml, text/xml",html:"text/html",script:"text/javascript, application/javascript",json:"application/json, text/javascript",text:"text/plain",_default:"*/*"}},ajax:function(a){var b=c.extend(true,{},c.ajaxSettings,a),d,e,f,h=b.type.toUpperCase(),l=qb.test(h);b.url=b.url.replace(ub,"");b.context=a&&a.context!=null?a.context:b;if(b.data&&b.processData&&typeof b.data!=="string")b.data=c.param(b.data,b.traditional);if(b.dataType==="jsonp"){if(h==="GET")T.test(b.url)||(b.url+=(ja.test(b.url)?"&":"?")+(b.jsonp||"callback")+"=?");else if(!b.data||!T.test(b.data))b.data=(b.data?b.data+"&":"")+(b.jsonp||"callback")+"=?";b.dataType="json"}if(b.dataType==="json"&&(b.data&&T.test(b.data)||T.test(b.url))){d=b.jsonpCallback||"jsonp"+mb++;if(b.data)b.data=(b.data+"").replace(T,"="+d+"$1");b.url=b.url.replace(T,"="+d+"$1");b.dataType="script";var k=E[d];E[d]=function(m){if(c.isFunction(k))k(m);else{E[d]=B;try{delete E[d]}catch(p){}}f=m;c.handleSuccess(b,w,e,f);c.handleComplete(b,w,e,f);r&&r.removeChild(A)}}if(b.dataType==="script"&&b.cache===null)b.cache=false;if(b.cache===false&&l){var o=c.now(),x=b.url.replace(rb,"$1_="+o);b.url=x+(x===b.url?(ja.test(b.url)?"&":"?")+"_="+o:"")}if(b.data&&l)b.url+=(ja.test(b.url)?"&":"?")+b.data;b.global&&c.active++===0&&c.event.trigger("ajaxStart");o=(o=sb.exec(b.url))&&(o[1]&&o[1].toLowerCase()!==location.protocol||o[2].toLowerCase()!==location.host);if(b.dataType==="script"&&h==="GET"&&o){var r=t.getElementsByTagName("head")[0]||t.documentElement,A=t.createElement("script");if(b.scriptCharset)A.charset=b.scriptCharset;A.src=b.url;if(!d){var C=false;A.onload=A.onreadystatechange=function(){if(!C&&(!this.readyState||this.readyState==="loaded"||this.readyState==="complete")){C=true;c.handleSuccess(b,w,e,f);c.handleComplete(b,w,e,f);A.onload=A.onreadystatechange=null;r&&A.parentNode&&r.removeChild(A)}}}r.insertBefore(A,r.firstChild);return B}var J=false,w=b.xhr();if(w){b.username?w.open(h,b.url,b.async,b.username,b.password):w.open(h,b.url,b.async);try{if(b.data!=null&&!l||a&&a.contentType)w.setRequestHeader("Content-Type",b.contentType);if(b.ifModified){c.lastModified[b.url]&&w.setRequestHeader("If-Modified-Since",c.lastModified[b.url]);c.etag[b.url]&&w.setRequestHeader("If-None-Match",c.etag[b.url])}o||w.setRequestHeader("X-Requested-With","XMLHttpRequest");w.setRequestHeader("Accept",b.dataType&&b.accepts[b.dataType]?b.accepts[b.dataType]+", */*; q=0.01":b.accepts._default)}catch(I){}if(b.beforeSend&&b.beforeSend.call(b.context,w,b)===false){b.global&&c.active--===1&&c.event.trigger("ajaxStop");w.abort();return false}b.global&&c.triggerGlobal(b,"ajaxSend",[w,b]);var L=w.onreadystatechange=function(m){if(!w||w.readyState===0||m==="abort"){J||c.handleComplete(b,w,e,f);J=true;if(w)w.onreadystatechange=c.noop}else if(!J&&w&&(w.readyState===4||m==="timeout")){J=true;w.onreadystatechange=c.noop;e=m==="timeout"?"timeout":!c.httpSuccess(w)?"error":b.ifModified&&c.httpNotModified(w,b.url)?"notmodified":"success";var p;if(e==="success")try{f=c.httpData(w,b.dataType,b)}catch(q){e="parsererror";p=q}if(e==="success"||e==="notmodified")d||c.handleSuccess(b,w,e,f);else c.handleError(b,w,e,p);d||c.handleComplete(b,w,e,f);m==="timeout"&&w.abort();if(b.async)w=null}};try{var g=w.abort;w.abort=function(){w&&Function.prototype.call.call(g,w);L("abort")}}catch(i){}b.async&&b.timeout>0&&setTimeout(function(){w&&!J&&L("timeout")},b.timeout);try{w.send(l||b.data==null?null:b.data)}catch(n){c.handleError(b,w,null,n);c.handleComplete(b,w,e,f)}b.async||L();return w}},param:function(a,b){var d=[],e=function(h,l){l=c.isFunction(l)?l():l;d[d.length]=encodeURIComponent(h)+"="+encodeURIComponent(l)};if(b===B)b=c.ajaxSettings.traditional;if(c.isArray(a)||a.jquery)c.each(a,function(){e(this.name,this.value)});else for(var f in a)da(f,a[f],b,e);return d.join("&").replace(tb,"+")}});c.extend({active:0,lastModified:{},etag:{},handleError:function(a,b,d,e){a.error&&a.error.call(a.context,b,d,e);a.global&&c.triggerGlobal(a,"ajaxError",[b,a,e])},handleSuccess:function(a,b,d,e){a.success&&a.success.call(a.context,e,d,b);a.global&&c.triggerGlobal(a,"ajaxSuccess",[b,a])},handleComplete:function(a,b,d){a.complete&&a.complete.call(a.context,b,d);a.global&&c.triggerGlobal(a,"ajaxComplete",[b,a]);a.global&&c.active--===1&&c.event.trigger("ajaxStop")},triggerGlobal:function(a,b,d){(a.context&&a.context.url==null?c(a.context):c.event).trigger(b,d)},httpSuccess:function(a){try{return!a.status&&location.protocol==="file:"||a.status>=200&&a.status<300||a.status===304||a.status===1223}catch(b){}return false},httpNotModified:function(a,b){var d=a.getResponseHeader("Last-Modified"),e=a.getResponseHeader("Etag");if(d)c.lastModified[b]=d;if(e)c.etag[b]=e;return a.status===304},httpData:function(a,b,d){var e=a.getResponseHeader("content-type")||"",f=b==="xml"||!b&&e.indexOf("xml")>=0;a=f?a.responseXML:a.responseText;f&&a.documentElement.nodeName==="parsererror"&&c.error("parsererror");if(d&&d.dataFilter)a=d.dataFilter(a,b);if(typeof a==="string")if(b==="json"||!b&&e.indexOf("json")>=0)a=c.parseJSON(a);else if(b==="script"||!b&&e.indexOf("javascript")>=0)c.globalEval(a);return a}});if(E.ActiveXObject)c.ajaxSettings.xhr=function(){if(E.location.protocol!=="file:")try{return new E.XMLHttpRequest}catch(a){}try{return new E.ActiveXObject("Microsoft.XMLHTTP")}catch(b){}};c.support.ajax=!!c.ajaxSettings.xhr();var ea={},vb=/^(?:toggle|show|hide)$/,wb=/^([+\-]=)?([\d+.\-]+)(.*)$/,ba,pa=[["height","marginTop","marginBottom","paddingTop","paddingBottom"],["width","marginLeft","marginRight","paddingLeft","paddingRight"],["opacity"]];c.fn.extend({show:function(a,b,d){if(a||a===0)return this.animate(S("show",3),a,b,d);else{d=0;for(var e=this.length;d<e;d++){a=this[d];b=a.style.display;if(!c.data(a,"olddisplay")&&b==="none")b=a.style.display="";b===""&&c.css(a,"display")==="none"&&c.data(a,"olddisplay",qa(a.nodeName))}for(d=0;d<e;d++){a=this[d];b=a.style.display;if(b===""||b==="none")a.style.display=c.data(a,"olddisplay")||""}return this}},hide:function(a,b,d){if(a||a===0)return this.animate(S("hide",3),a,b,d);else{a=0;for(b=this.length;a<b;a++){d=c.css(this[a],"display");d!=="none"&&c.data(this[a],"olddisplay",d)}for(a=0;a<b;a++)this[a].style.display="none";return this}},_toggle:c.fn.toggle,toggle:function(a,b,d){var e=typeof a==="boolean";if(c.isFunction(a)&&c.isFunction(b))this._toggle.apply(this,arguments);else a==null||e?this.each(function(){var f=e?a:c(this).is(":hidden");c(this)[f?"show":"hide"]()}):this.animate(S("toggle",3),a,b,d);return this},fadeTo:function(a,b,d,e){return this.filter(":hidden").css("opacity",0).show().end().animate({opacity:b},a,d,e)},animate:function(a,b,d,e){var f=c.speed(b,d,e);if(c.isEmptyObject(a))return this.each(f.complete);return this[f.queue===false?"each":"queue"](function(){var h=c.extend({},f),l,k=this.nodeType===1,o=k&&c(this).is(":hidden"),x=this;for(l in a){var r=c.camelCase(l);if(l!==r){a[r]=a[l];delete a[l];l=r}if(a[l]==="hide"&&o||a[l]==="show"&&!o)return h.complete.call(this);if(k&&(l==="height"||l==="width")){h.overflow=[this.style.overflow,this.style.overflowX,this.style.overflowY];if(c.css(this,"display")==="inline"&&c.css(this,"float")==="none")if(c.support.inlineBlockNeedsLayout)if(qa(this.nodeName)==="inline")this.style.display="inline-block";else{this.style.display="inline";this.style.zoom=1}else this.style.display="inline-block"}if(c.isArray(a[l])){(h.specialEasing=h.specialEasing||{})[l]=a[l][1];a[l]=a[l][0]}}if(h.overflow!=null)this.style.overflow="hidden";h.curAnim=c.extend({},a);c.each(a,function(A,C){var J=new c.fx(x,h,A);if(vb.test(C))J[C==="toggle"?o?"show":"hide":C](a);else{var w=wb.exec(C),I=J.cur()||0;if(w){var L=parseFloat(w[2]),g=w[3]||"px";if(g!=="px"){c.style(x,A,(L||1)+g);I=(L||1)/J.cur()*I;c.style(x,A,I+g)}if(w[1])L=(w[1]==="-="?-1:1)*L+I;J.custom(I,L,g)}else J.custom(I,C,"")}});return true})},stop:function(a,b){var d=c.timers;a&&this.queue([]);this.each(function(){for(var e=d.length-1;e>=0;e--)if(d[e].elem===this){b&&d[e](true);d.splice(e,1)}});b||this.dequeue();return this}});c.each({slideDown:S("show",1),slideUp:S("hide",1),slideToggle:S("toggle",1),fadeIn:{opacity:"show"},fadeOut:{opacity:"hide"},fadeToggle:{opacity:"toggle"}},function(a,b){c.fn[a]=function(d,e,f){return this.animate(b,d,e,f)}});c.extend({speed:function(a,b,d){var e=a&&typeof a==="object"?c.extend({},a):{complete:d||!d&&b||c.isFunction(a)&&a,duration:a,easing:d&&b||b&&!c.isFunction(b)&&b};e.duration=c.fx.off?0:typeof e.duration==="number"?e.duration:e.duration in c.fx.speeds?c.fx.speeds[e.duration]:c.fx.speeds._default;e.old=e.complete;e.complete=function(){e.queue!==false&&c(this).dequeue();c.isFunction(e.old)&&e.old.call(this)};return e},easing:{linear:function(a,b,d,e){return d+e*a},swing:function(a,b,d,e){return(-Math.cos(a*Math.PI)/2+0.5)*e+d}},timers:[],fx:function(a,b,d){this.options=b;this.elem=a;this.prop=d;if(!b.orig)b.orig={}}});c.fx.prototype={update:function(){this.options.step&&this.options.step.call(this.elem,this.now,this);(c.fx.step[this.prop]||c.fx.step._default)(this)},cur:function(){if(this.elem[this.prop]!=null&&(!this.elem.style||this.elem.style[this.prop]==null))return this.elem[this.prop];var a=parseFloat(c.css(this.elem,this.prop));return a&&a>-1E4?a:0},custom:function(a,b,d){function e(l){return f.step(l)}
var f=this,h=c.fx;this.startTime=c.now();this.start=a;this.end=b;this.unit=d||this.unit||"px";this.now=this.start;this.pos=this.state=0;e.elem=this.elem;if(e()&&c.timers.push(e)&&!ba)ba=setInterval(h.tick,h.interval)},show:function(){this.options.orig[this.prop]=c.style(this.elem,this.prop);this.options.show=true;this.custom(this.prop==="width"||this.prop==="height"?1:0,this.cur());c(this.elem).show()},hide:function(){this.options.orig[this.prop]=c.style(this.elem,this.prop);this.options.hide=true;this.custom(this.cur(),0)},step:function(a){var b=c.now(),d=true;if(a||b>=this.options.duration+this.startTime){this.now=this.end;this.pos=this.state=1;this.update();this.options.curAnim[this.prop]=true;for(var e in this.options.curAnim)if(this.options.curAnim[e]!==true)d=false;if(d){if(this.options.overflow!=null&&!c.support.shrinkWrapBlocks){var f=this.elem,h=this.options;c.each(["","X","Y"],function(k,o){f.style["overflow"+o]=h.overflow[k]})}this.options.hide&&c(this.elem).hide();if(this.options.hide||this.options.show)for(var l in this.options.curAnim)c.style(this.elem,l,this.options.orig[l]);this.options.complete.call(this.elem)}return false}else{a=b-this.startTime;this.state=a/this.options.duration;b=this.options.easing||(c.easing.swing?"swing":"linear");this.pos=c.easing[this.options.specialEasing&&this.options.specialEasing[this.prop]||b](this.state,a,0,1,this.options.duration);this.now=this.start+(this.end-this.start)*this.pos;this.update()}return true}};c.extend(c.fx,{tick:function(){for(var a=c.timers,b=0;b<a.length;b++)a[b]()||a.splice(b--,1);a.length||c.fx.stop()},interval:13,stop:function(){clearInterval(ba);ba=null},speeds:{slow:600,fast:200,_default:400},step:{opacity:function(a){c.style(a.elem,"opacity",a.now)},_default:function(a){if(a.elem.style&&a.elem.style[a.prop]!=null)a.elem.style[a.prop]=(a.prop==="width"||a.prop==="height"?Math.max(0,a.now):a.now)+a.unit;else a.elem[a.prop]=a.now}}});if(c.expr&&c.expr.filters)c.expr.filters.animated=function(a){return c.grep(c.timers,function(b){return a===b.elem}).length};var xb=/^t(?:able|d|h)$/i,Ia=/^(?:body|html)$/i;c.fn.offset="getBoundingClientRect"in t.documentElement?function(a){var b=this[0],d;if(a)return this.each(function(l){c.offset.setOffset(this,a,l)});if(!b||!b.ownerDocument)return null;if(b===b.ownerDocument.body)return c.offset.bodyOffset(b);try{d=b.getBoundingClientRect()}catch(e){}var f=b.ownerDocument,h=f.documentElement;if(!d||!c.contains(h,b))return d||{top:0,left:0};b=f.body;f=fa(f);return{top:d.top+(f.pageYOffset||c.support.boxModel&&h.scrollTop||b.scrollTop)-(h.clientTop||b.clientTop||0),left:d.left+(f.pageXOffset||c.support.boxModel&&h.scrollLeft||b.scrollLeft)-(h.clientLeft||b.clientLeft||0)}}:function(a){var b=this[0];if(a)return this.each(function(x){c.offset.setOffset(this,a,x)});if(!b||!b.ownerDocument)return null;if(b===b.ownerDocument.body)return c.offset.bodyOffset(b);c.offset.initialize();var d,e=b.offsetParent,f=b.ownerDocument,h=f.documentElement,l=f.body;d=(f=f.defaultView)?f.getComputedStyle(b,null):b.currentStyle;for(var k=b.offsetTop,o=b.offsetLeft;(b=b.parentNode)&&b!==l&&b!==h;){if(c.offset.supportsFixedPosition&&d.position==="fixed")break;d=f?f.getComputedStyle(b,null):b.currentStyle;k-=b.scrollTop;o-=b.scrollLeft;if(b===e){k+=b.offsetTop;o+=b.offsetLeft;if(c.offset.doesNotAddBorder&&!(c.offset.doesAddBorderForTableAndCells&&xb.test(b.nodeName))){k+=parseFloat(d.borderTopWidth)||0;o+=parseFloat(d.borderLeftWidth)||0}e=b.offsetParent}if(c.offset.subtractsBorderForOverflowNotVisible&&d.overflow!=="visible"){k+=parseFloat(d.borderTopWidth)||0;o+=parseFloat(d.borderLeftWidth)||0}d=d}if(d.position==="relative"||d.position==="static"){k+=l.offsetTop;o+=l.offsetLeft}if(c.offset.supportsFixedPosition&&d.position==="fixed"){k+=Math.max(h.scrollTop,l.scrollTop);o+=Math.max(h.scrollLeft,l.scrollLeft)}return{top:k,left:o}};c.offset={initialize:function(){var a=t.body,b=t.createElement("div"),d,e,f,h=parseFloat(c.css(a,"marginTop"))||0;c.extend(b.style,{position:"absolute",top:0,left:0,margin:0,border:0,width:"1px",height:"1px",visibility:"hidden"});b.innerHTML="<div style='position:absolute;top:0;left:0;margin:0;border:5px solid #000;padding:0;width:1px;height:1px;'><div></div></div><table style='position:absolute;top:0;left:0;margin:0;border:5px solid #000;padding:0;width:1px;height:1px;' cellpadding='0' cellspacing='0'><tr><td></td></tr></table>";a.insertBefore(b,a.firstChild);d=b.firstChild;e=d.firstChild;f=d.nextSibling.firstChild.firstChild;this.doesNotAddBorder=e.offsetTop!==5;this.doesAddBorderForTableAndCells=f.offsetTop===5;e.style.position="fixed";e.style.top="20px";this.supportsFixedPosition=e.offsetTop===20||e.offsetTop===15;e.style.position=e.style.top="";d.style.overflow="hidden";d.style.position="relative";this.subtractsBorderForOverflowNotVisible=e.offsetTop===-5;this.doesNotIncludeMarginInBodyOffset=a.offsetTop!==h;a.removeChild(b);c.offset.initialize=c.noop},bodyOffset:function(a){var b=a.offsetTop,d=a.offsetLeft;c.offset.initialize();if(c.offset.doesNotIncludeMarginInBodyOffset){b+=parseFloat(c.css(a,"marginTop"))||0;d+=parseFloat(c.css(a,"marginLeft"))||0}return{top:b,left:d}},setOffset:function(a,b,d){var e=c.css(a,"position");if(e==="static")a.style.position="relative";var f=c(a),h=f.offset(),l=c.css(a,"top"),k=c.css(a,"left"),o=e==="absolute"&&c.inArray("auto",[l,k])>-1;e={};var x={};if(o)x=f.position();l=o?x.top:parseInt(l,10)||0;k=o?x.left:parseInt(k,10)||0;if(c.isFunction(b))b=b.call(a,d,h);if(b.top!=null)e.top=b.top-h.top+l;if(b.left!=null)e.left=b.left-h.left+k;"using"in b?b.using.call(a,e):f.css(e)}};c.fn.extend({position:function(){if(!this[0])return null;var a=this[0],b=this.offsetParent(),d=this.offset(),e=Ia.test(b[0].nodeName)?{top:0,left:0}:b.offset();d.top-=parseFloat(c.css(a,"marginTop"))||0;d.left-=parseFloat(c.css(a,"marginLeft"))||0;e.top+=parseFloat(c.css(b[0],"borderTopWidth"))||0;e.left+=parseFloat(c.css(b[0],"borderLeftWidth"))||0;return{top:d.top-e.top,left:d.left-e.left}},offsetParent:function(){return this.map(function(){for(var a=this.offsetParent||t.body;a&&!Ia.test(a.nodeName)&&c.css(a,"position")==="static";)a=a.offsetParent;return a})}});c.each(["Left","Top"],function(a,b){var d="scroll"+b;c.fn[d]=function(e){var f=this[0],h;if(!f)return null;if(e!==B)return this.each(function(){if(h=fa(this))h.scrollTo(!a?e:c(h).scrollLeft(),a?e:c(h).scrollTop());else this[d]=e});else return(h=fa(f))?"pageXOffset"in h?h[a?"pageYOffset":"pageXOffset"]:c.support.boxModel&&h.document.documentElement[d]||h.document.body[d]:f[d]}});c.each(["Height","Width"],function(a,b){var d=b.toLowerCase();c.fn["inner"+b]=function(){return this[0]?parseFloat(c.css(this[0],d,"padding")):null};c.fn["outer"+b]=function(e){return this[0]?parseFloat(c.css(this[0],d,e?"margin":"border")):null};c.fn[d]=function(e){var f=this[0];if(!f)return e==null?null:this;if(c.isFunction(e))return this.each(function(l){var k=c(this);k[d](e.call(this,l,k[d]()))});if(c.isWindow(f))return f.document.compatMode==="CSS1Compat"&&f.document.documentElement["client"+b]||f.document.body["client"+b];else if(f.nodeType===9)return Math.max(f.documentElement["client"+
b],f.body["scroll"+b],f.documentElement["scroll"+b],f.body["offset"+b],f.documentElement["offset"+b]);else if(e===B){f=c.css(f,d);var h=parseFloat(f);return c.isNaN(h)?f:h}else return this.css(d,typeof e==="string"?e:e+"px")}})})(window);/*
 * 
 * TableSorter 2.0 - Client-side table sorting with ease!
 * Version 2.0.5b
 * @requires jQuery v1.2.3
 * 
 * Copyright (c) 2007 Christian Bach
 * Examples and docs at: http://tablesorter.com
 * Dual licensed under the MIT and GPL licenses:
 * http://www.opensource.org/licenses/mit-license.php
 * http://www.gnu.org/licenses/gpl.html
 * 
 */
(function($){$.extend({tablesorter:new
function(){var parsers=[],widgets=[];this.defaults={cssHeader:"header",cssAsc:"headerSortUp",cssDesc:"headerSortDown",cssChildRow:"expand-child",sortInitialOrder:"asc",sortMultiSortKey:"shiftKey",sortForce:null,sortAppend:null,sortLocaleCompare:true,textExtraction:"simple",parsers:{},widgets:[],widgetZebra:{css:["even","odd"]},headers:{},widthFixed:false,cancelSelection:true,sortList:[],headerList:[],dateFormat:"us",decimal:'/\.|\,/g',onRenderHeader:null,selectorHeaders:'thead th',debug:false};function benchmark(s,d){log(s+","+(new Date().getTime()-d.getTime())+"ms");}
this.benchmark=benchmark;function log(s){if(typeof console!="undefined"&&typeof console.debug!="undefined"){console.log(s);}else{alert(s);}}
function buildParserCache(table,$headers){if(table.config.debug){var parsersDebug="";}
if(table.tBodies.length==0)return;var rows=table.tBodies[0].rows;if(rows[0]){var list=[],cells=rows[0].cells,l=cells.length;for(var i=0;i<l;i++){var p=false;if($.metadata&&($($headers[i]).metadata()&&$($headers[i]).metadata().sorter)){p=getParserById($($headers[i]).metadata().sorter);}else if((table.config.headers[i]&&table.config.headers[i].sorter)){p=getParserById(table.config.headers[i].sorter);}
if(!p){p=detectParserForColumn(table,rows,-1,i);}
if(table.config.debug){parsersDebug+="column:"+i+" parser:"+p.id+"\n";}
list.push(p);}}
if(table.config.debug){log(parsersDebug);}
return list;};function detectParserForColumn(table,rows,rowIndex,cellIndex){var l=parsers.length,node=false,nodeValue=false,keepLooking=true;while(nodeValue==''&&keepLooking){rowIndex++;if(rows[rowIndex]){node=getNodeFromRowAndCellIndex(rows,rowIndex,cellIndex);nodeValue=trimAndGetNodeText(table.config,node);if(table.config.debug){log('Checking if value was empty on row:'+rowIndex);}}else{keepLooking=false;}}
for(var i=1;i<l;i++){if(parsers[i].is(nodeValue,table,node)){return parsers[i];}}
return parsers[0];}
function getNodeFromRowAndCellIndex(rows,rowIndex,cellIndex){return rows[rowIndex].cells[cellIndex];}
function trimAndGetNodeText(config,node){return $.trim(getElementText(config,node));}
function getParserById(name){var l=parsers.length;for(var i=0;i<l;i++){if(parsers[i].id.toLowerCase()==name.toLowerCase()){return parsers[i];}}
return false;}
function buildCache(table){if(table.config.debug){var cacheTime=new Date();}
var totalRows=(table.tBodies[0]&&table.tBodies[0].rows.length)||0,totalCells=(table.tBodies[0].rows[0]&&table.tBodies[0].rows[0].cells.length)||0,parsers=table.config.parsers,cache={row:[],normalized:[]};for(var i=0;i<totalRows;++i){var c=$(table.tBodies[0].rows[i]),cols=[];if(c.hasClass(table.config.cssChildRow)){cache.row[cache.row.length-1]=cache.row[cache.row.length-1].add(c);continue;}
cache.row.push(c);for(var j=0;j<totalCells;++j){cols.push(parsers[j].format(getElementText(table.config,c[0].cells[j]),table,c[0].cells[j]));}
cols.push(cache.normalized.length);cache.normalized.push(cols);cols=null;};if(table.config.debug){benchmark("Building cache for "+totalRows+" rows:",cacheTime);}
return cache;};function getElementText(config,node){var text="";if(!node)return"";if(!config.supportsTextContent)config.supportsTextContent=node.textContent||false;if(config.textExtraction=="simple"){if(config.supportsTextContent){text=node.textContent;}else{if(node.childNodes[0]&&node.childNodes[0].hasChildNodes()){text=node.childNodes[0].innerHTML;}else{text=node.innerHTML;}}}else{if(typeof(config.textExtraction)=="function"){text=config.textExtraction(node);}else{text=$(node).text();}}
return text;}
function appendToTable(table,cache){if(table.config.debug){var appendTime=new Date()}
var c=cache,r=c.row,n=c.normalized,totalRows=n.length,checkCell=(n[0].length-1),tableBody=$(table.tBodies[0]),rows=[];for(var i=0;i<totalRows;i++){var pos=n[i][checkCell];rows.push(r[pos]);if(!table.config.appender){var l=r[pos].length;for(var j=0;j<l;j++){tableBody[0].appendChild(r[pos][j]);}}}
if(table.config.appender){table.config.appender(table,rows);}
rows=null;if(table.config.debug){benchmark("Rebuilt table:",appendTime);}
applyWidget(table);setTimeout(function(){$(table).trigger("sortEnd");},0);};function buildHeaders(table){if(table.config.debug){var time=new Date();}
var meta=($.metadata)?true:false;var header_index=computeTableHeaderCellIndexes(table);$tableHeaders=$(table.config.selectorHeaders,table).each(function(index){this.column=header_index[this.parentNode.rowIndex+"-"+this.cellIndex];this.order=formatSortingOrder(table.config.sortInitialOrder);this.count=this.order;if(checkHeaderMetadata(this)||checkHeaderOptions(table,index))this.sortDisabled=true;if(checkHeaderOptionsSortingLocked(table,index))this.order=this.lockedOrder=checkHeaderOptionsSortingLocked(table,index);if(!this.sortDisabled){var $th=$(this).addClass(table.config.cssHeader);if(table.config.onRenderHeader)table.config.onRenderHeader.apply($th);}
table.config.headerList[index]=this;});if(table.config.debug){benchmark("Built headers:",time);log($tableHeaders);}
return $tableHeaders;};function computeTableHeaderCellIndexes(t){var matrix=[];var lookup={};var thead=t.getElementsByTagName('THEAD')[0];var trs=thead.getElementsByTagName('TR');for(var i=0;i<trs.length;i++){var cells=trs[i].cells;for(var j=0;j<cells.length;j++){var c=cells[j];var rowIndex=c.parentNode.rowIndex;var cellId=rowIndex+"-"+c.cellIndex;var rowSpan=c.rowSpan||1;var colSpan=c.colSpan||1
var firstAvailCol;if(typeof(matrix[rowIndex])=="undefined"){matrix[rowIndex]=[];}
for(var k=0;k<matrix[rowIndex].length+1;k++){if(typeof(matrix[rowIndex][k])=="undefined"){firstAvailCol=k;break;}}
lookup[cellId]=firstAvailCol;for(var k=rowIndex;k<rowIndex+rowSpan;k++){if(typeof(matrix[k])=="undefined"){matrix[k]=[];}
var matrixrow=matrix[k];for(var l=firstAvailCol;l<firstAvailCol+colSpan;l++){matrixrow[l]="x";}}}}
return lookup;}
function checkCellColSpan(table,rows,row){var arr=[],r=table.tHead.rows,c=r[row].cells;for(var i=0;i<c.length;i++){var cell=c[i];if(cell.colSpan>1){arr=arr.concat(checkCellColSpan(table,headerArr,row++));}else{if(table.tHead.length==1||(cell.rowSpan>1||!r[row+1])){arr.push(cell);}}}
return arr;};function checkHeaderMetadata(cell){if(($.metadata)&&($(cell).metadata().sorter===false)){return true;};return false;}
function checkHeaderOptions(table,i){if((table.config.headers[i])&&(table.config.headers[i].sorter===false)){return true;};return false;}
function checkHeaderOptionsSortingLocked(table,i){if((table.config.headers[i])&&(table.config.headers[i].lockedOrder))return table.config.headers[i].lockedOrder;return false;}
function applyWidget(table){var c=table.config.widgets;var l=c.length;for(var i=0;i<l;i++){getWidgetById(c[i]).format(table);}}
function getWidgetById(name){var l=widgets.length;for(var i=0;i<l;i++){if(widgets[i].id.toLowerCase()==name.toLowerCase()){return widgets[i];}}};function formatSortingOrder(v){if(typeof(v)!="Number"){return(v.toLowerCase()=="desc")?1:0;}else{return(v==1)?1:0;}}
function isValueInArray(v,a){var l=a.length;for(var i=0;i<l;i++){if(a[i][0]==v){return true;}}
return false;}
function setHeadersCss(table,$headers,list,css){$headers.removeClass(css[0]).removeClass(css[1]);var h=[];$headers.each(function(offset){if(!this.sortDisabled){h[this.column]=$(this);}});var l=list.length;for(var i=0;i<l;i++){h[list[i][0]].addClass(css[list[i][1]]);}}
function fixColumnWidth(table,$headers){var c=table.config;if(c.widthFixed){var colgroup=$('<colgroup>');$("tr:first td",table.tBodies[0]).each(function(){colgroup.append($('<col>').css('width',$(this).width()));});$(table).prepend(colgroup);};}
function updateHeaderSortCount(table,sortList){var c=table.config,l=sortList.length;for(var i=0;i<l;i++){var s=sortList[i],o=c.headerList[s[0]];o.count=s[1];o.count++;}}
function multisort(table,sortList,cache){if(table.config.debug){var sortTime=new Date();}
var dynamicExp="var sortWrapper = function(a,b) {",l=sortList.length;for(var i=0;i<l;i++){var c=sortList[i][0];var order=sortList[i][1];var s=(table.config.parsers[c].type=="text")?((order==0)?makeSortFunction("text","asc",c):makeSortFunction("text","desc",c)):((order==0)?makeSortFunction("numeric","asc",c):makeSortFunction("numeric","desc",c));var e="e"+i;dynamicExp+="var "+e+" = "+s;dynamicExp+="if("+e+") { return "+e+"; } ";dynamicExp+="else { ";}
var orgOrderCol=cache.normalized[0].length-1;dynamicExp+="return a["+orgOrderCol+"]-b["+orgOrderCol+"];";for(var i=0;i<l;i++){dynamicExp+="}; ";}
dynamicExp+="return 0; ";dynamicExp+="}; ";if(table.config.debug){benchmark("Evaling expression:"+dynamicExp,new Date());}
eval(dynamicExp);cache.normalized.sort(sortWrapper);if(table.config.debug){benchmark("Sorting on "+sortList.toString()+" and dir "+order+" time:",sortTime);}
return cache;};function makeSortFunction(type,direction,index){var a="a["+index+"]",b="b["+index+"]";if(type=='text'&&direction=='asc'){return"("+a+" == "+b+" ? 0 : ("+a+" === null ? Number.POSITIVE_INFINITY : ("+b+" === null ? Number.NEGATIVE_INFINITY : ("+a+" < "+b+") ? -1 : 1 )));";}else if(type=='text'&&direction=='desc'){return"("+a+" == "+b+" ? 0 : ("+a+" === null ? Number.POSITIVE_INFINITY : ("+b+" === null ? Number.NEGATIVE_INFINITY : ("+b+" < "+a+") ? -1 : 1 )));";}else if(type=='numeric'&&direction=='asc'){return"("+a+" === null && "+b+" === null) ? 0 :("+a+" === null ? Number.POSITIVE_INFINITY : ("+b+" === null ? Number.NEGATIVE_INFINITY : "+a+" - "+b+"));";}else if(type=='numeric'&&direction=='desc'){return"("+a+" === null && "+b+" === null) ? 0 :("+a+" === null ? Number.POSITIVE_INFINITY : ("+b+" === null ? Number.NEGATIVE_INFINITY : "+b+" - "+a+"));";}};function makeSortText(i){return"((a["+i+"] < b["+i+"]) ? -1 : ((a["+i+"] > b["+i+"]) ? 1 : 0));";};function makeSortTextDesc(i){return"((b["+i+"] < a["+i+"]) ? -1 : ((b["+i+"] > a["+i+"]) ? 1 : 0));";};function makeSortNumeric(i){return"a["+i+"]-b["+i+"];";};function makeSortNumericDesc(i){return"b["+i+"]-a["+i+"];";};function sortText(a,b){if(table.config.sortLocaleCompare)return a.localeCompare(b);return((a<b)?-1:((a>b)?1:0));};function sortTextDesc(a,b){if(table.config.sortLocaleCompare)return b.localeCompare(a);return((b<a)?-1:((b>a)?1:0));};function sortNumeric(a,b){return a-b;};function sortNumericDesc(a,b){return b-a;};function getCachedSortType(parsers,i){return parsers[i].type;};this.construct=function(settings){return this.each(function(){if(!this.tHead||!this.tBodies)return;var $this,$document,$headers,cache,config,shiftDown=0,sortOrder;this.config={};var match=RegExp('[?&]sort=([^&]*)').exec(window.location.search);if(JSON&&match)settings.sortList=JSON.parse(decodeURIComponent(match[1]));config=$.extend(this.config,$.tablesorter.defaults,settings);$this=$(this);$.data(this,"tablesorter",config);$headers=buildHeaders(this);this.config.parsers=buildParserCache(this,$headers);cache=buildCache(this);var sortCSS=[config.cssDesc,config.cssAsc];fixColumnWidth(this);$headers.click(function(e){var totalRows=($this[0].tBodies[0]&&$this[0].tBodies[0].rows.length)||0;if(!this.sortDisabled&&totalRows>0){$this.trigger("sortStart");var $cell=$(this);var i=this.column;this.order=this.count++%2;if(this.lockedOrder)this.order=this.lockedOrder;if(!e[config.sortMultiSortKey]){config.sortList=[];if(config.sortForce!=null){var a=config.sortForce;for(var j=0;j<a.length;j++){if(a[j][0]!=i){config.sortList.push(a[j]);}}}
config.sortList.push([i,this.order]);}else{if(isValueInArray(i,config.sortList)){for(var j=0;j<config.sortList.length;j++){var s=config.sortList[j],o=config.headerList[s[0]];if(s[0]==i){o.count=s[1];o.count++;s[1]=o.count%2;}}}else{config.sortList.push([i,this.order]);}};setTimeout(function(){if(JSON&&typeof history.replaceState==='function')
history.replaceState({},null,"?sort="+JSON.stringify(config.sortList));setHeadersCss($this[0],$headers,config.sortList,sortCSS);appendToTable($this[0],multisort($this[0],config.sortList,cache));},1);return false;}}).mousedown(function(){if(config.cancelSelection){this.onselectstart=function(){return false};return false;}});$this.bind("update",function(){var me=this;setTimeout(function(){me.config.parsers=buildParserCache(me,$headers);cache=buildCache(me);},1);}).bind("updateCell",function(e,cell){var config=this.config;var pos=[(cell.parentNode.rowIndex-1),cell.cellIndex];cache.normalized[pos[0]][pos[1]]=config.parsers[pos[1]].format(getElementText(config,cell),cell);}).bind("sorton",function(e,list){$(this).trigger("sortStart");config.sortList=list;var sortList=config.sortList;updateHeaderSortCount(this,sortList);setHeadersCss(this,$headers,sortList,sortCSS);appendToTable(this,multisort(this,sortList,cache));}).bind("appendCache",function(){appendToTable(this,cache);}).bind("applyWidgetId",function(e,id){getWidgetById(id).format(this);}).bind("applyWidgets",function(){applyWidget(this);});if($.metadata&&($(this).metadata()&&$(this).metadata().sortlist)){config.sortList=$(this).metadata().sortlist;}
if(config.sortList.length>0){$this.trigger("sorton",[config.sortList]);}
applyWidget(this);});};this.addParser=function(parser){var l=parsers.length,a=true;for(var i=0;i<l;i++){if(parsers[i].id.toLowerCase()==parser.id.toLowerCase()){a=false;}}
if(a){parsers.push(parser);};};this.addWidget=function(widget){widgets.push(widget);};this.formatFloat=function(s){var i=parseFloat(s);return(isNaN(i))?0:i;};this.formatInt=function(s){var i=parseInt(s);return(isNaN(i))?0:i;};this.isDigit=function(s,config){return/^[-+]?\d*$/.test($.trim(s.replace(/[,.']/g,'')));};this.clearTableBody=function(table){if($.browser.msie){function empty(){while(this.firstChild)
this.removeChild(this.firstChild);}
empty.apply(table.tBodies[0]);}else{table.tBodies[0].innerHTML="";}};}});$.fn.extend({tablesorter:$.tablesorter.construct});var ts=$.tablesorter;ts.addParser({id:"text",is:function(s){return true;},format:function(s){return $.trim(s.toLocaleLowerCase());},type:"text"});ts.addParser({id:"digit",is:function(s,table){var c=table.config;return $.tablesorter.isDigit(s,c);},format:function(s){return $.tablesorter.formatFloat(s);},type:"numeric"});ts.addParser({id:"currency",is:function(s){return/^[£$€?.]/.test(s);},format:function(s){return $.tablesorter.formatFloat(s.replace(new RegExp(/[£$€]/g),""));},type:"numeric"});ts.addParser({id:"ipAddress",is:function(s){return/^\d{2,3}[\.]\d{2,3}[\.]\d{2,3}[\.]\d{2,3}$/.test(s);},format:function(s){var a=s.split("."),r="",l=a.length;for(var i=0;i<l;i++){var item=a[i];if(item.length==2){r+="0"+item;}else{r+=item;}}
return $.tablesorter.formatFloat(r);},type:"numeric"});ts.addParser({id:"url",is:function(s){return/^(https?|ftp|file):\/\/$/.test(s);},format:function(s){return jQuery.trim(s.replace(new RegExp(/(https?|ftp|file):\/\//),''));},type:"text"});ts.addParser({id:"isoDate",is:function(s){return/^\d{4}[\/-]\d{1,2}[\/-]\d{1,2}$/.test(s);},format:function(s){return $.tablesorter.formatFloat((s!="")?new Date(s.replace(new RegExp(/-/g),"/")).getTime():"0");},type:"numeric"});ts.addParser({id:"percent",is:function(s){return/\%$/.test($.trim(s));},format:function(s){return $.tablesorter.formatFloat(s.replace(new RegExp(/%/g),""));},type:"numeric"});ts.addParser({id:"usLongDate",is:function(s){return s.match(new RegExp(/^[A-Za-z]{3,10}\.? [0-9]{1,2}, ([0-9]{4}|'?[0-9]{2}) (([0-2]?[0-9]:[0-5][0-9])|([0-1]?[0-9]:[0-5][0-9]\s(AM|PM)))$/));},format:function(s){return $.tablesorter.formatFloat(new Date(s).getTime());},type:"numeric"});ts.addParser({id:"shortDate",is:function(s){return/\d{1,2}[\/\-]\d{1,2}[\/\-]\d{2,4}/.test(s);
        }, format: function (s, table) {
            var c = table.config;
            s = s.replace(/\-/g, "/");
            if (c.dateFormat == "us") {
                // reformat the string in ISO format
                s = s.replace(/(\d{1,2})[\/\-](\d{1,2})[\/\-](\d{4})/, "$3/$1/$2");
            } else if (c.dateFormat == "uk") {
                // reformat the string in ISO format
                s = s.replace(/(\d{1,2})[\/\-](\d{1,2})[\/\-](\d{4})/, "$3/$2/$1");
            } else if (c.dateFormat == "dd/mm/yy" || c.dateFormat == "dd-mm-yy") {
                s = s.replace(/(\d{1,2})[\/\-](\d{1,2})[\/\-](\d{2})/, "$1/$2/$3");
            }
            return $.tablesorter.formatFloat(new Date(s).getTime());
        }, type: "numeric"
    });
    ts.addParser({
        id: "time",
        is: function (s) {
            return /^(([0-2]?[0-9]:[0-5][0-9])|([0-1]?[0-9]:[0-5][0-9]\s(am|pm)))$/.test(s);
        }, format: function (s) {
            return $.tablesorter.formatFloat(new Date("2000/01/01" + s).getTime());
        }, type: "numeric"
    });
    ts.addParser({
        id: "metadata",
        is: function (s) {
            return false;
        }, format: function (s, table, cell) {
            var c = table.config,
                p = (!c.parserMetadataName) ? 'sortValue' : c.parserMetadataName;
            return $(cell).metadata()[p];
        }, type: "numeric"
    });
    // add default widgets
    ts.addWidget({
        id: "zebra",
        format: function (table) {
            if (table.config.debug) {
                var time = new Date();
            }
            var $tr, row = -1,
                odd;
            // loop through the visible rows
            $("tr:visible", table.tBodies[0]).each(function (i) {
                $tr = $(this);
                // style children rows the same way the parent
                // row was styled
                if (!$tr.hasClass(table.config.cssChildRow)) row++;
                odd = (row % 2 == 0);
                $tr.removeClass(
                table.config.widgetZebra.css[odd ? 0 : 1]).addClass(
                table.config.widgetZebra.css[odd ? 1 : 0])
            });
            if (table.config.debug) {
                $.tablesorter.benchmark("Applying Zebra widget", time);
            }
        }
    });
})(jQuery);
/* root/static/js/jquery.cookie.js */
/**
 * Cookie plugin
 *
 * Copyright (c) 2006 Klaus Hartl (stilbuero.de)
 * Dual licensed under the MIT and GPL licenses:
 * http://www.opensource.org/licenses/mit-license.php
 * http://www.gnu.org/licenses/gpl.html
 *
 */
jQuery.cookie = function(name, value, options) {
    if (typeof value != 'undefined') { // name and value given, set cookie
        options = options || {};
        if (value === null) {
            value = '';
            options.expires = -1;
        }
        var expires = '';
        if (options.expires && (typeof options.expires == 'number' || options.expires.toUTCString)) {
            var date;
            if (typeof options.expires == 'number') {
                date = new Date();
                date.setTime(date.getTime() + (options.expires * 24 * 60 * 60 * 1000));
            } else {
                date = options.expires;
            }
            expires = '; expires=' + date.toUTCString(); // use expires attribute, max-age is not supported by IE
        }
        var path = options.path ? '; path=' + (options.path) : '';
        var domain = options.domain ? '; domain=' + (options.domain) : '';
        var secure = options.secure ? '; secure' : '';
        document.cookie = [name, '=', encodeURIComponent(value), expires, path, domain, secure].join('');
    } else { // only name given, get cookie
        var cookieValue = null;
        if (document.cookie && document.cookie != '') {
            var cookies = document.cookie.split(';');
            for (var i = 0; i < cookies.length; i++) {
                var cookie = jQuery.trim(cookies[i]);
                // Does this cookie string begin with the name we want?
                if (cookie.substring(0, name.length + 1) == (name + '=')) {
                    cookieValue = decodeURIComponent(cookie.substring(name.length + 1));
                    break;
                }
            }
        }
        return cookieValue;
    }
};
/* root/static/js/jquery.relatize_date.js */
// All credit goes to Rick Olson.
(function($) {
  $.fn.relatizeDate = function() {
    return $(this).each(function() {
      $(this).attr( "title", $(this).text() );
      $(this).text( $.relatizeDate(this) )
    })
  }

  $.relatizeDate = function(element) {
    var str = $(element).text(),
        d = new Date(str), m;
    if(!d || isNaN(d)){
      // match w3cdtf/iso 8601/rfc 3339 (not all browsers will via new Date())
      if( (m = str.match(/^(\d{4})-(\d{2})-(\d{2})T(\d{2}):(\d{2}):(\d{2})(GMT|UTC|Z)?$/)) ){
        d = m[7] ? // UTC
          new Date(Date.UTC(m[1], m[2]-1, m[3], m[4], m[5], m[6])) :
          new Date(         m[1], m[2]-1, m[3], m[4], m[5], m[6] );
      }
    }
    // if Date is not parseable just return the original string
    return( (!d || isNaN(d)) ? str : $.relatizeDate.timeAgoInWords( d ) );
  };

  // shortcut
  $r = $.relatizeDate

  $.extend($.relatizeDate, {
    shortDays: [ 'Sun', 'Mon', 'Tue', 'Wed', 'Thu', 'Fri', 'Sat' ],
    days: ['Sunday', 'Monday', 'Tuesday', 'Wednesday', 'Thursday', 'Friday', 'Saturday'],
    shortMonths: [ 'Jan', 'Feb', 'Mar', 'Apr', 'May', 'Jun', 'Jul', 'Aug', 'Sep', 'Oct', 'Nov', 'Dec' ],
    months: [ 'January', 'February', 'March', 'April', 'May', 'June', 'July', 'August', 'September', 'October', 'November', 'December' ],

    /**
     * Given a formatted string, replace the necessary items and return.
     * Example: Time.now().strftime("%B%d,%Y") => February 11, 2008
     * @param {String} format The formatted string used to format the results
     */
    strftime: function(date, format) {
      var day = date.getDay(), month = date.getMonth();
      var hours = date.getHours(), minutes = date.getMinutes();

      var pad = function(num) { 
        var string = num.toString(10);
        return new Array((2 - string.length) + 1).join('0') + string
      };

      return format.replace(/\%([aAbBcdHImMpSwyY])/g, function(match, letter) {
        switch(letter) {
          case 'a': return $r.shortDays[day]; break;
          case 'A': return $r.days[day]; break;
          case 'b': return $r.shortMonths[month]; break;
          case 'B': return $r.months[month]; break;
          case 'c': return date.toString(); break;
          case 'd': return pad(date.getDate()); break;
          case 'H': return pad(hours); break;
          case 'I': return pad((hours + 12) % 12); break;
          case 'm': return pad(month + 1); break;
          case 'M': return pad(minutes); break;
          case 'p': return hours > 12 ? 'PM' : 'AM'; break;
          case 'S': return pad(date.getSeconds()); break;
          case 'w': return day; break;
          case 'y': return pad(date.getFullYear() % 100); break;
          case 'Y': return date.getFullYear().toString(); break;
        }
      })
    },
  
    timeAgoInWords: function(targetDate, includeTime) {
      return $r.distanceOfTimeInWords(targetDate, new Date(), includeTime);
    },
  
    /**
     * Return the distance of time in words between two Date's
     * Example: '5 days ago', 'about an hour ago'
     * @param {Date} fromTime The start date to use in the calculation
     * @param {Date} toTime The end date to use in the calculation
     * @param {Boolean} Include the time in the output
     */
    distanceOfTimeInWords: function(fromTime, toTime, includeTime) {
      var delta = parseInt((toTime.getTime() - fromTime.getTime()) / 1000);
      if (delta < 120) {
          return 'a minute ago';
      } else if (delta < (45*60)) {
          return (parseInt(delta / 60)).toString() + ' minutes ago';
      } else if (delta < (120*60)) {
          return 'an hour ago';
      } else if (delta < (24*60*60)) {
          return (parseInt(delta / 3600)).toString() + ' hours ago';
      } else if (delta < (48*60*60)) {
          return 'one day ago';
      } else {
        var days = (parseInt(delta / 86400)).toString();
        if (days > 5) {
          var fmt  = '%b %d, %Y'
          if (includeTime) fmt += ' %I:%M %p'
          return $r.strftime(fromTime, fmt);
        } else {
          return days + " days ago"
        }
      }
    }
  })
})(jQuery);

/* root/static/js/jquery.ajaxQueue.js */
/**
 * Ajax Queue Plugin
 * 
 * Homepage: http://jquery.com/plugins/project/ajaxqueue
 * Documentation: http://docs.jquery.com/AjaxQueue
 */

/**

<script>
$(function(){
	jQuery.ajaxQueue({
		url: "test.php",
		success: function(html){ jQuery("ul").append(html); }
	});
	jQuery.ajaxQueue({
		url: "test.php",
		success: function(html){ jQuery("ul").append(html); }
	});
	jQuery.ajaxSync({
		url: "test.php",
		success: function(html){ jQuery("ul").append("<b>"+html+"</b>"); }
	});
	jQuery.ajaxSync({
		url: "test.php",
		success: function(html){ jQuery("ul").append("<b>"+html+"</b>"); }
	});
});
</script>
<ul style="position:absolute;top:5px;right:5px;"></ul>

 */
/*
 * Queued Ajax requests.
 * A new Ajax request won't be started until the previous queued 
 * request has finished.
 */

/*
 * Synced Ajax requests.
 * The Ajax request will happen as soon as you call this method, but
 * the callbacks (success/error/complete) won't fire until all previous
 * synced requests have been completed.
 */


(function($) {
	
	var ajax = $.ajax;
	
	var pendingRequests = {};
	
	var synced = [];
	var syncedData = [];
	
	$.ajax = function(settings) {
		// create settings for compatibility with ajaxSetup
		settings = jQuery.extend(settings, jQuery.extend({}, jQuery.ajaxSettings, settings));
		
		var port = settings.port;
		
		switch(settings.mode) {
		case "abort": 
			if ( pendingRequests[port] ) {
				pendingRequests[port].abort();
			}
			return pendingRequests[port] = ajax.apply(this, arguments);
		case "queue": 
			var _old = settings.complete;
			settings.complete = function(){
				if ( _old )
					_old.apply( this, arguments );
				jQuery([ajax]).dequeue("ajax" + port );;
			};
		
			jQuery([ ajax ]).queue("ajax" + port, function(){
				ajax( settings );
			});
			return;
		case "sync":
			var pos = synced.length;
	
			synced[ pos ] = {
				error: settings.error,
				success: settings.success,
				complete: settings.complete,
				done: false
			};
		
			syncedData[ pos ] = {
				error: [],
				success: [],
				complete: []
			};
		
			settings.error = function(){ syncedData[ pos ].error = arguments; };
			settings.success = function(){ syncedData[ pos ].success = arguments; };
			settings.complete = function(){
				syncedData[ pos ].complete = arguments;
				synced[ pos ].done = true;
		
				if ( pos == 0 || !synced[ pos-1 ] )
					for ( var i = pos; i < synced.length && synced[i].done; i++ ) {
						if ( synced[i].error ) synced[i].error.apply( jQuery, syncedData[i].error );
						if ( synced[i].success ) synced[i].success.apply( jQuery, syncedData[i].success );
						if ( synced[i].complete ) synced[i].complete.apply( jQuery, syncedData[i].complete );
		
						synced[i] = null;
						syncedData[i] = null;
					}
			};
		}
		return ajax.apply(this, arguments);
	};
	
})(jQuery);
/* root/static/js/jquery.qtip.pack.js */
/*
* qTip2 - Pretty powerful tooltips
* http://craigsworks.com/projects/qtip2/
*
* Version: nightly
* Copyright 2009-2010 Craig Michael Thompson - http://craigsworks.com
*
* Dual licensed under MIT or GPLv2 licenses
*   http://en.wikipedia.org/wiki/MIT_License
*   http://en.wikipedia.org/wiki/GNU_General_Public_License
*
* Date: Mon Aug  1 10:57:03 PDT 2011
*/

/*jslint browser: true, onevar: true, undef: true, nomen: true, bitwise: true, regexp: true, newcap: true, immed: true, strict: true */
/*global window: false, jQuery: false, console: false */


eval(function(p,a,c,k,e,d){e=function(c){return(c<a?"":e(parseInt(c/a)))+((c=c%a)>35?String.fromCharCode(c+29):c.toString(36))};if(!''.replace(/^/,String)){while(c--){d[e(c)]=k[c]||e(c)}k=[function(e){return d[e]}];e=function(){return'\\w+'};c=1};while(c--){if(k[c]){p=p.replace(new RegExp('\\b'+e(c)+'\\b','g'),k[c])}}return p}('(7(a,b,c){7 C(b,g){7 w(a){U b=a.1j==="y",c=n[b?"12":"15"],d=n[b?"15":"12"],e=a.1r().2C("1k")>-1,f=c*(e?.5:1),g=1c.5t,h=1c.3M,i,j,k,l=1c.4p(g(f,2)+g(d,2)),m=[p/f*l,p/d*l];m[2]=1c.4p(g(m[0],2)-g(p,2)),m[3]=1c.4p(g(m[1],2)-g(p,2)),i=l+m[2]+m[3]+(e?0:m[0]),j=i/l,k=[h(j*d),h(j*c)];T{15:k[b?0:1],12:k[b?1:0]}}7 v(b){U c=k.1A&&b.y==="9",d=c?k.1A:k.11,e=a.2q.5u,f=e?"-5w-":a.2q.4t?"-4t-":"",g=b.y+(e?"":"-")+b.x,h=f+(e?"1h-4u-"+g:"1h-"+g+"-4u");T 1B(d.16(h),10)||1B(l.16(h),10)||0}7 u(a,b,c){b=b?b:a[a.1j];U d=l.1Y(r),e=k.1A&&a.y==="9",f=e?k.1A:k.11,g="1h-"+b+"-12",h;l.3i(r),h=1B(f.16(g),10),h=(c?h||1B(l.16(g),10):h)||0,l.1P(r,d);T h}7 t(f,g,h,l){Y(k.1g){U n=a.1v({},i.1e),o=h.3I,p=b.2n.18.1U.4g.2w(" "),q=p[0],r=p[1]||p[0],s={S:e,9:e,x:0,y:0},t,u={},v;i.1e.29!==d&&(q==="2b"&&n.1j==="x"&&o.S&&n.y!=="1k"?n.1j=n.1j==="x"?"y":"x":q==="3q"&&o.S&&(n.x=n.x==="1k"?o.S>0?"S":"1n":n.x==="S"?"1n":"S"),r==="2b"&&n.1j==="y"&&o.9&&n.x!=="1k"?n.1j=n.1j==="y"?"x":"y":r==="3q"&&o.9&&(n.y=n.y==="1k"?o.9>0?"9":"1m":n.y==="9"?"1m":"9"),n.1r()!==m.1e&&(m.9!==o.9||m.S!==o.S)&&i.2X(n,e)),t=i.18(n,o),t.1n!==c&&(t.S=-t.1n),t.1m!==c&&(t.9=-t.1m),t.3T=1c.1X(0,j.13);Y(s.S=q==="2b"&&!!o.S)n.x==="1k"?u["2P-S"]=s.x=t["2P-S"]-o.S:(v=t.1n!==c?[o.S,-t.S]:[-o.S,t.S],(s.x=1c.1X(v[0],v[1]))>v[0]&&(h.S-=o.S,s.S=e),u[t.1n!==c?"1n":"S"]=s.x);Y(s.9=r==="2b"&&!!o.9)n.y==="1k"?u["2P-9"]=s.y=t["2P-9"]-o.9:(v=t.1m!==c?[o.9,-t.9]:[-o.9,t.9],(s.y=1c.1X(v[0],v[1]))>v[0]&&(h.9-=o.9,s.9=e),u[t.1m!==c?"1m":"9"]=s.y);k.1g.16(u).23(!(s.x&&s.y||n.x==="1k"&&s.y||n.y==="1k"&&s.x)),h.S-=t.S.3t?t.3T:q!=="2b"||s.9||!s.S&&!s.9?t.S:0,h.9-=t.9.3t?t.3T:r!=="2b"||s.S||!s.S&&!s.9?t.9:0,m.S=o.S,m.9=o.9,m.1e=n.1r()}}U i=V,j=b.2n.1b.1g,k=b.3v,l=k.1E,m={9:0,S:0,1e:""},n={12:j.12,15:j.15},o={},p=j.1h||0,q=".1l-1g",s=!!(a("<4v/>")[0]||{}).41;i.1e=f,i.3y=f,i.1h=p,i.13=j.13,i.2G=n,b.37.1g={"^18.1L|1b.1g.(1e|3y|1h)$":7(){i.2Q()||i.2E(),b.1R()},"^1b.1g.(15|12)$":7(){n={12:j.12,15:j.15},i.3f(),i.2X(),b.1R()},"^11.19.1p|1b.(38|2k)$":7(){k.1g&&i.2X()}},a.1v(i,{2Q:7(){U b=i.5d()&&(s||a.2q.3K);b&&(i.3f(),i.2X(),l.1S(q).1i("5a"+q,t));T b},5d:7(){U a=j.1e,c=b.2n.18,f=c.2t,g=c.1L.1r?c.1L.1r():c.1L;Y(a===e||g===e&&f===e)T e;a===d?i.1e=1O h.2x(g):a.1r||(i.1e=1O h.2x(a),i.1e.29=d);T i.1e.1r()!=="4P"},4w:7(){U c,d,e,f=k.1g.16({86:"",1h:""}),g=i.1e,h=g[g.1j],m="1h-"+h+"-2U",p="1h"+h.3t(0)+h.2L(1)+"7v",q=/5z?\\(0, 0, 0(, 0)?\\)|3o/i,s="5B-2U",t="3o",u=a(1H.3u).16("2U"),v=b.3v.11.16("2U"),w=k.1A&&(g.y==="9"||g.y==="1k"&&f.18().9+n.15/2+j.13<k.1A.3h(1)),x=w?k.1A:k.11;l.3i(r),o.2a=d=f.16(s),o.1h=e=f[0].1b[p]||l.16(m);Y(!d||q.1w(d))o.2a=x.16(s)||t,q.1w(o.2a)&&(o.2a=l.16(s)||d);Y(!e||q.1w(e)||e===u){o.1h=x.16(m)||t;Y(q.1w(o.1h)||o.1h===v)o.1h=e}a("*",f).2c(f).16(s,t).16("1h",""),l.4o(r)},3f:7(){U b=n.12,c=n.15,d;k.1g&&k.1g.22(),k.1g=a("<2z/>",{"1Q":"1z-1E-1g"}).16({12:b,15:c}).5C(l),s?a("<4v/>").3A(k.1g)[0].41("2d").4N():(d=\'<3Q:4c 5D="0,0" 1b="2M:4D-30;18:5E;5f:2j(#39#4C);"></3Q:4c>\',k.1g.2K(d+d))},2X:7(b,c){U g=k.1g,l=g.7i(),m=n.12,q=n.15,r="3V 5F",t="3V 5H 3o",v=j.3y,x=1c.3M,y,z,A,C,D;b||(b=i.1e),v===e?v=b:(v=1O h.2x(v),v.1j=b.1j,v.x==="3C"?v.x=b.x:v.y==="3C"?v.y=b.y:v.x===v.y&&(v[b.1j]=b[b.1j])),y=v.1j,i.4w(),o.1h!=="3o"&&o.1h!=="#5I"?(p=u(b,f,d),j.1h===0&&p>0&&(o.2a=o.1h),i.1h=p=j.1h!==d?j.1h:p):i.1h=p=0,A=B(v,m,q),i.2G=D=w(b),g.16(D),b.1j==="y"?C=[x(v.x==="S"?p:v.x==="1n"?D.12-m-p:(D.12-m)/2),x(v.y==="9"?D.15-q:0)]:C=[x(v.x==="S"?D.12-m:0),x(v.y==="9"?p:v.y==="1m"?D.15-q-p:(D.15-q)/2)],s?(l.1a(D),z=l[0].41("2d"),z.7f(),z.4N(),z.6S(0,0,4S,4S),z.7g(C[0],C[1]),z.5N(),z.5P(A[0][0],A[0][1]),z.4L(A[1][0],A[1][1]),z.4L(A[2][0],A[2][1]),z.5Q(),z.5R=o.2a,z.69=o.1h,z.6b=p*2,z.5T="4B",z.5U=5o,p&&z.4A(),z.2a()):(A="m"+A[0][0]+","+A[0][1]+" l"+A[1][0]+","+A[1][1]+" "+A[2][0]+","+A[2][1]+" 6f",C[2]=p&&/^(r|b)/i.1w(b.1r())?4Q(a.2q.4h,10)===8?2:1:0,l.16({5X:""+(v.1r().2C("1k")>-1),S:C[0]-C[2]*4y(y==="x"),9:C[1]-C[2]*4y(y==="y"),12:m+p,15:q+p}).1t(7(b){U c=a(V);c[c.4z?"4z":"1a"]({5K:m+p+" "+(q+p),60:A,61:o.2a,62:!!b,63:!b}).16({2M:p||b?"30":"4k"}),!b&&c.2K()===""&&c.2K(\'<3Q:4A 64="\'+p*2+\'3V" 2U="\'+o.1h+\'" 85="65" 66="4B"  1b="5f:2j(#39#4C); 2M:4D-30;" />\')})),c!==e&&i.18(b)},18:7(b){U c=k.1g,f={},g=1c.1X(0,j.13),h,l,m;Y(j.1e===e||!c)T e;b=b||i.1e,h=b.1j,l=w(b),m=[b.x,b.y],h==="x"&&m.67(),a.1t(m,7(a,c){U e,i;c==="1k"?(e=h==="y"?"S":"9",f[e]="50%",f["2P-"+e]=-1c.3M(l[h==="y"?"12":"15"]/2)+g):(e=u(b,c,d),i=v(b),f[c]=a?p?u(b,c):0:g+(i>e?i:0))}),f[b[h]]-=l[h==="x"?"12":"15"],c.16({9:"",1m:"",S:"",1n:"",2P:""}).16(f);T f},2E:7(){k.1g&&k.1g.22(),l.1S(q)}}),i.2Q()}7 B(a,b,c){U d=1c.3J(b/2),e=1c.3J(c/2),f={4E:[[0,0],[b,c],[b,0]],5b:[[0,0],[b,0],[0,c]],4F:[[0,c],[b,0],[b,c]],5c:[[0,0],[0,c],[b,c]],7V:[[0,c],[d,0],[b,c]],6a:[[0,0],[b,0],[d,c]],6c:[[0,0],[b,e],[0,c]],6d:[[b,0],[b,c],[0,e]]};f.6e=f.4E,f.6g=f.5b,f.6h=f.4F,f.6i=f.5c;T f[a.1r()]}7 A(b){U c=V,f=b.3v.1E,g=b.2n.11.1y,h=".1l-1y",i=/<3W\\b[^<]*(?:(?!<\\/3W>)<[^<]*)*<\\/3W>/4H,j=d;b.37.1y={"^11.1y":7(a,b,d){b==="1y"&&(g=d),b==="2g"?c.2Q():g&&g.2j?c.3z():f.1S(h)}},a.1v(c,{2Q:7(){g&&g.2j&&f.1S(h)[g.2g?"6j":"1i"]("52"+h,c.3z);T c},3z:7(d,h){7 p(a,c,d){b.2V("11.1p",c+": "+d)}7 o(c){l&&(c=a("<2z/>").2Y(c.2f(i,"")).4J(l)),b.2V("11.1p",c)}7 n(){m&&(f.16("48",""),h=e),a.1J(g.3X)&&g.3X.24(V,1K)}Y(d&&d.3p())T c;U j=g.2j.2C(" "),k=g.2j,l,m=g.2g&&!g.4V&&h;m&&f.16("48","49"),j>-1&&(l=k.2L(j),k=k.2L(0,j)),a.1y(a.1v({6k:o,4K:p,6l:b},g,{2j:k,3X:n}));T c}}),c.2Q()}7 z(b,c){U i,j,k,l,m,n=a(V),o=a(1H.3u),p=V===1H?o:n,q=n.28?n.28(c.28):f,r=c.28.1C==="6m"&&q?q[c.28.3S]:f,s=n.2e(c.28.3S||"6n");6o{s=17 s==="1r"?(1O 6p("T "+s))():s}7z(t){w("59 54 6q 7x 6r 2e: "+s)}l=a.1v(d,{},g.3D,c,17 s==="1q"?x(s):f,x(r||q)),j=l.18,l.1F=b;Y("36"===17 l.11.1p){k=n.1a(l.11.1a);Y(l.11.1a!==e&&k)l.11.1p=k;2u{w("59 54 6t 11 46 1E! 6u 1W 7r 1E 6v 6w: ",n);T e}}j.1M===e&&(j.1M=o),j.14===e&&(j.14=p),l.W.14===e&&(l.W.14=p),l.W.2I===d&&(l.W.2I=o),l.X.14===e&&(l.X.14=p),l.18.1I===d&&(l.18.1I=j.1M),j.2t=1O h.2x(j.2t),j.1L=1O h.2x(j.1L);Y(a.2e(V,"1l"))Y(l.4n)n.1l("2E");2u Y(l.4n===e)T e;(m=a.1a(V,"19"))&&a(V).3r("19").1a(u,m),i=1O y(n,l,b,!!k),a.2e(V,"1l",i),n.1i("22.1l",7(){i.2E()});T i}7 y(s,t,w,y){7 R(){U c=[t.W.14[0],t.X.14[0],z.1o&&G.1E[0],t.18.1M[0],t.18.1I[0],b,1H];z.1o?a([]).6x(a.6y(c,7(a){T 17 a==="1q"})).1S(F):t.W.14.1S(F+"-3f")}7 Q(){7 p(a){E.27(":2o")&&z.1R(a)}7 o(a){Y(E.1Y(m))T e;1G(z.1u.1V),z.1u.1V=2T(7(){z.X(a)},t.X.1V)}7 l(b){Y(E.1Y(m)||C||D)T e;U d=a(b.3E||b.14),g=d.6z(n)[0]===E[0],h=d[0]===f.W[0];1G(z.1u.W),1G(z.1u.X);c.14==="1s"&&g||t.X.29&&(/1s(3G|2A|40)/.1w(b.1C)&&(g||h))?(b.6A(),b.6B()):t.X.2s>0?z.1u.X=2T(7(){z.X(b)},t.X.2s):z.X(b)}7 k(a){Y(E.1Y(m))T e;f.W.2B("1l-"+w+"-1V"),1G(z.1u.W),1G(z.1u.X);U b=7(){z.23(d,a)};t.W.2s>0?z.1u.W=2T(b,t.W.2s):b()}U c=t.18,f={W:t.W.14,X:t.X.14,1I:a(c.1I),1H:a(1H),2N:a(b)},h={W:a.3H(""+t.W.1d).2w(" "),X:a.3H(""+t.X.1d).2w(" ")},j=a.2q.3K&&1B(a.2q.4h,10)===6;E.1i("3k"+F+" 2S"+F,7(a){U b=a.1C==="3k";b&&z.2h(a),E.1P(q,b)}),t.X.29&&(f.X=f.X.2c(E),E.1i("7j"+F,7(){E.1Y(m)||1G(z.1u.X)})),/1s(3G|2A)/i.1w(t.X.1d)?t.X.2A==="2N"&&f.2N.1i("4O"+F,7(a){/6C|4M/.1w(a.14)&&!a.3E&&z.X(a)}):/1s(4l|4f)/i.1w(t.W.1d)&&f.X.1i("2S"+F,7(a){1G(z.1u.W)}),(""+t.X.1d).2C("4I")>-1&&f.1H.1i("4m"+F,7(b){U c=a(b.14),d=!E.1Y(m)&&E.27(":2o");c[0]!==E[0]&&c.6D(n).1f===0&&c.2c(s).1f>1&&z.X(b)}),"2y"===17 t.X.1V&&(f.W.1i("1l-"+w+"-1V",o),a.1t(g.5e,7(a,b){f.X.2c(G.1E).1i(b+F+"-1V",o)})),a.1t(h.X,7(b,c){U d=a.6E(c,h.W),e=a(f.X);d>-1&&e.2c(f.W).1f===e.1f||c==="4I"?(f.W.1i(c+F,7(a){E.27(":2o")?l(a):k(a)}),21 h.W[d]):f.X.1i(c+F,l)}),a.1t(h.W,7(a,b){f.W.1i(b+F,k)}),"2y"===17 t.X.3F&&f.W.2c(E).1i("26"+F,7(a){U b=H.2O||{},c=t.X.3F,d=1c.32;(d(a.1x-b.1x)>=c||d(a.25-b.25)>=c)&&z.X(a)}),c.14==="1s"&&(f.W.1i("26"+F,7(a){i={1x:a.1x,25:a.25,1C:"26"}}),c.1U.1s&&(t.X.1d&&E.1i("2S"+F,7(a){(a.3E||a.14)!==f.W[0]&&z.X(a)}),f.1H.1i("26"+F,7(a){!E.1Y(m)&&E.27(":2o")&&z.1R(a||i)}))),(c.1U.2R||f.1I.1f)&&(a.1d.6F.2R?f.1I:f.2N).1i("2R"+F,p),(f.1I.1f||j&&E.16("18")==="29")&&f.1I.1i("4e"+F,p)}7 P(b,d){7 g(b){7 i(c){c&&(21 h[c.3j],1G(z.1u.3e[c.3j]),a(c).1S(F)),a.6G(h)&&(z.2D(),d!==e&&z.1R(H.1d),b())}U g,h={};Y((g=f.4J("3e:3s([15]):3s([12])")).1f===0)T i();g.1t(7(b,d){h[d.3j]===c&&(7 e(){Y(d.15||d.12)T i(d);z.1u.3e[d.3j]=2T(e,6H)}(),a(d).1i("4K"+F+" 3z"+F,7(){i(V)}),h[d.3j]=d)})}U f=G.11;Y(!z.1o||!b)T e;a.1J(b)&&(b=b.2p(s,H.1d,z)||""),b.1T&&b.1f>0?f.4U().2Y(b.16({2M:"30"})):f.2K(b),z.1o<0?E.3a("4d",g):(D=0,g(a.6I));T z}7 O(b,c){U d=G.19;Y(!z.1o||!b)T e;a.1J(b)&&(b=b.2p(s,H.1d,z));Y(b===e)T K(e);b.1T&&b.1f>0?d.4U().2Y(b.16({2M:"30"})):d.2K(b),z.2D(),c!==e&&z.1o&&E.27(":2o")&&z.1R(H.1d)}7 N(a){U b=G.1D,c=G.19;Y(!z.1o)T e;a?(c||M(),L()):b.22()}7 M(){U b=B+"-19";G.1A&&K(),G.1A=a("<2z />",{"1Q":k+"-1A "+(t.1b.2k?"1z-2k-4R":"")}).2Y(G.19=a("<2z />",{1F:b,"1Q":k+"-19","1N-44":d})).6K(G.11),t.11.19.1D?L():z.1o&&z.2D()}7 L(){U b=t.11.19.1D,c=17 b==="1r",d=c?b:"6M 1E";G.1D&&G.1D.22(),b.1T?G.1D=b:G.1D=a("<a />",{"1Q":"1z-31-39 "+(t.1b.2k?"":k+"-3x"),19:d,"1N-6N":d}).6O(a("<6Z />",{"1Q":"1z-3x 1z-3x-6Y",2K:"&6Q;"})),G.1D.3A(G.1A).1a("4Y","1D").45(7(b){a(V).1P("1z-31-45",b.1C==="3k")}).5g(7(a){E.1Y(m)||z.X(a);T e}).1i("4m 6T 5k 6U 4O",7(b){a(V).1P("1z-31-6V 1z-31-2h",b.1C.2L(-4)==="6W")}),z.2D()}7 K(a){G.19&&(G.1A.22(),G.1A=G.19=G.1D=f,a!==e&&z.1R())}7 J(){U a=t.1b.2k;E.1P(l,a).1P(o,!a),G.11.1P(l+"-11",a),G.1A&&G.1A.1P(l+"-4R",a),G.1D&&G.1D.1P(k+"-3x",!a)}7 I(a){U b=0,c,d=t,e=a.2w(".");3l(d=d[e[b++]])b<e.1f&&(c=d);T[c||t,e.70()]}U z=V,A=1H.3u,B=k+"-"+w,C=0,D=0,E=a(),F=".1l-"+w,G,H;z.1F=w,z.1o=e,z.3v=G={14:s},z.1u={3e:{}},z.2n=t,z.37={},z.2r={},z.2J=H={1d:{},14:a(),2v:e,1a:y},z.37.72={"^1F$":7(b,c,f){U h=f===d?g.3R:f,i=k+"-"+h;h!==e&&h.1f>0&&!a("#"+i).1f&&(E[0].1F=i,G.11[0].1F=i+"-11",G.19[0].1F=i+"-19")},"^11.1p$":7(a,b,c){P(c)},"^11.19.1p$":7(a,b,c){Y(!c)T K();!G.19&&c&&M(),O(c)},"^11.19.1D$":7(a,b,c){N(c)},"^18.(1L|2t)$":7(a,b,c){"1r"===17 c&&(a[b]=1O h.2x(c))},"^18.1M$":7(a,b,c){z.1o&&E.3A(c)},"^W.2H$":7(){z.1o?z.23(d):z.1W(1)},"^1b.38$":7(a,b,c){E.1a("1Q",k+" 1l 1z-4W-4X "+c)},"^1b.2k|11.19":J,"^43.(1W|W|40|X|2h|33)$":7(b,c,d){E[(a.1J(d)?"":"75")+"1i"]("1E"+c,d)},"^(W|X|18).(1d|14|29|1V|2A|3F|1I|1U)":7(){U a=t.18;E.1a("4a",a.14==="1s"&&a.1U.1s),R(),Q()}},a.1v(z,{1W:7(b){Y(z.1o)T z;U c=t.11.19.1p,f=t.18,g=a.3c("76");a.1a(s[0],"1N-4q",B),E=G.1E=a("<2z/>",{1F:B,"1Q":k+" 1l 1z-4W-4X "+o+" "+t.1b.38,12:t.1b.12||"",4a:f.14==="1s"&&f.1U.1s,4Y:"7a","1N-7b":"7c","1N-44":e,"1N-4q":B+"-11","1N-49":d}).1P(m,H.2v).2e("1l",z).3A(t.18.1M).2Y(G.11=a("<2z />",{"1Q":k+"-11",1F:B+"-11","1N-44":d})),z.1o=-1,D=1,C=1,c&&(M(),O(c,e)),P(t.11.1p,e),z.1o=d,J(),a.1t(t.43,7(b,c){a.1J(c)&&E.1i(b==="23"?"52 7l":"1E"+b,c)}),a.1t(h,7(){V.3g==="1W"&&V(z)}),Q(),E.3a("4d",7(a){g.34=H.1d,E.2B(g,[z]),D=0,C=0,z.2D(),(t.W.2H||b)&&z.23(d,H.1d),a()});T z},4x:7(a){U b,c;4G(a.2l()){2W"7n":b={15:E.3h(),12:E.3n()};2F;2W"13":b=h.13(E,t.18.1M);2F;39:c=I(a.2l()),b=c[0][c[1]],b=b.1j?b.1r():b}T b},2V:7(b,c){7 m(a,b){U c,d,e;46(c 1Z k)46(d 1Z k[c])Y(e=(1O 7o(d,"i")).4Z(a))b.4r(e),k[c][d].24(z,b)}U g=/^18\\.(1L|2t|1U|14|1M)|1b|11|W\\.2H/i,h=/^11\\.(19|1a)|1b/i,i=e,j=e,k=z.37,l;"1r"===17 b?(l=b,b={},b[l]=c):b=a.1v(d,{},b),a.1t(b,7(c,d){U e=I(c.2l()),f;f=e[0][e[1]],e[0][e[1]]="1q"===17 d&&d.7p?a(d):d,b[c]=[e[0],e[1],d,f],i=g.1w(c)||i,j=h.1w(c)||j}),x(t),C=D=1,a.1t(b,m),C=D=0,E.27(":2o")&&z.1o&&(i&&z.1R(t.18.14==="1s"?f:H.1d),j&&z.2D());T z},23:7(b,c){7 q(){b?(a.2q.3K&&E[0].1b.4b("3d"),E.16("7q","")):(E.16({2M:"",48:"",5m:"",S:"",9:""}),"1r"===17 h.3U&&a(h.3U,E).2h())}Y(!z.1o)Y(b)z.1W(1);2u T z;U g=b?"W":"X",h=t[g],j=E.27(":2o"),k=!c||t[g].14.1f<2||H.14[0]===c.14,l=t.18,m=t.11,o,p;(17 b).53("36|2y")&&(b=!j);Y(!E.27(":7s")&&j===b&&k)T z;Y(c){Y(/4l|4f/.1w(c.1C)&&/3G|2A/.1w(H.1d.1C)&&c.14===t.W.14[0]&&E.7t(c.3E).1f)T z;H.1d=a.1v({},c)}p=a.3c("1E"+g),p.34=c?H.1d:f,E.2B(p,[z,4j]);Y(p.3p())T z;a.1a(E[0],"1N-49",!b),b?(H.2O=a.1v({},i),z.2h(c),a.1J(m.1p)&&P(m.1p,e),a.1J(m.19.1p)&&O(m.19.1p,e),!v&&l.14==="1s"&&l.1U.1s&&(a(1H).1i("26.1l",7(a){i={1x:a.1x,25:a.25,1C:"26"}}),v=d),z.1R(c),h.2I&&a(n,h.2I).3s(E).1l("X",p)):(1G(z.1u.W),21 H.2O,v&&!a(n+\'[4a="7w"]:2o\',h.2I).3s(E).1f&&(a(1H).1S("26.1l"),v=e),z.33(c)),k&&E.7y(0,1),h.20===e?(E[g](),q.2p(E)):a.1J(h.20)?(h.20.2p(E,z),E.3a("4d",7(a){q(),a()})):E.7A(4j,b?1:0,q),b&&h.14.2B("1l-"+w+"-1V");T z},W:7(a){T z.23(d,a)},X:7(a){T z.23(e,a)},2h:7(b){Y(!z.1o)T z;U c=a(n),d=1B(E[0].1b.3b,10),e=g.5n+c.1f,f=a.1v({},b),h,i;E.1Y(p)||(i=a.3c("7B"),i.34=f,E.2B(i,[z,e]),i.3p()||(d!==e&&(c.1t(7(){V.1b.3b>d&&(V.1b.3b=V.1b.3b-1)}),c.3d("."+p).1l("33",f)),E.3i(p)[0].1b.3b=e));T z},33:7(b){U c=a.1v({},b),d;E.4o(p),d=a.3c("7D"),d.34=c,E.2B(d,[z]);T z},1R:7(c,d){Y(!z.1o||C)T z;C=1;U f=t.18.14,g=t.18,j=g.1L,l=g.2t,m=g.1U,n=m.4g.2w(" "),o=E.3n(),p=E.3h(),q=0,r=0,s=a.3c("5a"),u=E.16("18")==="29",v=g.1I,w={S:0,9:0},x=z.2r.1g,y={3m:n[0],3w:n[1]||n[0],S:7(a){U b=y.3m==="2b",c=v.13.S+v.35,d=j.x==="S"?o:j.x==="1n"?-o:-o/2,e=l.x==="S"?q:l.x==="1n"?-q:-q/2,f=x&&x.2G?x.2G.12||0:0,g=x&&x.1e&&x.1e.1j==="x"&&!b?f:0,h=c-a+g,i=a+o-v.12-c+g,k=d-(j.1j==="x"||j.x===j.y?e:0),n=j.x==="1k";b?(g=x&&x.1e&&x.1e.1j==="y"?f:0,k=(j.x==="S"?1:-1)*d-g,w.S+=h>0?h:i>0?-i:0,w.S=1c.1X(v.13.S+(g&&x.1e.x==="1k"?x.13:0),a-k,1c.3L(1c.1X(v.13.S+v.12,a+k),w.S))):(h>0&&(j.x!=="S"||i>0)?w.S-=k+(n?0:2*m.x):i>0&&(j.x!=="1n"||h>0)&&(w.S-=n?-k:k+2*m.x),w.S!==a&&n&&(w.S-=m.x),w.S<c&&-w.S>i&&(w.S=a));T w.S-a},9:7(a){U b=y.3w==="2b",c=v.13.9+v.2Z,d=j.y==="9"?p:j.y==="1m"?-p:-p/2,e=l.y==="9"?r:l.y==="1m"?-r:-r/2,f=x&&x.2G?x.2G.15||0:0,g=x&&x.1e&&x.1e.1j==="y"&&!b?f:0,h=c-a+g,i=a+p-v.15-c+g,k=d-(j.1j==="y"||j.x===j.y?e:0),n=j.y==="1k";b?(g=x&&x.1e&&x.1e.1j==="x"?f:0,k=(j.y==="9"?1:-1)*d-g,w.9+=h>0?h:i>0?-i:0,w.9=1c.1X(v.13.9+(g&&x.1e.x==="1k"?x.13:0),a-k,1c.3L(1c.1X(v.13.9+v.15,a+k),w.9))):(h>0&&(j.y!=="9"||i>0)?w.9-=k+(n?0:2*m.y):i>0&&(j.y!=="1m"||h>0)&&(w.9-=n?-k:k+2*m.y),w.9!==a&&n&&(w.9-=m.y),w.9<0&&-w.9>i&&(w.9=a));T w.9-a}};Y(a.5q(f)&&f.1f===2)l={x:"S",y:"9"},w={S:f[0],9:f[1]};2u Y(f==="1s"&&(c&&c.1x||H.1d.1x))l={x:"S",y:"9"},c=(c&&(c.1C==="2R"||c.1C==="4e")?H.1d:c&&c.1x&&c.1C==="26"?c:i&&i.1x&&(m.1s||!c||!c.1x)?{1x:i.1x,25:i.25}:!m.1s&&H.2O&&H.2O.1x?H.2O:c)||c||H.1d||i||{},w={9:c.25,S:c.1x};2u{f==="1d"?c&&c.14&&c.1C!=="4e"&&c.1C!=="2R"?f=H.14=a(c.14):f=H.14:H.14=a(f),f=a(f).7G(0);Y(f.1f===0)T z;f[0]===1H||f[0]===b?(q=h.2i?b.7H:f.12(),r=h.2i?b.7I:f.15(),f[0]===b&&(w={9:!u||h.2i?(v||f).2Z():0,S:!u||h.2i?(v||f).35():0})):f.27("7K")&&h.42?w=h.42(f,l):f[0].7L==="7M://7N.7O.7P/7R/4i"&&h.4i?w=h.4i(f,l):(q=f.3n(),r=f.3h(),w=h.13(f,g.1M,u)),w.13&&(q=w.12,r=w.15,w=w.13),w.S+=l.x==="1n"?q:l.x==="1k"?q/2:0,w.9+=l.y==="1m"?r:l.y==="1k"?r/2:0}w.S+=m.x+(j.x==="1n"?-o:j.x==="1k"?-o/2:0),w.9+=m.y+(j.y==="1m"?-p:j.y==="1k"?-p/2:0),v.1T&&f[0]!==b&&f[0]!==A&&y.3w+y.3m!=="7S"?(v={5j:v,15:v[(v[0]===b?"h":"7T")+"7W"](),12:v[(v[0]===b?"w":"7X")+"7Y"](),35:u?0:v.35(),2Z:u?0:v.2Z(),13:v.13()||{S:0,9:0}},w.3I={S:y.3m!=="4k"?y.S(w.S):0,9:y.3w!=="4k"?y.9(w.9):0}):w.3I={S:0,9:0},E.1a("1Q",7(b,c){T a.1a(V,"1Q").2f(/1z-1E-5h-\\w+/i,"")}).3i(k+"-5h-"+j.51()),s.34=a.1v({},c),E.2B(s,[z,w,v.5j||v]);Y(s.3p())T z;21 w.3I,d===e||5l(w.S)||5l(w.9)||f==="1s"||!a.1J(g.20)?E.16(w):a.1J(g.20)&&(g.20.2p(E,z,a.1v({},w)),E.3a(7(b){a(V).16({5m:"",15:""}),a.2q.3K&&V.1b.4b("3d"),b()})),C=0;T z},2D:7(){Y(z.1o<1||D)T z;U a=t.18.1M,b,c,d,e;D=1,t.1b.12?E.16("12",t.1b.12):(E.16("12","").3i(r),c=E.12()+1,d=E.16("1X-12")||"",e=E.16("3L-12")||"",b=(d+e).2C("%")>-1?a.12()/5o:0,d=(d.2C("%")>-1?b:1)*1B(d,10)||c,e=(e.2C("%")>-1?b:1)*1B(e,10)||0,c=d+e?1c.3L(1c.1X(c,e),d):c,E.16("12",1c.3M(c)).4o(r)),D=0;T z},3Y:7(b){"36"!==17 b&&(b=!E.1Y(m)&&!H.2v),z.1o?(E.1P(m,b),a.1a(E[0],"1N-2v",b)):H.2v=!!b;T z},81:7(){T z.3Y(e)},2E:7(){U b=s[0],c=a.1a(b,u);z.1o&&(E.22(),a.1t(z.2r,7(){V.2E&&V.2E()})),1G(z.1u.W),1G(z.1u.X),R(),a.83(b,"1l"),c&&(a.1a(b,"19",c),s.3r(u)),s.3r("1N-4q").1S(".1l"),21 j[z.1F];T s}})}7 x(b){U c;Y(!b||"1q"!==17 b)T e;"1q"!==17 b.28&&(b.28={1C:b.28});Y("11"1Z b){Y("1q"!==17 b.11||b.11.1T)b.11={1p:b.11};c=b.11.1p||e,!a.1J(c)&&(!c&&!c.1a||c.1f<1||"1q"===17 c&&!c.1T)&&(b.11.1p=e),"19"1Z b.11&&("1q"!==17 b.11.19&&(b.11.19={1p:b.11.19}),c=b.11.19.1p||e,!a.1J(c)&&(!c&&!c.1a||c.1f<1||"1q"===17 c&&!c.1T)&&(b.11.19.1p=e))}"18"1Z b&&("1q"!==17 b.18&&(b.18={1L:b.18,2t:b.18})),"W"1Z b&&("1q"!==17 b.W&&(b.W.1T?b.W={14:b.W}:b.W={1d:b.W})),"X"1Z b&&("1q"!==17 b.X&&(b.X.1T?b.X={14:b.X}:b.X={1d:b.X})),"1b"1Z b&&("1q"!==17 b.1b&&(b.1b={38:b.1b})),a.1t(h,7(){V.3N&&V.3N(b)});T b}7 w(){w.3P=w.3P||[],w.3P.4r(1K);Y("1q"===17 3O){U a=3O[3O.4s?"4s":"5r"],b=5s.82.47.2p(1K),c;17 1K[0]==="1r"&&(b[0]="5v: "+b[0]),c=a.24?a.24(3O,b):a(b)}}"5x 5y";U d=!0,e=!1,f=5A,g,h,i,j={},k="1z-1E",l="1z-2k",m="1z-31-2v",n="2z.1l."+k,o=k+"-39",p=k+"-2h",q=k+"-45",r=k+"-78",s="-5M",t="5O",u="57",v;g=a.2m.1l=7(b,h,i){U j=(""+b).2l(),k=f,l=j==="3Y"?[d]:a.5S(1K).47(1),m=l[l.1f-1],n=V[0]?a.2e(V[0],"1l"):f;Y(!1K.1f&&n||j==="5V")T n;Y("1r"===17 b){V.1t(7(){U b=a.2e(V,"1l");Y(!b)T d;m&&m.5W&&(b.2J.1d=m);Y(j!=="4M"&&j!=="2n"||!h)b[j]&&b[j].24(b[j],l);2u Y(a.5Z(h)||i!==c)b.2V(h,i);2u{k=b.4x(h);T e}});T k!==f?k:V}Y("1q"===17 b||!1K.1f){n=x(a.1v(d,{},b));T g.1i.2p(V,n,m)}},g.1i=7(b,f){T V.1t(7(i){7 q(b){7 d(){o.1W(17 b==="1q"||k.W.2H),l.W.2c(l.X).1S(n)}Y(o.2J.2v)T e;o.2J.1d=a.1v({},b),o.2J.14=b?a(b.14):[c],k.W.2s>0?(1G(o.1u.W),o.1u.W=2T(d,k.W.2s),m.W!==m.X&&l.X.1i(m.X,7(){1G(o.1u.W)})):d()}U k,l,m,n,o,p;p=a.5q(b.1F)?b.1F[i]:b.1F,p=!p||p===e||p.1f<1||j[p]?g.3R++:j[p]=p,n=".1l-"+p+"-3f",o=z.2p(V,p,b);Y(o===e)T d;k=o.2n,a.1t(h,7(){V.3g==="3g"&&V(o)}),l={W:k.W.14,X:k.X.14},m={W:a.3H(""+k.W.1d).2f(/ /g,n+" ")+n,X:a.3H(""+k.X.1d).2f(/ /g,n+" ")+n},/1s(4l|4f)/i.1w(m.W)&&!/1s(3G|2A)/i.1w(m.X)&&(m.X+=" 2S"+n),l.W.1i(m.W,q),(k.W.2H||k.5p)&&q(f)})},h=g.2r={2x:7(a){a=(""+a).2f(/([A-Z])/," $1").2f(/6s/4H,"1k").2l(),V.x=(a.3Z(/S|1n/i)||a.3Z(/1k/)||["3C"])[0].2l(),V.y=(a.3Z(/9|1m|1k/i)||["3C"])[0].2l(),V.1j=a.3t(0).53(/^(t|b)/)>-1?"y":"x",V.1r=7(){T V.1j==="y"?V.y+V.x:V.x+V.y},V.51=7(){U a=V.x.2L(0,1),b=V.y.2L(0,1);T a===b?a:a==="c"||a!=="c"&&b!=="c"?b+a:a+b}},13:7(c,d,e){7 l(a,b){f.S+=b*a.35(),f.9+=b*a.2Z()}U f=c.13(),g=d,i=0,j=1H.3u,k;Y(g){6J{g.16("18")!=="6L"&&(k=g[0]===j?{S:1B(g.16("S"),10)||0,9:1B(g.16("9"),10)||0}:g.18(),f.S-=k.S+(1B(g.16("73"),10)||0),f.9-=k.9+(1B(g.16("6P"),10)||0),i++);Y(g[0]===j)2F}3l(g=g.6R());d[0]!==j&&i>1&&l(d,1),(h.2i<4.1&&h.2i>3.1||!h.2i&&e)&&l(a(b),-1)}T f},2i:4Q((""+(/4T.*6X ([0-71]{1,3})|(4T 74).*77.*79/i.4Z(7d.7e)||[0,""])[1]).2f("7h","7k").2f("7m","."))||e,2m:{1a:7(b,c){Y(V.1f){U d=V[0],e="19",f=a.2e(d,"1l");Y(b===e){Y(1K.1f<2)T a.1a(d,u);Y(17 f==="1q"){f&&f.1o&&f.2n.11.1a===e&&f.2J.1a&&f.2V("11.1p",c),a.2m["1a"+t].24(V,1K),a.1a(d,u,a.1a(d,e));T V.3r(e)}}}},55:7(b){U c=a([]),d="19",e;e=a.2m["55"+t].24(V,1K).3d("[57]").1t(7(){a.1a(V,d,a.1a(V,u)),V.4b(u)}).7C();T e},22:a.1z?f:7(b,c){a(V).1t(7(){c||(!b||a.3d(b,[V]).1f)&&a("*",V).2c(V).1t(7(){a(V).7F("22")})})}}},a.1t(h.2m,7(b,c){Y(!c)T d;U e=a.2m[b+t]=a.2m[b];a.2m[b]=7(){T c.24(V,1K)||e.24(V,1K)}}),g.4h="7U",g.3R=0,g.5e="5g 7Z 4m 5k 26 2S 3k".2w(" "),g.5n=80,g.3D={5p:e,1F:e,4n:d,11:{1p:d,1a:"19",19:{1p:e,1D:e}},18:{1L:"9 S",2t:"1m 1n",14:e,1M:e,1I:e,1U:{x:0,y:0,1s:d,2R:d,4g:"3q 3q"},20:7(b,c,d){a(V).5G(c,{5J:5L,3a:e})}},W:{14:e,1d:"3k",20:d,2s:4j,2I:e,2H:e,3U:e},X:{14:e,1d:"2S",20:d,2s:0,29:e,1V:e,2A:"2N",3F:e},1b:{38:"",2k:e,12:e},43:{1W:f,40:f,W:f,X:f,23:f,2h:f,33:f}},h.1y=7(a){U b=a.2r.1y;T"1q"===17 b?b:a.2r.1y=1O A(a)},h.1y.3g="1W",h.1y.3N=7(a){U b=a.11,c;b&&"1y"1Z b&&(c=b.1y,17 c!=="1q"&&(c=a.11.1y={2j:c}),"36"!==17 c.2g&&c.2g&&(c.2g=!!c.2g))},a.1v(d,g.3D,{11:{1y:{4V:d,2g:d}}}),h.42=7(b,c){7 l(a,b){U d=0,e=1,f=1,g=0,h=0,i=a.12,j=a.15;3l(i>0&&j>0&&e>0&&f>0){i=1c.3B(i/2),j=1c.3B(j/2),c.x==="S"?e=i:c.x==="1n"?e=a.12-i:e+=1c.3B(i/2),c.y==="9"?f=j:c.y==="1m"?f=a.15-j:f+=1c.3B(j/2),d=b.1f;3l(d--){Y(b.1f<2)2F;g=b[d][0]-a.13.S,h=b[d][1]-a.13.9,(c.x==="S"&&g>=e||c.x==="1n"&&g<=e||c.x==="1k"&&(g<e||g>a.12-e)||c.y==="9"&&h>=f||c.y==="1m"&&h<=f||c.y==="1k"&&(h<f||h>a.15-f))&&b.7u(d,1)}}T{S:b[0][0],9:b[0][1]}}b.1T||(b=a(b));U d=b.1a("4c").2l(),e=b.1a("7E").2w(","),f=[],g=a(\'3e[7J="#\'+b.7Q("58").1a("3S")+\'"]\'),h=g.13(),i={12:0,15:0,13:{9:5i,1n:0,1m:0,S:5i}},j=0,k=0;h.S+=1c.3J((g.3n()-g.12())/2),h.9+=1c.3J((g.3h()-g.15())/2);Y(d==="56"){j=e.1f;3l(j--)k=[1B(e[--j],10),1B(e[j+1],10)],k[0]>i.13.1n&&(i.13.1n=k[0]),k[0]<i.13.S&&(i.13.S=k[0]),k[1]>i.13.1m&&(i.13.1m=k[1]),k[1]<i.13.9&&(i.13.9=k[1]),f.4r(k)}2u f=a.58(e,7(a){T 1B(a,10)});4G(d){2W"5Y":i={12:1c.32(f[2]-f[0]),15:1c.32(f[3]-f[1]),13:{S:f[0],9:f[1]}};2F;2W"68":i={12:f[2]+2,15:f[2]+2,13:{S:f[0],9:f[1]}};2F;2W"56":a.1v(i,{12:1c.32(i.13.1n-i.13.S),15:1c.32(i.13.1m-i.13.9)}),c.1r()==="4P"?i.13={S:i.13.S+i.12/2,9:i.13.9+i.15/2}:i.13=l(i,f.47()),i.12=i.15=0}i.13.S+=h.S,i.13.9+=h.9;T i},h.1g=7(a){U b=a.2r.1g;T"1q"===17 b?b:a.2r.1g=1O C(a)},h.1g.3g="1W",h.1g.3N=7(a){U b=a.1b,c;b&&"1g"1Z b&&(c=a.1b.1g,17 c!=="1q"&&(a.1b.1g={1e:c}),/1r|36/i.1w(17 c.1e)||(c.1e=d),17 c.12!=="2y"&&21 c.12,17 c.15!=="2y"&&21 c.15,17 c.1h!=="2y"&&c.1h!==d&&21 c.1h,17 c.13!=="2y"&&21 c.13)},a.1v(d,g.3D,{1b:{1g:{1e:d,3y:e,12:6,15:6,1h:d,13:0}}})})(84,2N)',62,503,'|||||||function||top|||||||||||||||||||||||||||||||||||||||||||||left|return|var|this|show|hide|if|||content|width|offset|target|height|css|typeof|position|title|attr|style|Math|event|corner|length|tip|border|bind|precedance|center|qtip|bottom|right|rendered|text|object|string|mouse|each|timers|extend|test|pageX|ajax|ui|titlebar|parseInt|type|button|tooltip|id|clearTimeout|document|viewport|isFunction|arguments|my|container|aria|new|toggleClass|class|reposition|unbind|jquery|adjust|inactive|render|max|hasClass|in|effect|delete|remove|toggle|apply|pageY|mousemove|is|metadata|fixed|fill|shift|add||data|replace|once|focus|iOS|url|widget|toLowerCase|fn|options|visible|call|browser|plugins|delay|at|else|disabled|split|Corner|number|div|leave|trigger|indexOf|redraw|destroy|break|size|ready|solo|cache|html|substr|display|window|origin|margin|init|resize|mouseleave|setTimeout|color|set|case|update|append|scrollTop|block|state|abs|blur|originalEvent|scrollLeft|boolean|checks|classes|default|queue|zIndex|Event|filter|img|create|initialize|outerHeight|addClass|src|mouseenter|while|horizontal|outerWidth|transparent|isDefaultPrevented|flip|removeAttr|not|charAt|body|elements|vertical|icon|mimic|load|appendTo|floor|inherit|defaults|relatedTarget|distance|out|trim|adjusted|ceil|msie|min|round|sanitize|console|history|vml|nextid|name|user|autofocus|px|script|complete|disable|match|move|getContext|imagemap|events|atomic|hover|for|slice|visibility|hidden|tracking|removeAttribute|shape|fx|scroll|enter|method|version|svg|90|none|over|mousedown|overwrite|removeClass|sqrt|describedby|push|warn|webkit|radius|canvas|detectColours|get|Number|prop|stroke|miter|VML|inline|bottomright|topright|switch|gi|unfocus|find|error|lineTo|option|save|mouseout|centercenter|parseFloat|header|3e3|CPU|empty|loading|helper|reset|role|exec||abbreviation|tooltipshow|search|to|clone|poly|oldtitle|map|Unable|tooltipmove|bottomleft|topleft|detectCorner|inactiveEvents|behavior|click|pos|1e10|elem|mouseup|isNaN|opacity|zindex|100|prerender|isArray|log|Array|pow|mozilla|qTip2|moz|use|strict|rgba|null|background|prependTo|coordorigin|absolute|solid|animate|dashed|123456|duration|coordsize|200|31000px|beginPath|_replacedByqTip|moveTo|closePath|fillStyle|makeArray|lineJoin|miterLimit|api|timeStamp|antialias|rect|isPlainObject|path|fillcolor|filled|stroked|weight|1000|joinstyle|reverse|circle|strokeStyle|bottomcenter|lineWidth|rightcenter|leftcenter|lefttop|xe|righttop|leftbottom|rightbottom|one|success|context|html5|qtipopts|try|Function|parse|attribute|middle|locate|Aborting|on|element|pushStack|grep|closest|preventDefault|stopImmediatePropagation|select|parents|inArray|special|isEmptyObject|700|noop|do|insertBefore|static|Close|label|prepend|borderTopWidth|times|offsetParent|clearRect|keydown|keyup|active|down|OS|close|span|pop|9_|builtin|borderLeftWidth|like|un|tooltiprender|AppleWebKit|fluid|Mobile|alert|live|polite|navigator|userAgent|restore|translate|undefined|children|mouseover|3_2|tooltiphide|_|dimensions|RegExp|nodeType|overflow|of|animated|has|splice|Color|true|HTML5|stop|catch|fadeTo|tooltipfocus|end|tooltipblur|coords|triggerHandler|eq|innerWidth|innerHeight|usemap|area|namespaceURI|http|www|w3|org|parent|2000|nonenone|outerH|nightly|topcenter|eight|outerW|idth|dblclick|15e3|enable|prototype|removeData|jQuery|miterlimit|backgroundColor'.split('|'),0,{}))
/*
 * jQuery Autocomplete plugin 1.2.1
 *
 * Copyright (c) 2009 Jörn Zaefferer
 *
 * Dual licensed under the MIT and GPL licenses:
 *   http://www.opensource.org/licenses/mit-license.php
 *   http://www.gnu.org/licenses/gpl.html
 *
 * With small modifications by Alfonso Gómez-Arzola.
 * See changelog for details.
 *
 */
eval(function(p,a,c,k,e,r){e=function(c){return(c<a?'':e(parseInt(c/a)))+((c=c%a)>35?String.fromCharCode(c+29):c.toString(36))};if(!''.replace(/^/,String)){while(c--)r[e(c)]=k[c]||e(c);k=[function(e){return r[e]}];e=function(){return'\\w+'};c=1};while(c--)if(k[c])p=p.replace(new RegExp('\\b'+e(c)+'\\b','g'),k[c]);return p}(';(5($){$.1n.1N({1g:5(26,3){6 1Q=X 26=="2e";3=$.1N({},$.Q.2F,{16:1Q?26:J,7:1Q?J:26,1Z:1Q?$.Q.2F.1Z:10,K:3&&!3.1R?10:4Z},3);3.29=3.29||5(e){a e};3.23=3.23||3.2P;a o.N(5(){2O $.Q(o,3)})},w:5(20){a o.1a("w",20)},1u:5(20){a o.1f("1u",[20])},2N:5(){a o.1f("2N")},2L:5(3){a o.1f("2L",[3])},2K:5(){a o.1f("2K")}});$.Q=5(g,3){6 F={3F:38,31:40,3i:46,3l:9,3A:13,3K:27,3S:4X,2Z:33,3b:34,3d:8};6 1Y=J;4(3.1t!=J&&X 3.1t=="5"){1Y=3.1t}6 $g=$(g).4T("1g","4R").R(3.3G);6 1l;6 1e="";6 1J=$.Q.2X(3);6 1h=0;6 22;6 11={1G:p};6 h=$.Q.3f(3,g,2E,11);6 1V;$.2C.3o&&$(g.3v).1a("4Q.1g",5(){4(1V){1V=p;a p}});$g.1a(($.2C.3o?"4P":"4M")+".1g",5(u){1h=1;22=u.3I;4L(u.3I){Y F.3F:4(h.E()){u.1E();h.2W()}j{Z(0,y)}W;Y F.31:4(h.E()){u.1E();h.36()}j{Z(0,y)}W;Y F.2Z:4(h.E()){u.1E();h.37()}j{Z(0,y)}W;Y F.3b:4(h.E()){u.1E();h.39()}j{Z(0,y)}W;Y 3.1m&&$.1B(3.S)==","&&F.3S:Y F.3l:Y F.3A:4(2E()){u.1E();1V=y;a p}W;Y F.3K:h.17();W;4J:2y(1l);1l=2w(Z,3.1Z);W}}).2u(5(){1h++}).4I(5(){1h=0;4(!11.1G){3p()}}).3r(5(){4(3.3u){4(!h.E()){Z(0,y)}}j{4(1h++>1&&!h.E()){Z(0,y)}}}).1a("1u",5(){6 1n=(2d.f>1)?2d[1]:J;5 2t(q,7){6 w;4(7&&7.f){1k(6 i=0;i<7.f;i++){4(7[i].w.M()==q.M()){w=7[i];W}}}4(X 1n=="5")1n(w);j $g.1f("w",w&&[w.7,w.e])}$.N(1d($g.L()),5(i,e){2s(e,2t,2t)})}).1a("2N",5(){1J.1r()}).1a("2L",5(){$.1N(y,3,2d[1]);4("7"2S 2d[1])1J.1A()}).1a("2K",5(){h.21();$g.21();$(g.3v).21(".1g")});5 2E(){6 I=h.I();4(!I)a p;6 v=I.w;1e=v;4(3.1m){6 A=1d($g.L());4(A.f>1){6 35=3.S.f;6 1s=$(g).1j().D;6 2r,1L=0;$.N(A,5(i,1v){1L+=1v.f;4(1s<=1L){2r=i;a p}1L+=35});A[2r]=v;v=A.3e(3.S)}v+=3.S}$g.L(v);1w();$g.1f("w",[I.7,I.e]);a y}5 Z(4H,3g){4(22==F.3i){h.17();a}6 P=$g.L();4(!3g&&P==1e)a;1e=P;P=1y(P);4(P.f>=3.2o){$g.R(3.2n);4(!3.1T)P=P.M();2s(P,3q,1w)}j{1U();h.17()}};5 1d(e){4(!e)a[""];4(!3.1m)a[$.1B(e)];a $.4C(e.2m(3.S),5(1v){a $.1B(e).f?$.1B(1v):J})}5 1y(e){4(!3.1m)a e;6 A=1d(e);4(A.f==1)a A[0];6 1s=$(g).1j().D;4(1s==e.f){A=1d(e)}j{A=1d(e.2l(e.3y(1s),""))}a A[A.f-1]}5 1X(q,2k){4(3.1X&&(1y($g.L()).M()==q.M())&&22!=F.3d){$g.L($g.L()+2k.3y(1y(1e).f));$(g).1j(1e.f,1e.f+2k.f)}};5 3p(){2y(1l);1l=2w(1w,4B)};5 1w(){6 4A=h.E();h.17();2y(1l);1U();4(3.3j){$g.1u(5(w){4(!w){4(3.1m){6 A=1d($g.L()).1F(0,-1);$g.L(A.3e(3.S)+(A.f?3.S:""))}j{$g.L("");$g.1f("w",J)}}})}};5 3q(q,7){4(7&&7.f&&1h){1U();h.3H(7,q);1X(q,7[0].e);h.2i()}j{1w()}};5 2s(z,24,1t){4(!3.1T)z=z.M();6 7=1J.3M(z);4(7&&7.f){24(z,7)}j 4((X 3.16=="2e")&&(3.16.f>0)){6 1H={4z:+2O 4x()};$.N(3.1H,5(3P,28){1H[3P]=X 28=="5"?28():28});$.3V({4u:"4q",4p:"1g"+g.4o,2V:3.2V,16:3.16,7:$.1N({q:1y(z),4n:3.K},1H),24:5(7){6 1c=3.2c&&3.2c(7)||2c(7);1J.1K(z,1c);24(z,1c)}})}j{h.30();4(1Y!=J){1Y()}j{1t(z)}}};5 2c(7){6 1c=[];6 2g=7.2m("\\n");1k(6 i=0;i<2g.f;i++){6 B=$.1B(2g[i]);4(B){B=B.2m("|");1c[1c.f]={7:B,e:B[0],w:3.2a&&3.2a(B,B[0])||B[0]}}}a 1c};5 1U(){$g.1I(3.2n)}};$.Q.2F={3G:"4m",3a:"4j",2n:"4i",2o:1,1Z:4h,1T:p,1p:y,1S:p,1z:4g,K:4f,3j:p,1H:{},2q:y,2P:5(B){a B[0]},23:J,1X:p,C:0,1m:p,S:" ",3k:y,3u:p,29:5(e,z){a e.2l(2O 4e("(?![^&;]+;)(?!<[^<>]*)("+z.2l(/([\\^\\$\\(\\)\\[\\]\\{\\}\\*\\.\\+\\?\\|\\\\])/3m,"\\\\$1")+")(?![^<>]*>)(?![^&;]+;)","3m"),"<3n>$1</3n>")},1R:y,1M:4d,2v:y};$.Q.2X=5(3){6 7={};6 f=0;5 1p(s,2x){4(!3.1T)s=s.M();6 i=s.3t(2x);4(3.1S=="1v"){i=s.M().1u("\\\\b"+2x.M())}4(i==-1)a p;a i==0||3.1S};5 1K(q,e){4(f>3.1z){1r()}4(!7[q]){f++}7[q]=e}5 1A(){4(!3.7)a p;6 18={},3w=0;4(!3.16)3.1z=1;18[""]=[];1k(6 i=0,3x=3.7.f;i<3x;i++){6 U=3.7[i];U=(X U=="2e")?[U]:U;6 e=3.23(U,i+1,3.7.f);4(e===p)2B;6 1W=e.45(0).M();4(!18[1W])18[1W]=[];6 B={e:e,7:U,w:3.2a&&3.2a(U)||e};18[1W].2D(B);4(3w++<3.K){18[""].2D(B)}};$.N(18,5(i,e){3.1z++;1K(i,e)})}2w(1A,25);5 1r(){7={};f=0}a{1r:1r,1K:1K,1A:1A,3M:5(q){4(!3.1z||!f)a J;4(!3.16&&3.1S){6 15=[];1k(6 k 2S 7){4(k.f>0){6 c=7[k];$.N(c,5(i,x){4(1p(x.e,q)){15.2D(x)}})}}a 15}j 4(7[q]){a 7[q]}j 4(3.1p){1k(6 i=q.f-1;i>=3.2o;i--){6 c=7[q.43(0,i)];4(c){6 15=[];$.N(c,5(i,x){4(1p(x.e,q)){15[15.f]=x}});a 15}}}a J}}};$.Q.3f=5(3,g,h,11){6 H={G:"3Z"};6 m,l=-1,7,z="",2M=y,t,r;5 3Q(){4(!2M)a;t=$("<3X/>").17().R(3.3a).14("4w","3W").2R(2Q.3R).3Y(5(u){4($(o).3L(":E")){g.2u()}11.1G=p});r=$("<41/>").2R(t).42(5(u){4(19(u).3D&&19(u).3D.44()==\'3B\'){l=$("1x",r).1I(H.G).47(19(u));$(19(u)).R(H.G)}}).3r(5(u){$(19(u)).R(H.G);h();4(3.3k)g.2u();a p}).48(5(){11.1G=y}).49(5(){11.1G=p});4(3.C>0)t.14("C",3.C);2M=p}5 19(u){6 t=u.19;4a(t&&t.4b!="3B")t=t.4c;4(!t)a[];a t}5 1b(1o){m.1F(l,l+1).1I(H.G);3h(1o);6 2p=m.1F(l,l+1).R(H.G);4(3.1R){6 O=0;m.1F(0,l).N(5(){O+=o.1C});4((O+2p[0].1C-r.1D())>r[0].4k){r.1D(O+2p[0].1C-r.4l())}j 4(O<r.1D()){r.1D(O)}}};5 3h(1o){4(3.2v||(!3.2v&&!((1o<0&&l==0)||(1o>0&&l==m.1i()-1)))){l+=1o;4(l<0){l=m.1i()-1}j 4(l>=m.1i()){l=0}}}5 32(2z){a 3.K&&3.K<2z?3.K:2z}5 2U(){r.2T();6 K=32(7.f);1k(6 i=0;i<K;i++){4(!7[i])2B;6 2h=3.2P(7[i].7,i+1,K,7[i].e,z);4(2h===p)2B;6 1x=$("<1x/>").4r(3.29(2h,z)).R(i%2==0?"4s":"4t").2R(r)[0];$.7(1x,"3U",7[i])}m=r.4v("1x");4(3.2q){m.1F(0,1).R(H.G);l=0}4($.1n.3T)r.3T()}a{3H:5(d,q){3Q();7=d;z=q;2U()},36:5(){1b(1)},2W:5(){1b(-1)},37:5(){4(l!=0&&l-8<0){1b(-l)}j{1b(-8)}},39:5(){4(l!=m.1i()-1&&l+8>m.1i()){1b(m.1i()-1-l)}j{1b(8)}},17:5(){t&&t.17();m&&m.1I(H.G);l=-1},E:5(){a t&&t.3L(":E")},4y:5(){a o.E()&&(m.3O("."+H.G)[0]||3.2q&&m[0])},2i:5(){6 O=$(g).O();t.14({C:X 3.C=="2e"||3.C>0?3.C:$(g).C(),3E:O.3E+g.1C,2j:O.2j}).2i();4(3.1R){r.1D(0);r.14({3s:3.1M,4D:\'4E\'});4($.2C.4F&&X 2Q.3R.4G.3s==="1O"){6 2b=0;m.N(5(){2b+=o.1C});6 2f=2b>3.1M;r.14(\'4K\',2f?3.1M:2b);4(!2f){m.C(r.C()-3J(m.14("3C-2j"))-3J(m.14("3C-4N")))}}}},I:5(){6 I=m&&m.3O("."+H.G).1I(H.G);a I&&I.f&&$.7(I[0],"3U")},30:5(){r&&r.2T()},21:5(){t&&t.4O()}}};$.1n.1j=5(D,V){4(D!==1O){a o.N(5(){4(o.2A){6 12=o.2A();4(V===1O||D==V){12.4S("2G",D);12.h()}j{12.4U(y);12.4V("2G",D);12.4W("2G",V);12.h()}}j 4(o.3c){o.3c(D,V)}j 4(o.1P){o.1P=D;o.2Y=V}})}6 T=o[0];4(T.2A){6 2H=2Q.1j.4Y(),3z=T.e,2I="<->",2J=2H.3N.f;2H.3N=2I;6 1q=T.e.3t(2I);T.e=3z;o.1j(1q,1q+2J);a{D:1q,V:1q+2J}}j 4(T.1P!==1O){a{D:T.1P,V:T.2Y}}}})(50);',62,311,'|||options|if|function|var|data|||return||||value|length|input|select||else||active|listItems||this|false||list||element|event||result||true|term|words|row|width|start|visible|KEY|ACTIVE|CLASSES|selected|null|max|val|toLowerCase|each|offset|currentValue|Autocompleter|addClass|multipleSeparator|field|rawValue|end|break|typeof|case|onChange||config|selRange||css|csub|url|hide|stMatchSets|target|bind|moveSelect|parsed|trimWords|previousValue|trigger|autocomplete|hasFocus|size|selection|for|timeout|multiple|fn|step|matchSubset|caretAt|flush|cursorAt|failure|search|word|hideResultsNow|li|lastWord|cacheLength|populate|trim|offsetHeight|scrollTop|preventDefault|slice|mouseDownOnSelect|extraParams|removeClass|cache|add|progress|scrollHeight|extend|undefined|selectionStart|isUrl|scroll|matchContains|matchCase|stopLoading|blockSubmit|firstChar|autoFill|globalFailure|delay|handler|unbind|lastKeyPressCode|formatMatch|success||urlOrData||param|highlight|formatResult|listHeight|parse|arguments|string|scrollbarsVisible|rows|formatted|show|left|sValue|replace|split|loadingClass|minChars|activeItem|selectFirst|wordAt|request|findValueCallback|focus|scrollJumpPosition|setTimeout|sub|clearTimeout|available|createTextRange|continue|browser|push|selectCurrent|defaults|character|range|teststring|textLength|unautocomplete|setOptions|needsInit|flushCache|new|formatItem|document|appendTo|in|empty|fillList|dataType|prev|Cache|selectionEnd|PAGEUP|emptyList|DOWN|limitNumberOfItems|||seperator|next|pageUp||pageDown|resultsClass|PAGEDOWN|setSelectionRange|BACKSPACE|join|Select|skipPrevCheck|movePosition|DEL|mustMatch|inputFocus|TAB|gi|strong|opera|hideResults|receiveData|click|maxHeight|indexOf|clickFire|form|nullData|ol|substring|orig|RETURN|LI|padding|nodeName|top|UP|inputClass|display|keyCode|parseInt|ESC|is|load|text|filter|key|init|body|COMMA|bgiframe|ac_data|ajax|absolute|div|hover|ac_over||ul|mouseover|substr|toUpperCase|charAt||index|mousedown|mouseup|while|tagName|parentNode|180|RegExp|1000|100|400|ac_loading|ac_results|clientHeight|innerHeight|ac_input|limit|name|port|abort|html|ac_even|ac_odd|mode|find|position|Date|current|timestamp|wasVisible|200|map|overflow|auto|msie|style|crap|blur|default|height|switch|keydown|right|remove|keypress|submit|off|move|attr|collapse|moveStart|moveEnd|188|createRange|150|jQuery'.split('|'),0,{}))
/**
 * SyntaxHighlighter
 * http://alexgorbatchev.com/SyntaxHighlighter
 *
 * SyntaxHighlighter is donationware. If you are using it, please donate.
 * http://alexgorbatchev.com/SyntaxHighlighter/donate.html
 *
 * @version
 * 3.0.83 (July 02 2010)
 * 
 * @copyright
 * Copyright (C) 2004-2010 Alex Gorbatchev.
 *
 * @license
 * Dual licensed under the MIT and GPL licenses.
 */
var XRegExp;if(XRegExp){throw Error("can't load XRegExp twice in the same frame")}(function(){XRegExp=function(w,r){var q=[],u=XRegExp.OUTSIDE_CLASS,x=0,p,s,v,t,y;if(XRegExp.isRegExp(w)){if(r!==undefined){throw TypeError("can't supply flags when constructing one RegExp from another")}return j(w)}if(g){throw Error("can't call the XRegExp constructor within token definition functions")}r=r||"";p={hasNamedCapture:false,captureNames:[],hasFlag:function(z){return r.indexOf(z)>-1},setFlag:function(z){r+=z}};while(x<w.length){s=o(w,x,u,p);if(s){q.push(s.output);x+=(s.match[0].length||1)}else{if(v=m.exec.call(i[u],w.slice(x))){q.push(v[0]);x+=v[0].length}else{t=w.charAt(x);if(t==="["){u=XRegExp.INSIDE_CLASS}else{if(t==="]"){u=XRegExp.OUTSIDE_CLASS}}q.push(t);x++}}}y=RegExp(q.join(""),m.replace.call(r,h,""));y._xregexp={source:w,captureNames:p.hasNamedCapture?p.captureNames:null};return y};XRegExp.version="1.5.0";XRegExp.INSIDE_CLASS=1;XRegExp.OUTSIDE_CLASS=2;var c=/\$(?:(\d\d?|[$&`'])|{([$\w]+)})/g,h=/[^gimy]+|([\s\S])(?=[\s\S]*\1)/g,n=/^(?:[?*+]|{\d+(?:,\d*)?})\??/,g=false,k=[],m={exec:RegExp.prototype.exec,test:RegExp.prototype.test,match:String.prototype.match,replace:String.prototype.replace,split:String.prototype.split},a=m.exec.call(/()??/,"")[1]===undefined,e=function(){var p=/^/g;m.test.call(p,"");return!p.lastIndex}(),f=function(){var p=/x/g;m.replace.call("x",p,"");return!p.lastIndex}(),b=RegExp.prototype.sticky!==undefined,i={};i[XRegExp.INSIDE_CLASS]=/^(?:\\(?:[0-3][0-7]{0,2}|[4-7][0-7]?|x[\dA-Fa-f]{2}|u[\dA-Fa-f]{4}|c[A-Za-z]|[\s\S]))/;i[XRegExp.OUTSIDE_CLASS]=/^(?:\\(?:0(?:[0-3][0-7]{0,2}|[4-7][0-7]?)?|[1-9]\d*|x[\dA-Fa-f]{2}|u[\dA-Fa-f]{4}|c[A-Za-z]|[\s\S])|\(\?[:=!]|[?*+]\?|{\d+(?:,\d*)?}\??)/;XRegExp.addToken=function(s,r,q,p){k.push({pattern:j(s,"g"+(b?"y":"")),handler:r,scope:q||XRegExp.OUTSIDE_CLASS,trigger:p||null})};XRegExp.cache=function(r,p){var q=r+"/"+(p||"");return XRegExp.cache[q]||(XRegExp.cache[q]=XRegExp(r,p))};XRegExp.copyAsGlobal=function(p){return j(p,"g")};XRegExp.escape=function(p){return p.replace(/[-[\]{}()*+?.,\\^$|#\s]/g,"\\$&")};XRegExp.execAt=function(s,r,t,q){r=j(r,"g"+((q&&b)?"y":""));r.lastIndex=t=t||0;var p=r.exec(s);if(q){return(p&&p.index===t)?p:null}else{return p}};XRegExp.freezeTokens=function(){XRegExp.addToken=function(){throw Error("can't run addToken after freezeTokens")}};XRegExp.isRegExp=function(p){return Object.prototype.toString.call(p)==="[object RegExp]"};XRegExp.iterate=function(u,p,v,s){var t=j(p,"g"),r=-1,q;while(q=t.exec(u)){v.call(s,q,++r,u,t);if(t.lastIndex===q.index){t.lastIndex++}}if(p.global){p.lastIndex=0}};XRegExp.matchChain=function(q,p){return function r(s,x){var v=p[x].regex?p[x]:{regex:p[x]},u=j(v.regex,"g"),w=[],t;for(t=0;t<s.length;t++){XRegExp.iterate(s[t],u,function(y){w.push(v.backref?(y[v.backref]||""):y[0])})}return((x===p.length-1)||!w.length)?w:r(w,x+1)}([q],0)};RegExp.prototype.apply=function(q,p){return this.exec(p[0])};RegExp.prototype.call=function(p,q){return this.exec(q)};RegExp.prototype.exec=function(t){var r=m.exec.apply(this,arguments),q,p;if(r){if(!a&&r.length>1&&l(r,"")>-1){p=RegExp(this.source,m.replace.call(d(this),"g",""));m.replace.call(t.toString().slice(r.index),p,function(){for(var u=1;u<arguments.length-2;u++){if(arguments[u]===undefined){r[u]=undefined}}})}if(this._xregexp&&this._xregexp.captureNames){for(var s=1;s<r.length;s++){q=this._xregexp.captureNames[s-1];if(q){r[q]=r[s]}}}if(!e&&this.global&&!r[0].length&&(this.lastIndex>r.index)){this.lastIndex--}}return r};if(!e){RegExp.prototype.test=function(q){var p=m.exec.call(this,q);if(p&&this.global&&!p[0].length&&(this.lastIndex>p.index)){this.lastIndex--}return!!p}}String.prototype.match=function(q){if(!XRegExp.isRegExp(q)){q=RegExp(q)}if(q.global){var p=m.match.apply(this,arguments);q.lastIndex=0;return p}return q.exec(this)};String.prototype.replace=function(r,s){var t=XRegExp.isRegExp(r),q,p,u;if(t&&typeof s.valueOf()==="string"&&s.indexOf("${")===-1&&f){return m.replace.apply(this,arguments)}if(!t){r=r+""}else{if(r._xregexp){q=r._xregexp.captureNames}}if(typeof s==="function"){p=m.replace.call(this,r,function(){if(q){arguments[0]=new String(arguments[0]);for(var v=0;v<q.length;v++){if(q[v]){arguments[0][q[v]]=arguments[v+1]}}}if(t&&r.global){r.lastIndex=arguments[arguments.length-2]+arguments[0].length}return s.apply(null,arguments)})}else{u=this+"";p=m.replace.call(u,r,function(){var v=arguments;return m.replace.call(s,c,function(x,w,A){if(w){switch(w){case"$":return"$";case"&":return v[0];case"`":return v[v.length-1].slice(0,v[v.length-2]);case"'":return v[v.length-1].slice(v[v.length-2]+v[0].length);default:var y="";w=+w;if(!w){return x}while(w>v.length-3){y=String.prototype.slice.call(w,-1)+y;w=Math.floor(w/10)}return(w?v[w]||"":"$")+y}}else{var z=+A;if(z<=v.length-3){return v[z]}z=q?l(q,A):-1;return z>-1?v[z+1]:x}})})}if(t&&r.global){r.lastIndex=0}return p};String.prototype.split=function(u,p){if(!XRegExp.isRegExp(u)){return m.split.apply(this,arguments)}var w=this+"",r=[],v=0,t,q;if(p===undefined||+p<0){p=Infinity}else{p=Math.floor(+p);if(!p){return[]}}u=XRegExp.copyAsGlobal(u);while(t=u.exec(w)){if(u.lastIndex>v){r.push(w.slice(v,t.index));if(t.length>1&&t.index<w.length){Array.prototype.push.apply(r,t.slice(1))}q=t[0].length;v=u.lastIndex;if(r.length>=p){break}}if(u.lastIndex===t.index){u.lastIndex++}}if(v===w.length){if(!m.test.call(u,"")||q){r.push("")}}else{r.push(w.slice(v))}return r.length>p?r.slice(0,p):r};function j(r,q){if(!XRegExp.isRegExp(r)){throw TypeError("type RegExp expected")}var p=r._xregexp;r=XRegExp(r.source,d(r)+(q||""));if(p){r._xregexp={source:p.source,captureNames:p.captureNames?p.captureNames.slice(0):null}}return r}function d(p){return(p.global?"g":"")+(p.ignoreCase?"i":"")+(p.multiline?"m":"")+(p.extended?"x":"")+(p.sticky?"y":"")}function o(v,u,w,p){var r=k.length,y,s,x;g=true;try{while(r--){x=k[r];if((w&x.scope)&&(!x.trigger||x.trigger.call(p))){x.pattern.lastIndex=u;s=x.pattern.exec(v);if(s&&s.index===u){y={output:x.handler.call(p,s,w),match:s};break}}}}catch(q){throw q}finally{g=false}return y}function l(s,q,r){if(Array.prototype.indexOf){return s.indexOf(q,r)}for(var p=r||0;p<s.length;p++){if(s[p]===q){return p}}return-1}XRegExp.addToken(/\(\?#[^)]*\)/,function(p){return m.test.call(n,p.input.slice(p.index+p[0].length))?"":"(?:)"});XRegExp.addToken(/\((?!\?)/,function(){this.captureNames.push(null);return"("});XRegExp.addToken(/\(\?<([$\w]+)>/,function(p){this.captureNames.push(p[1]);this.hasNamedCapture=true;return"("});XRegExp.addToken(/\\k<([\w$]+)>/,function(q){var p=l(this.captureNames,q[1]);return p>-1?"\\"+(p+1)+(isNaN(q.input.charAt(q.index+q[0].length))?"":"(?:)"):q[0]});XRegExp.addToken(/\[\^?]/,function(p){return p[0]==="[]"?"\\b\\B":"[\\s\\S]"});XRegExp.addToken(/^\(\?([imsx]+)\)/,function(p){this.setFlag(p[1]);return""});XRegExp.addToken(/(?:\s+|#.*)+/,function(p){return m.test.call(n,p.input.slice(p.index+p[0].length))?"":"(?:)"},XRegExp.OUTSIDE_CLASS,function(){return this.hasFlag("x")});XRegExp.addToken(/\./,function(){return"[\\s\\S]"},XRegExp.OUTSIDE_CLASS,function(){return this.hasFlag("s")})})();var SyntaxHighlighter=function(){if(typeof(require)!='undefined'&&typeof(XRegExp)=='undefined')
{XRegExp=require('XRegExp').XRegExp;}
var sh={defaults:{'class-name':'','first-line':1,'pad-line-numbers':false,'highlight':null,'title':null,'smart-tabs':true,'tab-size':4,'gutter':true,'toolbar':true,'quick-code':true,'collapse':false,'auto-links':true,'light':false,'html-script':false},config:{space:'&nbsp;',useScriptTags:true,bloggerMode:false,stripBrs:false,tagName:'pre',strings:{expandSource:'expand source',help:'?',alert:'SyntaxHighlighter\n\n',noBrush:'Can\'t find brush for: ',brushNotHtmlScript:'Brush wasn\'t configured for html-script option: ',aboutDialog:'<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd"><html xmlns="http://www.w3.org/1999/xhtml"><head><meta http-equiv="Content-Type" content="text/html; charset=utf-8" /><title>About SyntaxHighlighter</title></head><body style="font-family:Geneva,Arial,Helvetica,sans-serif;background-color:#fff;color:#000;font-size:1em;text-align:center;"><div style="text-align:center;margin-top:1.5em;"><div style="font-size:xx-large;">SyntaxHighlighter</div><div style="font-size:.75em;margin-bottom:3em;"><div>version 3.0.83 (July 02 2010)</div><div><a href="http://alexgorbatchev.com/SyntaxHighlighter" target="_blank" style="color:#005896">http://alexgorbatchev.com/SyntaxHighlighter</a></div><div>JavaScript code syntax highlighter.</div><div>Copyright 2004-2010 Alex Gorbatchev.</div></div><div>If you like this script, please <a href="https://www.paypal.com/cgi-bin/webscr?cmd=_s-xclick&hosted_button_id=2930402" style="color:#005896">donate</a> to <br/>keep development active!</div></div></body></html>'}},vars:{discoveredBrushes:null,highlighters:{}},brushes:{},regexLib:{multiLineCComments:/\/\*[\s\S]*?\*\//gm,singleLineCComments:/\/\/.*$/gm,singleLinePerlComments:/#.*$/gm,doubleQuotedString:/"([^\\"\n]|\\.)*"/g,singleQuotedString:/'([^\\'\n]|\\.)*'/g,multiLineDoubleQuotedString:new XRegExp('"([^\\\\"]|\\\\.)*"','gs'),multiLineSingleQuotedString:new XRegExp("'([^\\\\']|\\\\.)*'",'gs'),xmlComments:/(&lt;|<)!--[\s\S]*?--(&gt;|>)/gm,url:/\w+:\/\/[\w-.\/?%&=:@;#]*/g,phpScriptTags:{left:/(&lt;|<)\?=?/g,right:/\?(&gt;|>)/g},aspScriptTags:{left:/(&lt;|<)%=?/g,right:/%(&gt;|>)/g},scriptScriptTags:{left:/(&lt;|<)\s*script.*?(&gt;|>)/gi,right:/(&lt;|<)\/\s*script\s*(&gt;|>)/gi}},toolbar:{getHtml:function(highlighter)
{var html='<div class="toolbar">',items=sh.toolbar.items,list=items.list;function defaultGetHtml(highlighter,name)
{return sh.toolbar.getButtonHtml(highlighter,name,sh.config.strings[name]);};for(var i=0;i<list.length;i++)
html+=(items[list[i]].getHtml||defaultGetHtml)(highlighter,list[i]);html+='</div>';return html;},getButtonHtml:function(highlighter,commandName,label)
{return'<span><a href="#" class="toolbar_item'
+' command_'+commandName
+' '+commandName
+'">'+label+'</a></span>';},handler:function(e)
{var target=e.target,className=target.className||'';function getValue(name)
{var r=new RegExp(name+'_(\\w+)'),match=r.exec(className);return match?match[1]:null;};var highlighter=getHighlighterById(findParentElement(target,'.syntaxhighlighter').id),commandName=getValue('command');if(highlighter&&commandName)
sh.toolbar.items[commandName].execute(highlighter);e.preventDefault();},items:{list:['expandSource','help'],expandSource:{getHtml:function(highlighter)
{if(highlighter.getParam('collapse')!=true)
return'';var title=highlighter.getParam('title');return sh.toolbar.getButtonHtml(highlighter,'expandSource',title?title:sh.config.strings.expandSource);},execute:function(highlighter)
{var div=getHighlighterDivById(highlighter.id);removeClass(div,'collapsed');}},help:{execute:function(highlighter)
{var wnd=popup('','_blank',500,250,'scrollbars=0'),doc=wnd.document;doc.write(sh.config.strings.aboutDialog);doc.close();wnd.focus();}}}},findElements:function(globalParams,element)
{var elements=element?[element]:toArray(document.getElementsByTagName(sh.config.tagName)),conf=sh.config,result=[];if(conf.useScriptTags)
elements=elements.concat(getSyntaxHighlighterScriptTags());if(elements.length===0)
return result;for(var i=0;i<elements.length;i++)
{var item={target:elements[i],params:merge(globalParams,parseParams(elements[i].className))};if(item.params['brush']==null)
continue;result.push(item);}
return result;},highlight:function(globalParams,element)
{var elements=this.findElements(globalParams,element),propertyName='innerHTML',highlighter=null,conf=sh.config;if(elements.length===0)
return;for(var i=0;i<elements.length;i++)
{var element=elements[i],target=element.target,params=element.params,brushName=params.brush,code;if(brushName==null)
continue;if(params['html-script']=='true'||sh.defaults['html-script']==true)
{highlighter=new sh.HtmlScript(brushName);brushName='htmlscript';}
else
{var brush=findBrush(brushName);if(brush)
highlighter=new brush();else
continue;}
code=target[propertyName];if(conf.useScriptTags)
code=stripCData(code);if((target.title||'')!='')
params.title=target.title;params['brush']=brushName;highlighter.init(params);element=highlighter.getDiv(code);if((target.id||'')!='')
element.id=target.id;target.parentNode.replaceChild(element,target);}},all:function(params)
{attachEvent(window,'load',function(){sh.highlight(params);});}};sh['all']=sh.all;sh['highlight']=sh.highlight;function hasClass(target,className)
{return target.className.indexOf(className)!=-1;};function addClass(target,className)
{if(!hasClass(target,className))
target.className+=' '+className;};function removeClass(target,className)
{target.className=target.className.replace(className,'');};function toArray(source)
{var result=[];for(var i=0;i<source.length;i++)
result.push(source[i]);return result;};function splitLines(block)
{return block.split(/\r?\n/);}
function getHighlighterId(id)
{var prefix='highlighter_';return id.indexOf(prefix)==0?id:prefix+id;};function getHighlighterById(id)
{return sh.vars.highlighters[getHighlighterId(id)];};function getHighlighterDivById(id)
{return document.getElementById(getHighlighterId(id));};function storeHighlighter(highlighter)
{sh.vars.highlighters[getHighlighterId(highlighter.id)]=highlighter;};function findElement(target,search,reverse)
{if(target==null)
return null;var nodes=reverse!=true?target.childNodes:[target.parentNode],propertyToFind={'#':'id','.':'className'}[search.substr(0,1)]||'nodeName',expectedValue,found;expectedValue=propertyToFind!='nodeName'?search.substr(1):search.toUpperCase();if((target[propertyToFind]||'').indexOf(expectedValue)!=-1)
return target;for(var i=0;nodes&&i<nodes.length&&found==null;i++)
found=findElement(nodes[i],search,reverse);return found;};function findParentElement(target,className)
{return findElement(target,className,true);};function indexOf(array,searchElement,fromIndex)
{fromIndex=Math.max(fromIndex||0,0);for(var i=fromIndex;i<array.length;i++)
if(array[i]==searchElement)
return i;return-1;};function guid(prefix)
{return(prefix||'')+Math.round(Math.random()*1000000).toString();};function merge(obj1,obj2)
{var result={},name;for(name in obj1)
result[name]=obj1[name];for(name in obj2)
result[name]=obj2[name];return result;};function toBoolean(value)
{var result={"true":true,"false":false}[value];return result==null?value:result;};function popup(url,name,width,height,options)
{var x=(screen.width-width)/2,y=(screen.height-height)/2;options+=', left='+x+
', top='+y+
', width='+width+
', height='+height;options=options.replace(/^,/,'');var win=window.open(url,name,options);win.focus();return win;};function attachEvent(obj,type,func,scope)
{function handler(e)
{e=e||window.event;if(!e.target)
{e.target=e.srcElement;e.preventDefault=function()
{this.returnValue=false;};}
func.call(scope||window,e);};if(obj.attachEvent)
{obj.attachEvent('on'+type,handler);}
else
{obj.addEventListener(type,handler,false);}};function alert(str)
{window.alert(sh.config.strings.alert+str);};function findBrush(alias,showAlert)
{var brushes=sh.vars.discoveredBrushes,result=null;if(brushes==null)
{brushes={};for(var brush in sh.brushes)
{var info=sh.brushes[brush],aliases=info.aliases;if(aliases==null)
continue;info.brushName=brush.toLowerCase();for(var i=0;i<aliases.length;i++)
brushes[aliases[i]]=brush;}
sh.vars.discoveredBrushes=brushes;}
result=sh.brushes[brushes[alias]];if(result==null&&showAlert!=false)
alert(sh.config.strings.noBrush+alias);return result;};function eachLine(str,callback)
{var lines=splitLines(str);for(var i=0;i<lines.length;i++)
lines[i]=callback(lines[i],i);return lines.join('\r\n');};function trimFirstAndLastLines(str)
{return str.replace(/^[ ]*[\n]+|[\n]*[ ]*$/g,'');};function parseParams(str)
{var match,result={},arrayRegex=new XRegExp("^\\[(?<values>(.*?))\\]$"),regex=new XRegExp("(?<name>[\\w-]+)"+
"\\s*:\\s*"+
"(?<value>"+
"[\\w-%#]+|"+
"\\[.*?\\]|"+
'".*?"|'+
"'.*?'"+
")\\s*;?","g");while((match=regex.exec(str))!=null)
{var value=match.value
.replace(/^['"]|['"]$/g,'');if(value!=null&&arrayRegex.test(value))
{var m=arrayRegex.exec(value);value=m.values.length>0?m.values.split(/\s*,\s*/):[];}
result[match.name]=value;}
return result;};function wrapLinesWithCode(str,css)
{if(str==null||str.length==0||str=='\n')
return str;str=str.replace(/</g,'&lt;');str=str.replace(/ {2,}/g,function(m)
{var spaces='';for(var i=0;i<m.length-1;i++)
spaces+=sh.config.space;return spaces+' ';});if(css!=null)
str=eachLine(str,function(line)
{if(line.length==0)
return'';var spaces='';line=line.replace(/^(&nbsp;| )+/,function(s)
{spaces=s;return'';});if(line.length==0)
return spaces;return spaces+'<code class="'+css+'">'+line+'</code>';});return str;};function padNumber(number,length)
{var result=number.toString();while(result.length<length)
result='0'+result;return result;};function processTabs(code,tabSize)
{var tab='';for(var i=0;i<tabSize;i++)
tab+=' ';return code.replace(/\t/g,tab);};function processSmartTabs(code,tabSize)
{var lines=splitLines(code),tab='\t',spaces='';for(var i=0;i<50;i++)
spaces+='                    ';function insertSpaces(line,pos,count)
{return line.substr(0,pos)
+spaces.substr(0,count)
+line.substr(pos+1,line.length);};code=eachLine(code,function(line)
{if(line.indexOf(tab)==-1)
return line;var pos=0;while((pos=line.indexOf(tab))!=-1)
{var spaces=tabSize-pos%tabSize;line=insertSpaces(line,pos,spaces);}
return line;});return code;};function fixInputString(str)
{var br=/<br\s*\/?>|&lt;br\s*\/?&gt;/gi;if(sh.config.bloggerMode==true)
str=str.replace(br,'\n');if(sh.config.stripBrs==true)
str=str.replace(br,'');return str;};function trim(str)
{return str.replace(/^\s+|\s+$/g,'');};function unindent(str)
{var lines=splitLines(fixInputString(str)),indents=new Array(),regex=/^\s*/,min=1000;for(var i=0;i<lines.length&&min>0;i++)
{var line=lines[i];if(trim(line).length==0)
continue;var matches=regex.exec(line);if(matches==null)
return str;min=Math.min(matches[0].length,min);}
if(min>0)
for(var i=0;i<lines.length;i++)
lines[i]=lines[i].substr(min);return lines.join('\n');};function matchesSortCallback(m1,m2)
{if(m1.index<m2.index)
return-1;else if(m1.index>m2.index)
return 1;else
{if(m1.length<m2.length)
return-1;else if(m1.length>m2.length)
return 1;}
return 0;};function getMatches(code,regexInfo)
{function defaultAdd(match,regexInfo)
{return match[0];};var index=0,match=null,matches=[],func=regexInfo.func?regexInfo.func:defaultAdd;while((match=regexInfo.regex.exec(code))!=null)
{var resultMatch=func(match,regexInfo);if(typeof(resultMatch)=='string')
resultMatch=[new sh.Match(resultMatch,match.index,regexInfo.css)];matches=matches.concat(resultMatch);}
return matches;};function processUrls(code)
{var gt=/(.*)((&gt;|&lt;).*)/;code=code.replace(sh.regexLib.url,function(m)
{var suffix='',match=null;if(match=gt.exec(m))
{m=match[1];suffix=match[2];}
return'<a href="'+m+'">'+m+'</a>'+suffix;});var destination=document.location.href.match(/\/source\//)?'source':'module';return code.replace(/(<code class="pl keyword">(use|package|require|extends|with|use base|use parent|use aliased)<\/code> <code class="pl plain">)([A-Za-z0-9\:]+)(.*?<\/code>)/g,'$1<a href="/'+destination+'/$3">$3</a>$4');};function getSyntaxHighlighterScriptTags()
{var tags=document.getElementsByTagName('script'),result=[];for(var i=0;i<tags.length;i++)
if(tags[i].type=='syntaxhighlighter')
result.push(tags[i]);return result;};function stripCData(original)
{var left='<![CDATA[',right=']]>',copy=trim(original),changed=false,leftLength=left.length,rightLength=right.length;if(copy.indexOf(left)==0)
{copy=copy.substring(leftLength);changed=true;}
var copyLength=copy.length;if(copy.indexOf(right)==copyLength-rightLength)
{copy=copy.substring(0,copyLength-rightLength);changed=true;}
return changed?copy:original;};function quickCodeHandler(e)
{var target=e.target,highlighterDiv=findParentElement(target,'.syntaxhighlighter'),container=findParentElement(target,'.container'),textarea=document.createElement('textarea'),highlighter;if(!container||!highlighterDiv||findElement(container,'textarea'))
return;highlighter=getHighlighterById(highlighterDiv.id);addClass(highlighterDiv,'source');var lines=container.childNodes,code=[];for(var i=0;i<lines.length;i++)
code.push(lines[i].innerText||lines[i].textContent);code=code.join('\r');textarea.appendChild(document.createTextNode(code));container.appendChild(textarea);textarea.focus();textarea.select();attachEvent(textarea,'blur',function(e)
{textarea.parentNode.removeChild(textarea);removeClass(highlighterDiv,'source');});};sh.Match=function(value,index,css)
{this.value=value;this.index=index;this.length=value.length;this.css=css;this.brushName=null;};sh.Match.prototype.toString=function()
{return this.value;};sh.HtmlScript=function(scriptBrushName)
{var brushClass=findBrush(scriptBrushName),scriptBrush,xmlBrush=new sh.brushes.Xml(),bracketsRegex=null,ref=this,methodsToExpose='getDiv getHtml init'.split(' ');if(brushClass==null)
return;scriptBrush=new brushClass();for(var i=0;i<methodsToExpose.length;i++)
(function(){var name=methodsToExpose[i];ref[name]=function()
{return xmlBrush[name].apply(xmlBrush,arguments);};})();if(scriptBrush.htmlScript==null)
{alert(sh.config.strings.brushNotHtmlScript+scriptBrushName);return;}
xmlBrush.regexList.push({regex:scriptBrush.htmlScript.code,func:process});function offsetMatches(matches,offset)
{for(var j=0;j<matches.length;j++)
matches[j].index+=offset;}
function process(match,info)
{var code=match.code,matches=[],regexList=scriptBrush.regexList,offset=match.index+match.left.length,htmlScript=scriptBrush.htmlScript,result;for(var i=0;i<regexList.length;i++)
{result=getMatches(code,regexList[i]);offsetMatches(result,offset);matches=matches.concat(result);}
if(htmlScript.left!=null&&match.left!=null)
{result=getMatches(match.left,htmlScript.left);offsetMatches(result,match.index);matches=matches.concat(result);}
if(htmlScript.right!=null&&match.right!=null)
{result=getMatches(match.right,htmlScript.right);offsetMatches(result,match.index+match[0].lastIndexOf(match.right));matches=matches.concat(result);}
for(var j=0;j<matches.length;j++)
matches[j].brushName=brushClass.brushName;return matches;}};sh.Highlighter=function()
{};sh.Highlighter.prototype={getParam:function(name,defaultValue)
{var result=this.params[name];return toBoolean(result==null?defaultValue:result);},create:function(name)
{return document.createElement(name);},findMatches:function(regexList,code)
{var result=[];if(regexList!=null)
for(var i=0;i<regexList.length;i++)
if(typeof(regexList[i])=="object")
result=result.concat(getMatches(code,regexList[i]));return this.removeNestedMatches(result.sort(matchesSortCallback));},removeNestedMatches:function(matches)
{for(var i=0;i<matches.length;i++)
{if(matches[i]===null)
continue;var itemI=matches[i],itemIEndPos=itemI.index+itemI.length;for(var j=i+1;j<matches.length&&matches[i]!==null;j++)
{var itemJ=matches[j];if(itemJ===null)
continue;else if(itemJ.index>itemIEndPos)
break;else if(itemJ.index==itemI.index&&itemJ.length>itemI.length)
matches[i]=null;else if(itemJ.index>=itemI.index&&itemJ.index<itemIEndPos)
matches[j]=null;}}
return matches;},figureOutLineNumbers:function(code)
{var lines=[],firstLine=parseInt(this.getParam('first-line'));eachLine(code,function(line,index)
{lines.push(index+firstLine);});return lines;},isLineHighlighted:function(lineNumber)
{var list=this.getParam('highlight',[]);if(typeof(list)!='object'&&list.push==null)
list=[list];return indexOf(list,lineNumber.toString())!=-1;},getLineHtml:function(lineIndex,lineNumber,code)
{var classes=['line','number'+lineNumber,'index'+lineIndex,'alt'+(lineNumber%2==0?1:2).toString()];if(this.isLineHighlighted(lineNumber))
classes.push('highlighted');if(lineNumber==0)
classes.push('break');return'<div class="'+classes.join(' ')+'">'+code+'</div>';},getLineNumbersHtml:function(code,lineNumbers)
{var html='',count=splitLines(code).length,firstLine=parseInt(this.getParam('first-line')),pad=this.getParam('pad-line-numbers');if(pad==true)
pad=(firstLine+count-1).toString().length;else if(isNaN(pad)==true)
pad=0;for(var i=0;i<count;i++)
{var lineNumber=lineNumbers?lineNumbers[i]:firstLine+i,code=lineNumber==0?sh.config.space:padNumber(lineNumber,pad);code='<a href="#L'+lineNumber+'" id="L'+lineNumber+'">'+code+'</a>';html+=this.getLineHtml(i,lineNumber,code);}
return html;},getCodeLinesHtml:function(html,lineNumbers)
{html=trim(html);var lines=splitLines(html),padLength=this.getParam('pad-line-numbers'),firstLine=parseInt(this.getParam('first-line')),html='',brushName=this.getParam('brush');for(var i=0;i<lines.length;i++)
{var line=lines[i],indent=/^(&nbsp;|\s)+/.exec(line),spaces=null,lineNumber=lineNumbers?lineNumbers[i]:firstLine+i;;if(indent!=null)
{spaces=indent[0].toString();line=line.substr(spaces.length);spaces=spaces.replace(' ',sh.config.space);}
line=trim(line);if(line.length==0)
line=sh.config.space;html+=this.getLineHtml(i,lineNumber,(spaces!=null?'<code class="'+brushName+' spaces">'+spaces+'</code>':'')+line);}
return html;},getTitleHtml:function(title)
{return title?'<caption>'+title+'</caption>':'';},getMatchesHtml:function(code,matches)
{var pos=0,result='',brushName=this.getParam('brush','');function getBrushNameCss(match)
{var result=match?(match.brushName||brushName):brushName;return result?result+' ':'';};for(var i=0;i<matches.length;i++)
{var match=matches[i],matchBrushName;if(match===null||match.length===0)
continue;matchBrushName=getBrushNameCss(match);result+=wrapLinesWithCode(code.substr(pos,match.index-pos),matchBrushName+'plain')
+wrapLinesWithCode(match.value,matchBrushName+match.css);pos=match.index+match.length+(match.offset||0);}
result+=wrapLinesWithCode(code.substr(pos),getBrushNameCss()+'plain');return result;},getHtml:function(code)
{var html='',classes=['syntaxhighlighter'],tabSize,matches,lineNumbers;if(this.getParam('light')==true)
this.params.toolbar=this.params.gutter=false;className='syntaxhighlighter';if(this.getParam('collapse')==true)
classes.push('collapsed');if((gutter=this.getParam('gutter'))==false)
classes.push('nogutter');classes.push(this.getParam('class-name'));classes.push(this.getParam('brush'));code=trimFirstAndLastLines(code)
.replace(/\r/g,' ');tabSize=this.getParam('tab-size');code=this.getParam('smart-tabs')==true?processSmartTabs(code,tabSize):processTabs(code,tabSize);code=unindent(code);if(gutter)
lineNumbers=this.figureOutLineNumbers(code);matches=this.findMatches(this.regexList,code);html=this.getMatchesHtml(code,matches);html=this.getCodeLinesHtml(html,lineNumbers);if(this.getParam('auto-links'))
html=processUrls(html);if(typeof(navigator)!='undefined'&&navigator.userAgent&&navigator.userAgent.match(/MSIE/))
classes.push('ie');html='<div id="'+getHighlighterId(this.id)+'" class="'+classes.join(' ')+'">'
+(this.getParam('toolbar')?sh.toolbar.getHtml(this):'')
+'<table border="0" cellpadding="0" cellspacing="0">'
+this.getTitleHtml(this.getParam('title'))
+'<tbody>'
+'<tr>'
+(gutter?'<td class="gutter">'+this.getLineNumbersHtml(code)+'</td>':'')
+'<td class="code">'
+'<div class="container">'
+html
+'</div>'
+'</td>'
+'</tr>'
+'</tbody>'
+'</table>'
+'</div>';return html;},getDiv:function(code)
{if(code===null)
code='';this.code=code;var div=this.create('div');div.innerHTML=this.getHtml(code);if(this.getParam('toolbar'))
attachEvent(findElement(div,'.toolbar'),'click',sh.toolbar.handler);if(this.getParam('quick-code'))
attachEvent(findElement(div,'.code'),'dblclick',quickCodeHandler);return div;},init:function(params)
{this.id=guid();storeHighlighter(this);this.params=merge(sh.defaults,params||{})
if(this.getParam('light')==true)
this.params.toolbar=this.params.gutter=false;},getKeywords:function(str)
{str=str
.replace(/^\s+|\s+$/g,'')
.replace(/\s+/g,'|');return'\\b(?:'+str+')\\b';},forHtmlScript:function(regexGroup)
{this.htmlScript={left:{regex:regexGroup.left,css:'script'},right:{regex:regexGroup.right,css:'script'},code:new XRegExp("(?<left>"+regexGroup.left.source+")"+
"(?<code>.*?)"+
"(?<right>"+regexGroup.right.source+")","sgi")};}};return sh;}();typeof(exports)!='undefined'?exports['SyntaxHighlighter']=SyntaxHighlighter:null;/**
 * SyntaxHighlighter
 * http://alexgorbatchev.com/SyntaxHighlighter
 *
 * SyntaxHighlighter is donationware. If you are using it, please donate.
 * http://alexgorbatchev.com/SyntaxHighlighter/donate.html
 *
 * @version
 * 3.0.83 (July 02 2010)
 *
 * @copyright
 * Copyright (C) 2004-2010 Alex Gorbatchev.
 *
 * @license
 * Dual licensed under the MIT and GPL licenses.
 */;(function()
{typeof(require)!='undefined'?SyntaxHighlighter=require('shCore').SyntaxHighlighter:null;function Brush()
{var funcs='abs accept alarm atan2 bind binmode chdir chmod chomp chop chown chr '+
'chroot close closedir connect cos crypt defined delete each endgrent '+
'endhostent endnetent endprotoent endpwent endservent eof exec exists '+
'exp fcntl fileno flock fork format formline getc getgrent getgrgid '+
'getgrnam gethostbyaddr gethostbyname gethostent getlogin getnetbyaddr '+
'getnetbyname getnetent getpeername getpgrp getppid getpriority '+
'getprotobyname getprotobynumber getprotoent getpwent getpwnam getpwuid '+
'getservbyname getservbyport getservent getsockname getsockopt glob '+
'gmtime grep hex index int ioctl join keys kill lc lcfirst length link '+
'listen localtime lock log lstat map mkdir msgctl msgget msgrcv msgsnd '+
'oct open opendir ord pack pipe pop pos print printf prototype push '+
'quotemeta rand read readdir readline readlink readpipe recv rename '+
'reset reverse rewinddir rindex rmdir scalar seek seekdir select semctl '+
'semget semop send setgrent sethostent setnetent setpgrp setpriority '+
'setprotoent setpwent setservent setsockopt shift shmctl shmget shmread '+
'shmwrite shutdown sin sleep socket socketpair sort splice split sprintf '+
'sqrt srand stat study substr symlink syscall sysopen sysread sysseek '+
'system syswrite tell telldir time times tr truncate uc ucfirst umask '+
'undef unlink unpack unshift utime values vec wait waitpid warn write '+
'say';var keywords='bless caller continue dbmclose dbmopen die do dump else elsif eval exit '+
'for foreach goto if import last local my next no our package redo ref '+
'require return sub tie tied unless untie until use wantarray while '+
'given when default '+
'try catch finally '+
'has extends with before after around override augment';this.regexList=[{regex:/(<<|&lt;&lt;)((\w+)|(['"])(.+?)\4)[\s\S]+?\n\3\5\n/g,css:'string'},{regex:/#.*$/gm,css:'comments'},{regex:/^#!.*\n/g,css:'preprocessor'},{regex:/-?\w+(?=\s*=(>|&gt;))/g,css:'string'},{regex:/\bq[qwxr]?\([\s\S]*?\)/g,css:'string'},{regex:/\bq[qwxr]?\{[\s\S]*?\}/g,css:'string'},{regex:/\bq[qwxr]?\[[\s\S]*?\]/g,css:'string'},{regex:/\bq[qwxr]?(<|&lt;)[\s\S]*?(>|&gt;)/g,css:'string'},{regex:/\bq[qwxr]?([^\w({<[])[\s\S]*?\1/g,css:'string'},{regex:SyntaxHighlighter.regexLib.doubleQuotedString,css:'string'},{regex:SyntaxHighlighter.regexLib.singleQuotedString,css:'string'},{regex:/(?:&amp;|[$@%*]|\$#)[a-zA-Z_](\w+|::)*/g,css:'variable'},{regex:/(^|\n)\s*__(?:END|DATA)__\b[\s\S]*$/g,css:'comments'},{regex:/(^|\n)=\w[\s\S]*?(\n=cut\s*\n|$)/g,css:'comments'},{regex:new RegExp(this.getKeywords(funcs),'gm'),css:'functions'},{regex:new RegExp(this.getKeywords(keywords),'gm'),css:'keyword'}];this.forHtmlScript(SyntaxHighlighter.regexLib.phpScriptTags);}
Brush.prototype=new SyntaxHighlighter.Highlighter();Brush.aliases=['perl','Perl','pl'];SyntaxHighlighter.brushes.Perl=Brush;typeof(exports)!='undefined'?exports.Brush=Brush:null;})();/**
 * SyntaxHighlighter
 * http://alexgorbatchev.com/SyntaxHighlighter
 *
 * SyntaxHighlighter is donationware. If you are using it, please donate.
 * http://alexgorbatchev.com/SyntaxHighlighter/donate.html
 *
 * @version
 * 3.0.83 (July 02 2010)
 * 
 * @copyright
 * Copyright (C) 2004-2010 Alex Gorbatchev.
 *
 * @license
 * Dual licensed under the MIT and GPL licenses.
 */;(function()
{typeof(require)!='undefined'?SyntaxHighlighter=require('shCore').SyntaxHighlighter:null;function Brush()
{};Brush.prototype=new SyntaxHighlighter.Highlighter();Brush.aliases=['text','plain'];SyntaxHighlighter.brushes.Plain=Brush;typeof(exports)!='undefined'?exports.Brush=Brush:null;})();/**
 * SyntaxHighlighter
 * http://alexgorbatchev.com/
 *
 * SyntaxHighlighter is donationware. If you are using it, please donate.
 * http://alexgorbatchev.com/wiki/SyntaxHighlighter:Donate
 *
 * @version
 * 2.0.320 (July 26 2009)
 * 
 * @copyright
 * Copyright (C) 2004-2009 Alex Gorbatchev.
 * Copyright (C) 2009 Nicolas Perriault
 *
 * @license
 * This file is part of SyntaxHighlighter.
 * 
 * SyntaxHighlighter is free software: you can redistribute it and/or modify
 * it under the terms of the GNU Lesser General Public License as published by
 * the Free Software Foundation, either version 3 of the License, or
 * (at your option) any later version.
 * 
 * SyntaxHighlighter is distributed in the hope that it will be useful,
 * but WITHOUT ANY WARRANTY; without even the implied warranty of
 * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
 * GNU General Public License for more details.
 * 
 * You should have received a copy of the GNU General Public License
 * along with SyntaxHighlighter.  If not, see <http://www.gnu.org/copyleft/lesser.html>.
 */
SyntaxHighlighter.brushes.Yaml=function()
{var constants='~ true false on off';this.regexList=[{regex:SyntaxHighlighter.regexLib.singleLinePerlComments,css:'comments'},{regex:SyntaxHighlighter.regexLib.doubleQuotedString,css:'string'},{regex:SyntaxHighlighter.regexLib.singleQuotedString,css:'string'},{regex:/^\s*([a-z0-9\._:-])+\s*:\s/gmi,css:'variable'},{regex:/\s?(\.)([a-z0-9\._-])+\s?:/gmi,css:'comments'},{regex:/\s(@|:)([a-z0-9\._-])+\s*$/gmi,css:'variable bold'},{regex:/\s+\d+\s?$/gm,css:'color2 bold'},{regex:/(\{|\}|\[|\]|,|~|:)/gm,css:'constants'},{regex:/^\s+(-)+/gm,css:'string bold'},{regex:/^---/gm,css:'string bold'},{regex:new RegExp(this.getKeywords(constants),'gmi'),css:'constants'}];};SyntaxHighlighter.brushes.Yaml.prototype=new SyntaxHighlighter.Highlighter();SyntaxHighlighter.brushes.Yaml.aliases=['yaml','yml'];/**
 * SyntaxHighlighter
 * http://alexgorbatchev.com/SyntaxHighlighter
 *
 * SyntaxHighlighter is donationware. If you are using it, please donate.
 * http://alexgorbatchev.com/SyntaxHighlighter/donate.html
 *
 * @version
 * 3.0.83 (July 02 2010)
 * 
 * @copyright
 * Copyright (C) 2004-2010 Alex Gorbatchev.
 *
 * @license
 * Dual licensed under the MIT and GPL licenses.
 */;(function()
{typeof(require)!='undefined'?SyntaxHighlighter=require('shCore').SyntaxHighlighter:null;function Brush()
{var keywords='break case catch continue '+
'default delete do else false  '+
'for function if in instanceof '+
'new null return super switch '+
'this throw true try typeof var while with';var r=SyntaxHighlighter.regexLib;this.regexList=[{regex:r.multiLineDoubleQuotedString,css:'string'},{regex:r.multiLineSingleQuotedString,css:'string'},{regex:r.singleLineCComments,css:'comments'},{regex:r.multiLineCComments,css:'comments'},{regex:/\s*#.*/gm,css:'preprocessor'},{regex:new RegExp(this.getKeywords(keywords),'gm'),css:'keyword'}];this.forHtmlScript(r.scriptScriptTags);};Brush.prototype=new SyntaxHighlighter.Highlighter();Brush.aliases=['js','jscript','javascript'];SyntaxHighlighter.brushes.JScript=Brush;typeof(exports)!='undefined'?exports.Brush=Brush:null;})();/**
 * SyntaxHighlighter
 * http://alexgorbatchev.com/SyntaxHighlighter
 *
 * SyntaxHighlighter is donationware. If you are using it, please donate.
 * http://alexgorbatchev.com/SyntaxHighlighter/donate.html
 *
 * @version
 * 3.0.83 (July 02 2010)
 * 
 * @copyright
 * Copyright (C) 2004-2010 Alex Gorbatchev.
 *
 * @license
 * Dual licensed under the MIT and GPL licenses.
 */;(function()
{typeof(require)!='undefined'?SyntaxHighlighter=require('shCore').SyntaxHighlighter:null;function Brush()
{this.regexList=[{regex:/^\+\+\+ .*$/gm,css:'color2'},{regex:/^\-\-\- .*$/gm,css:'color2'},{regex:/^\s.*$/gm,css:'color1'},{regex:/^@@.*@@.*$/gm,css:'variable'},{regex:/^\+.*$/gm,css:'string'},{regex:/^\-.*$/gm,css:'color3'}];};Brush.prototype=new SyntaxHighlighter.Highlighter();Brush.aliases=['diff','patch'];SyntaxHighlighter.brushes.Diff=Brush;typeof(exports)!='undefined'?exports.Brush=Brush:null;})();;(function()
{typeof(require)!='undefined'?SyntaxHighlighter=require('shCore').SyntaxHighlighter:null;function Brush()
{// Copyright 2006 Shin, YoungJin
var datatypes='ATOM BOOL BOOLEAN BYTE CHAR COLORREF DWORD DWORDLONG DWORD_PTR '+
'DWORD32 DWORD64 FLOAT HACCEL HALF_PTR HANDLE HBITMAP HBRUSH '+
'HCOLORSPACE HCONV HCONVLIST HCURSOR HDC HDDEDATA HDESK HDROP HDWP '+
'HENHMETAFILE HFILE HFONT HGDIOBJ HGLOBAL HHOOK HICON HINSTANCE HKEY '+
'HKL HLOCAL HMENU HMETAFILE HMODULE HMONITOR HPALETTE HPEN HRESULT '+
'HRGN HRSRC HSZ HWINSTA HWND INT INT_PTR INT32 INT64 LANGID LCID LCTYPE '+
'LGRPID LONG LONGLONG LONG_PTR LONG32 LONG64 LPARAM LPBOOL LPBYTE LPCOLORREF '+
'LPCSTR LPCTSTR LPCVOID LPCWSTR LPDWORD LPHANDLE LPINT LPLONG LPSTR LPTSTR '+
'LPVOID LPWORD LPWSTR LRESULT PBOOL PBOOLEAN PBYTE PCHAR PCSTR PCTSTR PCWSTR '+
'PDWORDLONG PDWORD_PTR PDWORD32 PDWORD64 PFLOAT PHALF_PTR PHANDLE PHKEY PINT '+
'PINT_PTR PINT32 PINT64 PLCID PLONG PLONGLONG PLONG_PTR PLONG32 PLONG64 POINTER_32 '+
'POINTER_64 PSHORT PSIZE_T PSSIZE_T PSTR PTBYTE PTCHAR PTSTR PUCHAR PUHALF_PTR '+
'PUINT PUINT_PTR PUINT32 PUINT64 PULONG PULONGLONG PULONG_PTR PULONG32 PULONG64 '+
'PUSHORT PVOID PWCHAR PWORD PWSTR SC_HANDLE SC_LOCK SERVICE_STATUS_HANDLE SHORT '+
'SIZE_T SSIZE_T TBYTE TCHAR UCHAR UHALF_PTR UINT UINT_PTR UINT32 UINT64 ULONG '+
'ULONGLONG ULONG_PTR ULONG32 ULONG64 USHORT USN VOID WCHAR WORD WPARAM WPARAM WPARAM '+
'char bool short int __int32 __int64 __int8 __int16 long float double __wchar_t '+
'clock_t _complex _dev_t _diskfree_t div_t ldiv_t _exception _EXCEPTION_POINTERS '+
'FILE _finddata_t _finddatai64_t _wfinddata_t _wfinddatai64_t __finddata64_t '+
'__wfinddata64_t _FPIEEE_RECORD fpos_t _HEAPINFO _HFILE lconv intptr_t '+
'jmp_buf mbstate_t _off_t _onexit_t _PNH ptrdiff_t _purecall_handler '+
'sig_atomic_t size_t _stat __stat64 _stati64 terminate_function '+
'time_t __time64_t _timeb __timeb64 tm uintptr_t _utimbuf '+
'va_list wchar_t wctrans_t wctype_t wint_t signed';var keywords='break case catch class const __finally __exception __try '+
'const_cast continue private public protected __declspec '+
'default delete deprecated dllexport dllimport do dynamic_cast '+
'else enum explicit extern if for friend goto inline '+
'mutable naked namespace new noinline noreturn nothrow '+
'register reinterpret_cast return selectany '+
'sizeof static static_cast struct switch template this '+
'thread throw true false try typedef typeid typename union '+
'using uuid virtual void volatile whcar_t while';var functions='assert isalnum isalpha iscntrl isdigit isgraph islower isprint'+
'ispunct isspace isupper isxdigit tolower toupper errno localeconv '+
'setlocale acos asin atan atan2 ceil cos cosh exp fabs floor fmod '+
'frexp ldexp log log10 modf pow sin sinh sqrt tan tanh jmp_buf '+
'longjmp setjmp raise signal sig_atomic_t va_arg va_end va_start '+
'clearerr fclose feof ferror fflush fgetc fgetpos fgets fopen '+
'fprintf fputc fputs fread freopen fscanf fseek fsetpos ftell '+
'fwrite getc getchar gets perror printf putc putchar puts remove '+
'rename rewind scanf setbuf setvbuf sprintf sscanf tmpfile tmpnam '+
'ungetc vfprintf vprintf vsprintf abort abs atexit atof atoi atol '+
'bsearch calloc div exit free getenv labs ldiv malloc mblen mbstowcs '+
'mbtowc qsort rand realloc srand strtod strtol strtoul system '+
'wcstombs wctomb memchr memcmp memcpy memmove memset strcat strchr '+
'strcmp strcoll strcpy strcspn strerror strlen strncat strncmp '+
'strncpy strpbrk strrchr strspn strstr strtok strxfrm asctime '+
'clock ctime difftime gmtime localtime mktime strftime time';this.regexList=[{regex:SyntaxHighlighter.regexLib.singleLineCComments,css:'comments'},{regex:SyntaxHighlighter.regexLib.multiLineCComments,css:'comments'},{regex:SyntaxHighlighter.regexLib.doubleQuotedString,css:'string'},{regex:SyntaxHighlighter.regexLib.singleQuotedString,css:'string'},{regex:/^ *#.*/gm,css:'preprocessor'},{regex:new RegExp(this.getKeywords(datatypes),'gm'),css:'color1 bold'},{regex:new RegExp(this.getKeywords(functions),'gm'),css:'functions bold'},{regex:new RegExp(this.getKeywords(keywords),'gm'),css:'keyword bold'}];};Brush.prototype=new SyntaxHighlighter.Highlighter();Brush.aliases=['cpp','c'];SyntaxHighlighter.brushes.Cpp=Brush;typeof(exports)!='undefined'?exports.Brush=Brush:null;})();/**
 * SyntaxHighlighter
 * http://alexgorbatchev.com/SyntaxHighlighter
 *
 * SyntaxHighlighter is donationware. If you are using it, please donate.
 * http://alexgorbatchev.com/SyntaxHighlighter/donate.html
 *
 * @version
 * 3.0.83 (July 02 2010)
 * 
 * @copyright
 * Copyright (C) 2004-2010 Alex Gorbatchev.
 *
 * @license
 * Dual licensed under the MIT and GPL licenses.
 *
 * Brush for CPAN::Changes by Randy Stauner (RWSTAUNER) 2011.
 */;(function()
{typeof(require)!='undefined'?SyntaxHighlighter=require('shCore').SyntaxHighlighter:null;function Brush()
{this.regexList=[{regex:/^\{\{\$NEXT\}\}$/gm,css:'color3'},{regex:/^v?([0-9._]+)\s+(.+)/gm,css:'constants'},{regex:/^\s+\[.+?\]/gm,css:'value'},{regex:/^\s+[-*]/gm,css:'functions'},{regex:/^[^v0-9].+\n(?=\nv?[0-9_.])/g,css:'preprocessor'}];};Brush.prototype=new SyntaxHighlighter.Highlighter();Brush.aliases=['cpanchanges'];SyntaxHighlighter.brushes.CPANChanges=Brush;typeof(exports)!='undefined'?exports.Brush=Brush:null;})();$.fn.textWidth=function(){var html_org=$(this).html();var html_calc='<span>'+html_org+'</span>'
$(this).html(html_calc);var width=$(this).find('span:first').width();$(this).html(html_org);return width;};$.extend({getUrlVars:function(){var vars={},hash;var indexOfQ=window.location.href.indexOf('?');if(indexOfQ==-1)return vars;var hashes=window.location.href.slice(indexOfQ+1).split('&');$.each(hashes,function(idx,hash){var kv=hash.split('=');vars[kv[0]]=kv[1];});return vars;},getUrlVar:function(name){return $.getUrlVars()[name];}});var podVisible=true;function togglePod(lines){var toggle=podVisible?'none':'block';podVisible=!podVisible;if(!lines||!lines.length)return;for(var i=0;i<lines.length;i++){var start=lines[i][0],length=lines[i][1];var sourceC=$('.container')[0].children;var linesC=$('.gutter')[0].children;var x;for(x=start;x<start+length;x++){sourceC[x].style.display=toggle;linesC[x].style.display=toggle;}}}
function toggleTOC(){var index=$('#index');if(!index)return false;var visible=index.is(':visible');visible?index.hide():index.show();visible?$.cookie("hideTOC",1,{expires:999,path:'/'}):$.cookie("hideTOC",0,{expires:999,path:'/'});return false;}
$(document).ready(function(){SyntaxHighlighter.defaults['quick-code']=false;if(document.location.hash){var lineMatch=document.location.hash.match(/^#L(\d+)$/);if(lineMatch){SyntaxHighlighter.defaults['highlight']=[lineMatch[1]];}
else{var packageMatch=document.location.hash.match(/^#P(\S+)$/);if(packageMatch){var decodedPackageMatch=decodeURIComponent(packageMatch[1]);var re=new RegExp("package "+decodedPackageMatch+";");var source=$("#source").html();var leadingSource=source.split(re);var lineCount=leadingSource[0].split("\n").length;if(leadingSource.length>1&&lineCount>1){SyntaxHighlighter.defaults['highlight']=[lineCount];document.location.hash="#L"+lineCount;}
else{document.location.hash='';}}}}
SyntaxHighlighter.highlight();$('#signin-button').mouseenter(function(){$('#signin').show()});$('#signin').mouseleave(function(){$('#signin').hide()});if(typeof defaultSort=="undefined")defaultSort=[[0,0]];$('.tablesorter').tablesorter({sortList:defaultSort,widgets:['zebra'],textExtraction:function(node){try{var sortBy=node.firstChild.getAttribute('sort');}catch(err){}
if(sortBy&&node.getAttribute('class')=='date'){var date=new Date(node.firstChild.getAttribute('sort'));return date.getTime();}else if(sortBy){return node.firstChild.getAttribute('sort');}
else{return node.innerHTML;}}});$('.tablesorter.remote th.header').each(function(){$(this).unbind('click');$(this).click(function(event){var $cell=$(this);var params=$.getUrlVars();params.sort='[['+this.column+','+this.count++%2+']]';var query=$.param(params);var url=window.location.href.replace(window.location.search,'');window.location.href=url+'?'+query;});});$('.relatize').relatizeDate();$('#search-input').keyup(function(event){if(event.keyCode=='38'||event.keyCode=='40'){var query=$('.ac_over').text();if(query){$('#search-input').val(query);}}});$('#search-input').keydown(function(event){if(event.keyCode=='13'&&event.shiftKey){event.preventDefault();var luckyField=document.createElement("input");luckyField.type='hidden';luckyField.name='lucky';luckyField.value='1';document.forms[0].appendChild(luckyField);document.forms[0].submit();}});$("#search-input").autocomplete('/search/autocomplete',{dataType:'json',delay:100,max:20,selectFirst:false,width:$("#search-input").width()+5,parse:function(data){var result=$.map(data,function(row){return{data:row,value:row.documentation,result:row.documentation}});var uniq={};result=$.grep(result,function(row){uniq[row.result]=typeof(uniq[row.result])=='undefined'?0:uniq[row.result];return uniq[row.result]++<1;});return result;},formatItem:function(item){return item.documentation;}}).result(function(e,item){document.location.href='/module/'+item.documentation;});$('#search-input.autofocus').focus();var el=$('.search-bar');if(!el.length)return;var originalTop=el.offset().top;var height=el.height();$(window).scroll(function(e){var screenHeight=$(window).height();if($(this).scrollTop()>originalTop+(screenHeight-height<0?height-screenHeight+10:-10)){el.css({'position':'fixed','top':(screenHeight-height<0?screenHeight-height-10:10)+'px'});}else{el.css({'position':'absolute','top':originalTop});}});var items=$('.ellipsis');for(var i=0;i<items.length;i++){var element=$(items[i]);var boxWidth=element.width();var textWidth=element.textWidth();var text=element.text();var textLength=text.length;if(textWidth<=boxWidth)continue;var parts=[text.substr(0,Math.floor(textLength/2)),text.substr(Math.floor(textLength/2),textLength)];while(element.textWidth()>boxWidth){if(textLength%2){parts[0]=parts[0].substr(0,parts[0].length-1);}else{parts[1]=parts[1].substr(1,parts[1].length);}
textLength--;element.html(parts.join('…'));}}
$('.pod h1,h2,h3,h4,h5,h6').each(function(){$(this).wrapInner(function(){return'<a href="#___pod"></a>';});});});function searchForNearest(){document.getElementById('busy').style.visibility='visible';navigator.geolocation.getCurrentPosition(function(pos){document.location.href='/mirrors?q=loc:'+pos.coords.latitude+','+pos.coords.longitude;},function(){},{maximumAge:600000});}
function disableTag(tag){document.location.href='/mirrors'+(document.location.search||'?q=')+' '+tag;}
function logInPAUSE(a){if(!a.href.match(/pause/))
return true;var id=prompt('Please enter your PAUSE ID:');if(id)document.location.href=a.href+'&id='+id;return false;}
function favDistribution(form){form=$(form);var data=form.serialize();$.ajax({type:'POST',url:form.attr('action'),data:data,success:function(){var button=form.find('button');button.toggleClass('active');var counter=button.find('span');var count=counter.text();if(button.hasClass('active')){counter.text(count?parseInt(count)+1:1);form.append('<input type="hidden" name="remove" value="1">');if(!count)
button.toggleClass('highlight');}else{counter.text(parseInt(count)-1);form.find('input[name="remove"]').remove();if(counter.text()==0){counter.text("");button.toggleClass('highlight');}}},error:function(){if(confirm("You have to complete a Captcha in order to ++.")){document.location.href="/account/turing";}}});return false;}
function Github(){return{config:{issues:{pattern:new RegExp(/github\.com\/([^\/]+)\/([^\/]+)\/issues\/?$/),prepareData:function(self,data,cb){var url=self.url.replace('/issues','');$.getJSON(url,function(repo){cb({issues:data,repo:repo.data});});},render:function(self,data){if(data.issues.length==0){return'There are currently no open issues.';}
var result='<table>'
+'  <tr><th>Open <a href="'+data.html_url+'/issues">Issues</a>:</th><td>'+data.repo.open_issues+'</td></tr>'
+'  <tr><th>Last 15 Issues:</th><td><table>';$.each(data.issues,function(idx,row){result+='<tr><td><span class="relatize">'+row.created_at+'</span></td><td><a href="'+row.html_url+'">'+row.title+'</a></td></tr>'});return result+'</table></td></tr></table>';},url:function(self,result){return self.githubApiUrl+'/repos/'+result[1]+'/'+result[2]+'/issues?per_page=15&callback=?';}},repo:{pattern:new RegExp(/github\.com(?:\/|:)([^\/]+)\/([^\/\.]+)(?:\/|\.git)*$/),render:function(self,data){return'<table>'
+(data.description?'  <tr><th>Description:</th><td>'+data.description+'</td></tr>':'')
+(data.homepage?'  <tr><th>Homepage:</th><td><a href="'+data.homepage+'">'+data.homepage+'</a></td></tr>':'')
+'  <tr><th><a href="'+data.html_url+'/watchers">Watchers</a>:</th><td>'+data.watchers+'</td></tr>'
+'  <tr><th><a href="'+data.html_url+'/network">Forks</a>:</th><td>'+data.forks+'</td></tr>'
+(data.has_issues?'  <tr><th>Open <a href="'+data.html_url+'/issues">Issues</a>:</th><td>'+data.open_issues+'</td></tr>':'')
+'  <tr><th>Clone URL:</th><td><a href="'+data.clone_url+'">'+data.clone_url+'</a></td></tr>'
+'  <tr><th>Git URL:</th><td><a href="'+data.git_url+'">'+data.git_url+'</a></td></tr>'
+'  <tr><th>Github URL:</th><td><a href="'+data.html_url+'">'+data.html_url+'</a></td></tr>'
+'  <tr><th>SSH URL:</th><td><a href="ssh://'+data.ssh_url+'">'+data.ssh_url+'</a></td></tr>'
+'  <tr><th>Last Commit:</th><td><span class="relatize">'+data.pushed_at+'</span></td></tr>'
+'</table>';},url:function(self,result){return self.githubApiUrl+'/repos/'+result[1]+'/'+result[2]+'?callback=?';}},user:{pattern:new RegExp(/github\.com\/([^\/]+)\/?$/),render:function(self,data){return'<table>'
+(data.name?'  <tr><th>Name:</th><td>'+data.name+'</td></tr>':'')
+(data.email?'  <tr><th>Email:</th><td><a href="mailto:'+data.email+'">'+data.email+'</a></td></tr>':'')
+(data.blog?'  <tr><th>Website/Blog:</th><td><a href="'+data.blog+'">'+data.blog+'</a></td></tr>':'')
+(data.company?'  <tr><th>Company:</th><td>'+data.company+'</td></tr>':'')
+(data.location?'  <tr><th>Location:</th><td>'+data.location+'</td></tr>':'')
+'  <tr><th>Member Since:</th><td><span class="relatize">'+data.created_at+'</span></td></tr>'
+'  <tr><th><a href="'+data.html_url+'/followers">Followers</a>:</th><td>'+data.followers+'</td></tr>'
+'  <tr><th><a href="'+data.html_url+'/following">Following</a>:</th><td>'+data.following+'</td></tr>'
+'  <tr><th><a href="'+data.html_url+'/repositories">Public Repos</a>:</th><td>'+data.public_repos+'</td></tr>'
+'</table>';},url:function(self,result){return self.githubApiUrl+'/users/'+result[1]+'?callback=?';}}},githubApiUrl:'https://api.github.com',githubUrl:'https://github.com',item:null,type:null,url:null,createPopup:function(item){this.item=$(item);if(!this.parseUrl()){return;}
var self=this;this.item.qtip({content:{ajax:{dataType:'json',type:'GET',url:this.url,success:function(res,status){var qtip=this;var data=self.prepareData(res.data,function(data){var html=self.render(data);qtip.set('content.text',html);$('.qtip-github .relatize').each(function(){if(!$(this).hasClass('relatized')){$(this).relatizeDate();$(this).addClass('relatized');}});});}},text:'<img src="/static/icons/busy.gif" />',title:'Github Info'},hide:{event:'mouseleave',fixed:true},position:{at:'right center',my:'left center'},style:{classes:'ui-tooltip-rounded ui-tooltip-shadow ui-tooltip-light'}});},hasGithubUrl:function(){return this.item.attr('href').match('github');},parseUrl:function(){if(!this.hasGithubUrl()){return false;}
var self=this;$.each(this.config,function(type,config){var result=config.pattern.exec(self.item.attr('href'));if(result){self.url=config.url(self,result);self.type=type;return false;}});if(this.type===null){return false;}
return true;},prepareData:function(data,cb){if(typeof this.config[this.type].prepareData==='function'){this.config[this.type].prepareData(this,data,cb);}
else{cb(data);}},render:function(data){return'<div class="qtip-github">'+this.config[this.type].render(this,data)+'</div>';}}};$(document).ready(function(){$('.search-bar a:not(.nopopup)').each(function(){var github=new Github();github.createPopup(this);});});