/**
 * Note that to work in IE  ... you can't do this:
 * $("blah").createAppend("ul", { class: "slide-paginator" });
 * ... but have to include "empty content" at the end instead:
 * $("blah").createAppend("ul", { class: "slide-paginator" }, "");
 * 
 *  ... and furthermore you can't leave the attribute names unquoted, like in the example above, so this doesn't work in IE:
 * 
 * $("blah").createAppend("ul", { class: "slide-paginator" }, "");
 * ... but this does:
 * $("blah").createAppend("ul", { "class": "slide-paginator" }, "");
*/

/**
 * jQuery Plugin FlyDOM v2.0
 *
 * Create DOM elements on the fly and automatically append or prepend them to another DOM object.
 * There are also template functions (tplAppend and tplPrepend) that can take a simple HTML structure
 * and apply a JSON object to it to make creating layouts MUCH easier.
 *
 * This plugin was inspired by "Oslow" [http://mg.to/2006/02/27/easy-dom-creation-for-jquery-and-prototype#comment-176],
 * and since I could not get his code to work, I decided I write my own plugin. My hope is that this
 * version will be easier to understand and maintain with future versions of jQuery.
 *
 * Copyright (c) 2007 Ken Stanley [dohpaz at gmail dot com]
 * Dual licensed under the MIT (MIT-LICENSE.txt)
 * and GPL (GPL-LICENSE.txt) licenses.
 *
 * @version     2.0.5
 *
 * @author      Ken Stanley [dohpaz at gmail dot com]
 * @copyright   (C) 2007. All rights reserved.
 *
 * @license     http://www.opensource.org/licenses/mit-license.php
 * @license     http://www.opensource.org/licenses/gpl-license.php
 *
 * @package     jQuery Plugins
 * @subpackage  FlyDOM
 */

/**
 * Create DOM elements on the fly and automatically append them to the current DOM obejct
 *
 * @uses jQuery
 *
 * @param   string  element - The name of the DOM element to create (i.e., img, table, a, etc)
 * @param   object  attrs   - An optional object of attributes to apply to the element
 * @param   array   content - An optional array of content (or element children) to append to element
 * @return  jQuery  element - The jQuery object representing the new element
 *
 * @since   1.0
 */
jQuery.fn.createAppend = function(element, attrs, content) {
    // Create our jQuery-friendly tag to append
    var element = jQuery('<' + element + '></' + element + '>');

    // Attach any attributes for this element
    jQuery.each(attrs, function(i, value) {
        // Maybe I'm doing this wrong, but in IE6, the style attribute
        // doesn't get set. So, in the spirit of things, here is a decent
        // work-around for just MSIE. :)
        if (jQuery.browser.msie && i == 'style') {
            // Break the styles up into a parameters array
            var params = value.split(';');

            // Loop through each set of properties
            jQuery.each(params, function(i, style) {
                // Split each property into name/value pairs
                var properties = style.split(':');

                // This is just to ease my burden of reading and typing :)
                var styleName   = properties[0];
                var styleValue  = properties[1];

                // Don't try to apply the style if it is empty (this happens if
                // the value of the attribute ends with a semi-colon.
                if (jQuery.trim(styleName) != '') {
                    // Apply each name/value pair, after removing any whitespace
                    jQuery(element).css(jQuery.trim(styleName), jQuery.trim(styleValue));
                }
            });
        } else { jQuery(element).attr(i, value); }
    });

    // Determine what to do with our red-headed stepchild.
    if (typeof content == 'object' && content != null) {
        // Because of the special nature of this loop, I don't see how
        // to do this with jQuery.each().
        for (var i = 0; i < content.length; i = i + 3) {
            jQuery(element).createAppend(content[i], content[i + 1] || {}, content[i + 2] || []).appendTo(element);
        }
    // Add as text
    } else if (content != null) { element = jQuery(element).text(content); }

    // Return the newly appended element to the caller
    return element.appendTo(this);
}

/**
 * Create DOM elements on the fly and automatically prepend them to the current DOM obejct
 *
 * @uses jQuery
 * @uses createAppend()
 *
 * @param   string  element - The name of the DOM element to create (i.e., img, table, a, etc)
 * @param   object  attrs   - An optional object of attributes to apply to the element
 * @param   array   content - An optional array of content (or element children) to append to element
 * @return  jQuery  element - The jQuery object representing the new element
 *
 * @since   1.0
 */
jQuery.fn.createPrepend = function(element, attrs, content) {
    // Create our jQuery-friendly tag to append
    var element = jQuery('<' + element + '></' + element + '>');

    // Attach any attributes for this element
    jQuery.each(attrs, function(i, value) {
        // Maybe I'm doing this wrong, but in IE6, the style attribute
        // doesn't get set. So, in the spirit of things, here is a decent
        // work-around for just MSIE. :)
        if (jQuery.browser.msie && i == 'style') {
            // Break the styles up into a parameters array
            var params = value.split(';');

            // Loop through each set of properties
            jQuery.each(params, function(i, style) {
                // Split each property into name/value pairs
                var properties = style.split(':');

                // This is just to ease my burden of reading and typing :)
                var styleName   = properties[0];
                var styleValue  = properties[1];

                // Don't try to apply the style if it is empty (this happens if
                // the value of the attribute ends with a semi-colon.
                if (jQuery.trim(styleName) != '') {
                    // Apply each name/value pair, after removing any whitespace
                    jQuery(element).css(jQuery.trim(styleName), jQuery.trim(styleValue));
                }
            });
        } else { jQuery(element).attr(i, value); }
    });

    // Determine what to do with our red-headed stepchild.
    if (typeof content == 'object' && content != null) {
        // Because of the special nature of this loop, I don't see how
        // to do this with jQuery.each().
        for (var i = 0; i < content.length; i = i + 3) {
            jQuery(element).createAppend(content[i], content[i + 1] || {}, content[i + 2] || []).appendTo(element);
        }
    // Add as text
    } else if (content != null) { element = jQuery(element).text(content); }

    // Return the newly appended element to the caller
    return element.prependTo(this);
}

/**
 * Create DOM elements on the fly using a simple template system, and then append the new element(s) to
 * the end of the calling object.
 *
 * @uses jQuery
 * @uses createAppend()
 *
 * @param   object  json    - A JSON-formatted object that holds the dynamic data
 * @param   array   tpl     - An array containing the element(s) to append to the caller
 * @return  jQuery  self    - The jQuery object representing the new element(s)
 *
 * @since   2.0
 */
jQuery.fn.tplAppend = function(json, tpl) {
    // This will allow 'this' to go inside of a .each() loop
    var self = this;

    // Make sure that we have an array to work with
    if (json.constructor != Array) { json = [ json ]; }

    // Loop through our JSON "rows"
    jQuery.each(json, function(i, row) {
        // Apply the data to the template and get our results
        var results = tpl.apply(row);

        // Just like with createAppend/createPrepend; this is the best way to
        // loop through and create our new element(s).
        for (var i = 0; i < results.length; i = i + 3) {
            jQuery(self).createAppend(results[i], results[i + 1], results[i + 2]);
        }
    });

    // Return ourself for chaining
    return self;
}

/**
 * Create DOM elements on the fly using a simple template system, and then prepend the new element(s) to
 * the beginning of the calling object.
 *
 * @uses jQuery
 * @uses createPrepend()
 *
 * @param   object  json    - A JSON-formatted object that holds the dynamic data
 * @param   array   tpl     - An array containing the element(s) to prepend to the caller
 * @return  jQuery  self    - The jQuery object representing the new element(s)
 *
 * @since   2.0
 */
jQuery.fn.tplPrepend = function(json, tpl) {
    // This will allow 'this' to go inside of a .each() loop
    var self = this;

    // Make sure that we have an array to work with
    if (json.constructor != Array) { json = [ json ]; }

    // Loop through our JSON "rows"
    jQuery.each(json, function(i, row) {
        // Apply the data to the template and get our results
        var results = tpl.apply(row);

        // Just like with createAppend/createPrepend; this is the best way to
        // loop through and create our new element(s).
        for (var i = 0; i < results.length; i = i + 3) {
            jQuery(self).createPrepend(results[i], results[i + 1], results[i + 2]);
        }
    });

    // Return ourself for chaining
    return self;
}