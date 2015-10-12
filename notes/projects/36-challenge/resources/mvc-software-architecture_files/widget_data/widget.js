var Skribit = {
  allowAnonymous: false,

  loggedIn: function() {
    return $('logged_hidden').value == 'in';
  },
  onSuggest: function() {
    if (!this.allowAnonymous && !this.loggedIn()) {
        $MQ('l:screen.login');
    } else {
        $MQ('l:screen.suggest');
    }
  },
  
  loadStyle: function() {
    var cssNode = document.createElement('link');
    cssNode.type = 'text/css';
    cssNode.rel = 'stylesheet';
    cssNode.media = 'screen';
    var dt = new Date();
    var timestamp = styleCache ? dt.getFullYear() + dt.getMonth().toPaddedString(2) + dt.getDate().toPaddedString(2) : dt.getTime();
    cssNode.href = '/blogs/' + blogid + '/styles.css?' + timestamp;
    document.getElementsByTagName('head')[0].appendChild(cssNode);
    return "";
  }
}
Skribit.InputBox = Class.create();
Skribit.InputBox.prototype = {
  initialize: function(e, label) {
      this.element = $(e);
      this.label = label;
      
      this.createOverlay();
      
      Event.observe(e, 'focus', this.onFocus.bind(this));
      Event.observe(e, 'blur' , this.onBlur.bind(this));
  },
  createOverlay: function() {
    var container = Element.wrap(this.element, 'div');
    var overlay = document.createElement('div');
    Event.observe(overlay, 'click', this.focus.bind(this));
    overlay.addClassName('input-overlay');
    overlay.update(this.label);
    overlay.setStyle({
      fontSize: this.element.getStyle('fontSize'),
      fontFamily: this.element.getStyle('fontFamily')
    });
    container.insertBefore(overlay, container.firstChild);
    this.overlay = overlay;
  },
  focus: function() {
      this.element.focus();
  },
  onFocus: function() {
    if (this.overlay.visible()) this.overlay.hide();
  },
  onBlur: function() {
    if (this.element.value == "") this.overlay.show();
  },
  reset: function() {
    this.element.value = "";
    this.overlay.show();
  }
};
Skribit.SuggestionBox = Class.create();
Skribit.SuggestionBox.prototype = {
  initialize: function(e, charLimit) {
      this.element = $(e);
      this.statusElement = $(this.element.id + '-status');
      this.charLimit = charLimit;
      
      this.inputBox = new Skribit.InputBox(this.element,
          'Your suggestion in ' + this.charLimit + ' characters or less');
      
      Event.observe(e, 'keyup', this.onKeyup.bind(this));
      this.reset();
  },
  reset: function() {
    this.statusElement.update("" + this.charLimit);
    this.statusElement.setStyle({visibility: 'hidden'});
    this.inputBox.reset();
    $('post_button').disable();
  },
  onKeyup: function() {
    if (this.statusElement.getStyle('visibility') == 'hidden')
      this.statusElement.setStyle({visibility: 'visible'});
    var remaining = this.charLimit - Number(this.element.value.length);
    if (remaining < 0) {
      this.statusElement.addClassName('char-overflow');
    } else {
      this.statusElement.removeClassName('char-overflow');
    }
    this.statusElement.update(remaining);
  }
};
    
var blogid = window.location.href.toQueryParams()['blogid'];
if (!blogid) {
  // not sure what to do here if you don't pass in a blogid
  document.location.href = 'http://www.skribit.com';
}
//Blog id is set by the article refresh script in widget.html..

var styleCache = window.location.href.toQueryParams()['styleCache'];

Appcelerator.Core.onload(function() {
  var focusHandler = function() {
    $(this).addClassName('focus');
  }
  var blurHandler = function() {
    $(this).removeClassName('focus');
  }
  $$('input[type="text"], input[type="password"], textarea').each(function(e){
    Event.observe(e, 'focus', focusHandler);
    Event.observe(e, 'blur', blurHandler);
  });

  Skribit.suggestionBox = new Skribit.SuggestionBox('topic', 100);
  new Skribit.InputBox('login_username', 'Username');
  new Skribit.InputBox('login_password', 'Password');
  new Skribit.InputBox('register_fullname', 'Full Name');
  new Skribit.InputBox('register_username', 'Username');
  new Skribit.InputBox('register_email', 'Email');
  new Skribit.InputBox('register_password', 'Password');
});

