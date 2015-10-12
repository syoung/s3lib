/* requires /common/scripts/preload.js */
jQuery.preloadImages("/common/includes/header/02/images/tab_l.gif", "/common/includes/header/02/images/tab_l_hilite.gif", "/common/includes/header/02/images/tab_r.gif", "/common/includes/header/02/images/tab_r_hilite.gif");

jQuery(document).ready(function(){
	jQuery("#header-nav li:not(.hilite)").hover(
		function(){jQuery(this).addClass("hilite");},
		function(){jQuery(this).removeClass("hilite");}
	)
});