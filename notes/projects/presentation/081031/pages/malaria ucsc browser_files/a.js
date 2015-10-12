//MooTools, My Object Oriented Javascript Tools. Copyright (c) 2006-2007 Valerio Proietti, <http://mad4milk.net>, MIT Style License.

eval(function(p,a,c,k,e,d){e=function(c){return(c<a?'':e(parseInt(c/a)))+((c=c%a)>35?String.fromCharCode(c+29):c.toString(36))};if(!''.replace(/^/,String)){while(c--){d[e(c)]=k[c]||e(c)}k=[function(e){return d[e]}];e=function(){return'\\w+'};c=1};while(c--){if(k[c]){p=p.replace(new RegExp('\\b'+e(c)+'\\b','g'),k[c])}}return p}('5 1w={1s:\'1.11\'};4 $N(6){2(6!=19)};4 $b(6){7(!$N(6))2 Z;7(6.X)2\'14\';5 b=I 6;7(b==\'q\'&&6.1p){P(6.1d){n 1:2\'14\';n 3:2(/\\S/).1j(6.1c)?\'1k\':\'1v\'}}7(b==\'q\'||b==\'4\'){P(6.1b){n L:2\'1x\';n 1q:2\'1o\';n j:2\'1n\'}7(I 6.D==\'1l\'){7(6.1m)2\'1r\';7(6.15)2\'a\'}}2 b};4 $F(){5 t={};m(5 i=0;i<a.D;i++){m(5 c z a[i]){5 y=a[i][c];5 w=t[c];7(w&&$b(y)==\'q\'&&$b(w)==\'q\')t[c]=$F(w,y);R t[c]=y}}2 t};5 $f=4(){5 k=a;7(!k[1])k=[9,k[0]];m(5 c z k[1])k[0][c]=k[1][c];2 k[0]};5 $x=4(){m(5 i=0,l=a.D;i<l;i++){a[i].f=4(G){m(5 g z G){7(!9.d[g])9.d[g]=G[g];7(!9[g])9[g]=$x.W(g)}}}};$x.W=4(g){2 4(10){2 9.d[g].J(10,L.d.1t.1u(a,1))}};$x(1y,L,1f,1g);4 $1e(6){2!!(6||6===0)};4 $1i(6,1a){2 $N(6)?6:1a};4 $12(M,17){2 16.1h(16.12()*(17-M+1)+M)};4 $1W(){2 r 1X().1V()};4 $1U(O){1Z(O);1S(O);2 v};5 Q=4(6){6=6||{};6.f=$f;2 6};5 1T=r Q(8);5 1Y=r Q(h);h.Y=h.20(\'Y\')[0];8.V=!!(h.24);7(8.25)8.22=8[8.23?\'21\':\'18\']=B;R 7(h.1R&&!h.1P&&!1F.1z)8.C=8[8.V?\'1G\':\'1Q\']=B;R 7(h.1E!=v)8.1D=B;8.1A=8.C;1B.f=$f;7(I A==\'19\'){5 A=4(){};7(8.C)h.1C("1H");A.d=(8.C)?8["[[1I.d]]"]:{}}A.d.X=4(){};7(8.18)1N{h.1O("1M",Z,B)}1L(e){};5 j=4(s){5 u=4(){2(a[0]!==v&&9.T&&$b(9.T)==\'4\')?9.T.J(9,a):9};$f(u,9);u.d=s;u.1b=j;2 u};j.1J=4(){};j.d={f:4(s){5 E=r 9(v);m(5 c z s){5 13=E[c];E[c]=j.U(13,s[c])}2 r j(E)},1K:4(){m(5 i=0,l=a.D;i<l;i++)$f(9.d,a[i])}};j.U=4(p,o){7(p&&p!=o){5 b=$b(o);7(b!=$b(p))2 o;P(b){n\'4\':5 H=4(){9.K=a.15.K;2 o.J(9,a)};H.K=p;2 H;n\'q\':2 $F(p,o)}}2 o};',62,130,'||return||function|var|obj|if|window|this|arguments|type|property|prototype||extend|prop|document||Class|args||for|case|current|previous|object|new|properties|mix|klass|null|mp|native|ap|in|HTMLElement|true|webkit|length|proto|merge|props|merged|typeof|apply|parent|Array|min|defined|timer|switch|Abstract|else||initialize|Merge|xpath|generic|htmlElement|head|false|bind||random|pp|element|callee|Math|max|ie6|undefined|picked|constructor|nodeValue|nodeType|chk|String|Number|floor|pick|test|textnode|number|item|class|regexp|nodeName|RegExp|collection|version|slice|call|whitespace|MooTools|array|Function|taintEnabled|khtml|Object|createElement|gecko|getBoxObjectFor|navigator|webkit420|iframe|DOMElement|empty|implement|catch|BackgroundImageCache|try|execCommand|all|webkit419|childNodes|clearInterval|Window|clear|getTime|time|Date|Document|clearTimeout|getElementsByTagName|ie7|ie|XMLHttpRequest|evaluate|ActiveXObject'.split('|'),0,{}))
if (!SHARETHIS) {

/*
 *    Sharelet
 *
 *    The thing being shared. There can be zero or more sharelets per page.
 *    Share buttons can optionally be created here requiring the DOM parent
 *    to exist.
 */

var Sharelet = new Class({
    node:   null,    // DOM parent node.
    button: null,
    properties: {
        type:       '',
        title:      document.title,
        summary:    '',
        content:    '',
        url:        document.URL,
        icon:       '',
        category:   '',
        updated:    document.lastModified,
        published:  '',
        author:     ''
    },
    options: {
        button: true,
        buttonText: 'ShareThis'
    },
    initialize: function(options){
        this.options = $merge(this.options, options);
    },
    bind: function(node){
        if (this.node !== null && this.node !== node) {
            try {this.node.removeChild(this.button)} catch(err){
                
            }
        }
        if (this.options.button == true) {
            try{node.appendChild(this.button)} catch(err){
               
            }
        }
        this.node = node;
    }
});

/*
 *    ShareThisWidget
 *
 *    Handles creation of the widget, positioning and visibility.
 */
var ShareThisWidget = new Class({
    visible:    0,
    wrapper:    null,
    iframe:     null,
    close:      null,
    sharelet:   null,
    left:       0,
    top:        0,
    hiddenEmbeds: false,
    loaderHTML: '<html><head><style>body{background:#eee url(http://w.sharethis.com/widget/1.15/load.gif) center center no-repeat;color:#bbb;font:bold 18px Arial,Helvetica,sans-serif;padding:50px 20px;text-align:center;}</style></head><body>Getting ready to share!</body></html>',
    initialize: function(options){
        this.options = options;
        var d = document.createElement('div');
        d.className = 'stwrapper';
        d.style.visibility = 'hidden';
        this.wrapper = d;
        
        try {
            var f = document.createElement('<iframe name="stframe" allowTransparency="true" style="body{background:transparent;}"></iframe>');
        } catch(err) {
            var f = document.createElement('iframe');
            f.allowTransparency="true";
            f.setAttribute("allowTransparency", "true");
        }
        f.id = 'stframe';
        f.className = 'stframe';
        f.name = 'stframe';
        f.frameBorder = '0';
        f.scrolling = 'no';
        f.width = '354px';
        f.height = '437px';
        d.appendChild(f);
        this.iframe = f;

        var a = document.createElement('a');
        a.href = '#';
        a.title = 'close';
        a.className = 'stclose';
        a.onclick = this.hide;
        a.style.color = '#fff';
        var t = document.createTextNode('X');
        a.appendChild(t);
        d.appendChild(a);
        this.close = a;
    },
    show: function(opts){
        SHARETHIS.widget.visible = 1;
        SHARETHIS.widget.wrapper.style.left = this.left+'px';
        SHARETHIS.widget.wrapper.style.top = this.top+'px';
        if (SHARETHIS.widget.wrapper.parentNode == null
            || typeof(SHARETHIS.widget.wrapper.parentNode.tagName) == 'undefined'){
            document.body.appendChild(SHARETHIS.widget.wrapper);
        }
        SHARETHIS.widget.wrapper.style.visibility = 'visible';
        if (opts && Boolean(opts.embeds) != true) {
            SHARETHIS.widget.hiddenEmbeds = true;
            SHARETHIS.widget.hideEmbeds();
        }
        return false;
    },
    hide: function(opts){
        SHARETHIS.widget.visible = 0;
        SHARETHIS.widget.wrapper.style.visibility = 'hidden';
        if (Boolean(SHARETHIS.widget.hiddenEmbeds) == true || (opts && Boolean(opts.embeds) != true)) {
            SHARETHIS.widget.hiddenEmbeds = false;
            SHARETHIS.widget.showEmbeds();
        }
        return false;
    },
    hideEmbeds: function() {
        var embeds = document.getElementsByTagName('embed');
        for (var i=0; i< embeds.length; i++) {
            embeds[i].style.visibility = "hidden";
        }
    },
    showEmbeds: function() {
        var embeds = document.getElementsByTagName('embed');
        for (var i=0; i< embeds.length; i++) {
            embeds[i].style.visibility = "visible";
        }
    },
    loading: function(){
        var w = parent.frames['stframe'];
        try {
        w.window.document.open();
        w.window.document.clear();
        w.window.document.write(this.loaderHTML);
        w.window.document.close();
        } catch(err) {}
    }
});

/*
 *    ShareThis
 *
 *    This global object implements the ShareThis API and binding sharelets and the widget
 *    together.
 */
var ShareThis = new Class({
    version:    '1.19',
    ready:      false,
    readyList:  [],
    toolbar:    false,
    counter:    0,
    widget:     null,
    sharelets:  [],
    page:       {},
    query:      {},
	lastUrl:     'blank',
	logFlag:		true,
    meta: {
        publisher : '',
        hostname  : location.host,
        location  : location.pathname
    },
    initialize: function(options){
        var options = options || {};
        this.options = options;
        if (options.publisher) {
            this.meta.publisher = options.publisher;
        }
        this.page = new Sharelet($merge(options,{button:false}));

        this.widget = new ShareThisWidget();
        if (options.headerbg) {
            var l = this.luminescence(options.headerbg);
            this.widget.close.style.color = l > 0.5 ? '#000' : '#fff';
        }
        var css = 'http://w.sharethis.com/widget/' + this.version + '/sharethis.css';
        this.load('link', {
            href : (this.options.css ? this.options.css : css),
            rel  : 'stylesheet',
            type : 'text/css'
        });
        if (typeof(window.addEventListener) != 'undefined') {
            window.addEventListener("load", this.onReady, false);
        } else if (typeof(document.addEventListener) != 'undefined') {
            document.addEventListener("load", this.onReady, false);
        } else if (typeof window.attachEvent != 'undefined') {
            window.attachEvent("onload", this.onReady);
        }
    },
    selection: function(){
        if (window.getSelection) {
            this.page.properties.selection = window.getSelection();
        } else if (document.getSelection) {
            this.page.properties.selection = document.getSelection();
        } else if (document.selection && document.selection.createRange) {
            this.page.properties.selection = document.selection.createRange().text;
        }
    },
    luminescence: function(color) {
        var rgb = {};
        if (color.length == 7) {
  	    rgb = [parseInt('0x' + color.substring(1, 3)) / 255,
  	           parseInt('0x' + color.substring(3, 5)) / 255,
  		   parseInt('0x' + color.substring(5, 7)) / 255];
        } else if (color.length == 4) {
  	    rgb =  [parseInt('0x' + color.substring(1, 2)) / 15,
  		    parseInt('0x' + color.substring(2, 3)) / 15,
  		    parseInt('0x' + color.substring(3, 4)) / 15];
        }
        var r = rgb[0], g = rgb[1], b = rgb[2];
        var min = Math.min(r, Math.min(g, b));
        var max = Math.max(r, Math.max(g, b));
        return (min + max) / 2;
    },
    defer: function(f) {
        if (this.ready) {
            f.apply(document, [SHARETHIS]);
        } else {
            this.readyList.push( function() { return f.apply(this, [SHARETHIS]) } );
            //this.readyList.push(f);
        }
    },
    onReady: function() {
        SHARETHIS.ready = true;
        for (var i = 0; i < SHARETHIS.readyList.length; ++i)
            SHARETHIS.readyList[i].apply(document, [SHARETHIS]);

    },
    load: function(t, opts) {
        var e = document.createElement(t);
        for (var i in opts) {
            e.setAttribute(i, opts[i]);
        }
        try {
            document.getElementsByTagName('head')[0].appendChild(e);
        } catch (err) {
            document.body.appendChild(e);
        }
    },
    pageSize: function() {
        var pScroll = [0,0];
        if (typeof(window.pageYOffset) == 'number') {
            //Netscape compliant
            pScroll = [window.pageXOffset, window.pageYOffset];
        } else if (document.body && (document.body.scrollLeft || document.body.scrollTop)) {
            //DOM compliant
            pScroll = [document.body.scrollLeft, document.body.scrollTop];
        } else if (document.documentElement
          && (document.documentElement.scrollLeft || document.documentElement.scrollTop)) {
            //IE6 standards compliant mode
            pScroll = [document.documentElement.scrollLeft,
                       document.documentElement.scrollTop];
        }
        return pScroll;
    },
    addEntry: function(properties, options){
        var options = options || {};
        
        if (typeof(options.button) == "undefined") {
            options.button = true;
        }
        if (typeof(options.bind) == "undefined") {
            options.bind = true;
        }
        var s = new Sharelet($merge(this.options, options));
        s.properties = $merge(s.properties, properties);
        s.idx = this.sharelets.push(s) - 1;
        s.sharethis = this;
        s.widget = this.widget;
		
		if(s.properties.url!==this.lastUrl){
			this.lastUrl=s.properties.url;
		}
		else{
			this.logFlag=false;
		}

        s.popup = function(e){
             if (s.options.onclick) {
                  var res = s.options.onclick.apply(document, [s]);
                  if (res == false) {
                      return false;
                  }
             }
             SHARETHIS.selection();
             var p = window.open("http://w.sharethis.com/widget/loading", "stframe","status=1,toolbar=0,width=354,height=437");
             s.widget.popup = p;
             try {
                 p.document.open();
                 p.document.clear();
                 p.window.document.write(SHARETHIS.widget.loaderHTML);
                 p.document.close();
                 p.focus();
             } catch(err) {}
             var f = SHARETHIS.form([s]);
             document.body.appendChild(f);
             f.submit();
             return false;
        };
        s.attachButton = function(a){
            a.onclick = (Boolean(s.options.popup) == true ? s.popup : s.onClick);
        };
        s.onClick = function(e){
            if (s.options.onclick) {
                 var res = s.options.onclick.apply(document, [s]);
                 if (res == false) {
                     return false;
                 }
            }
            findPos = function(obj) {
                var obj = obj || {};
                if (obj.parentNode && obj.parentNode.className.indexOf('stbutton') != -1) {
                    obj = obj.parentNode;
                }
                var pScroll = SHARETHIS.pageSize();
                var pos = pScroll;
                var widgetWidth = 354;
                if (obj.offsetParent) {
                    odims = {offsetLeft:obj.offsetLeft, scrollWidth:obj.scrollWidth};
                    pos = [obj.offsetLeft+obj.scrollWidth,obj.offsetTop+obj.scrollHeight];
                    while (obj = obj.offsetParent) {
                        pos[0] += obj.offsetLeft;
                        pos[1] += obj.offsetTop;
                    }
                    if (s.options.offsetLeft) {
                        pos[0] += parseInt(s.options.offsetLeft);
                    }
                    if (s.options.offsetTop) {
                        pos[1] += parseInt(s.options.offsetTop);
                    }
                    if (!s.options.offsetLeft && !s.options.offsetTop) {
                        pos[0] -= odims.scrollWidth;
                        if (pos[0] + widgetWidth > document.body.scrollWidth) {
                            pos[0] -= widgetWidth - odims.scrollWidth;
                        }
                    }
                }
                return pos;
            };
            if (!e) var e = window.event;
            var el = e.target || e.srcElement;
            var coords = findPos(el);
            s.widget.left = coords[0];
            s.widget.top = coords[1];
            
            if (s.widget.visible) {
                if (s == s.widget.sharelet) {
                    s.widget.hide(s.options);
                } else {
                    s.widget.loading();
                    s.share();
                }
            } else {
                if (s == s.widget.sharelet) {
                    s.widget.show(s.options);
                } else {
                    s.widget.show(s.options);
                    s.widget.loading();
                    s.share();
                }
            }
            return false;
        };
        s.share = function(){
            return s.sharethis.share(s);
        };
        if (typeof(s.options.button) == "undefined" || Boolean(s.options.button) != false) {
            var a = document.createElement("a");
            a.className = 'stbutton stico_' + (s.options.style ? s.options.style : (SHARETHIS.options.style ? SHARETHIS.options.style : 'default'));
            a.title = "ShareThis via email, AIM, social bookmarking and networking sites, etc.";
            a.href = "#";
            a.onclick = (Boolean(s.options.popup) == true ? s.popup : s.onClick);
            var t = document.createElement("span");
            t.className = 'stbuttontext';
            t.appendChild(document.createTextNode(s.options.buttonText));
            a.appendChild(t);
            s.button = a;
            if (typeof(s.options.bind) == "undefined" || Boolean(s.options.bind) != false) {
                var id = 'sharethis_' + s.idx;
                document.write('<span id="' + id + '"></span>');
                var x = document.getElementById(id);
                if (x) {
                    x.appendChild(a);
                }
            }
        }
        if(this.logFlag){this.defer(function(){SHARETHIS.log('view', s)});}
        return s;
    },
    share: function(sharelet){
        this.selection();
        this.widget.sharelet = sharelet;
        this.widget.show(sharelet.options);
        var f = SHARETHIS.form([sharelet]);
        document.body.appendChild(f);
        f.submit();
    },
    form: function(olist) {
        field = function(k, v, brackets) {
            var f   = document.createElement("input");
            f.type  = "hidden";
            f.name  = (brackets == true ? k + "[]" : k);
            f.value = v;
            return f;
        }
        normalize = function(s){
            if (s == null) {
                return '';
            }
            return encodeURIComponent(s);
        }

        var f    = document.createElement("form");
        //f.className  = "stform";
        f.method = "post";
        f.action = "http://sharethis.com/share/lightbox.php";
        f.target = "stframe";
        for (var j in this.meta) {
            f.appendChild(field("meta_" + j, normalize(this.meta[j])));
        }
        for (var j in this.page.properties) {
            f.appendChild(field("page_" + j, normalize(this.page.properties[j])));
        }
        for (var j in this.query) {
            f.appendChild(field("query_" + j, normalize(this.query[j])));
        }
        for (var i=0; i < olist.length; i++) {
            obj = olist[i];
            for (var j in obj.properties) {
                f.appendChild(field(j, normalize(obj.properties[j]), true));
            }
            for (var j in obj.options) {
                f.appendChild(field("opts_"+j, normalize(obj.options[j]), false));
            }
        }
        return f;
    },
    log: function(event, obj) {
        var url = "http://r.sharethis.com/log?event=" + event
            + "&publisher=" + encodeURIComponent(SHARETHIS.meta.publisher)
            + "&hostname=" + encodeURIComponent(SHARETHIS.meta.hostname)
            + "&location=" + encodeURIComponent(SHARETHIS.meta.location)
            + "&url=" + encodeURIComponent(obj.properties.url)
            + "&ts" + (new Date()).getTime() + "." + SHARETHIS.counter++;

        var logger = new Image(1,1);
        logger.src = url;
        logger.onload = function(){return;};
    }
});

var _query = [];
_query.tabs = 'web,post,email';
_query.charset = 'utf-8';
_query.services = 'reddit,digg,facebook,myspace,delicious,stumbleupon,technorati,google_bmarks,friendfeed,newsvine,mixx,magnolia,current,slashdot';
_query.style = 'default';
_query.publisher = '27006f7e-c9b3-4e21-bedf-3beec4f989f4';
_query.headerbg = '#285991';
_query.inactivebg = '#E7F0F6';
_query.inactivefg = '#285991';
_query.linkfg = '#285991';
_query.offsetLeft = '-354';

var SHARETHIS = new ShareThis(_query);
SHARETHIS.log('pview', SHARETHIS.page);
SHARETHIS.query = _query;
var st = SHARETHIS;

} // end if !SHARETHIS

// Don't run if called from HEAD, or if toolbar has been run
var _slist = document.getElementsByTagName('script');
var _s = _slist[_slist.length - 1];
if (_s && _s.parentNode.tagName != "HEAD" && typeof(_sttoolbar) == "undefined") {
    var obj = SHARETHIS.addEntry(null,$merge(_query,{bind:false}));
    var id = 'sharethis_' + obj.idx;
    document.write('<span id="' + id + '"></span>');
    var x = document.getElementById(id);
    obj.bind(x);
}
