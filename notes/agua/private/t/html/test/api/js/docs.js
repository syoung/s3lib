var Docs = {
	
	shebang: function() {		
		
		// If shebang has an operation nickname in it..
		// e.g. /docs/#!/words/get_search
		var fragments = $.param.fragment().split('/');
		fragments.shift(); // get rid of the bang
		
		switch (fragments.length) {
			case 1:
				// Expand all operations for the resource and scroll to it
				log('shebang resource:' + fragments[0]); 				
				var dom_id = 'resource_' + fragments[0];
				
				Docs.expandEndpointListForResource(fragments[0]);
				$("#"+dom_id).slideto({highlight: false});
				break;
			case 2:
				// Refer to the endpoint DOM element, e.g. #words_get_search
				log('shebang endpoint: ' + fragments.join('_'));
				
				var li_dom_id = fragments.join('_');
				var li_content_dom_id = li_dom_id + "_content";
				
				Docs.expandOperation($('#'+li_content_dom_id));
				$('#'+li_dom_id).slideto({highlight: false});
				break;
		}
		
	},

	toggleEndpointListForResource: function(resource) {
		var elem = $('li#resource_' + resource + ' ul.endpoints');
		if (elem.is(':visible')) {
			Docs.collapseEndpointListForResource(resource);
		} else {
			Docs.expandEndpointListForResource(resource);
		}
	},

	// Expand resource and remove explicit closure cookie
	expandEndpointListForResource: function(resource) {
		$('#resource_' + resource).addClass('active');
		
		var elem = $('li#resource_' + resource + ' ul.endpoints');
		elem.slideDown();
		$.removeSubCookie('explicitlyClosedTogglables', elem.attr('id'));
		log($.cookie('explicitlyClosedTogglables'));
	},

	// Collapse resource and mark as explicitly closed
	collapseEndpointListForResource: function(resource) {
		$('#resource_' + resource).removeClass('active');
		
		var elem = $('li#resource_' + resource + ' ul.endpoints');
		elem.slideUp();
		$.setSubCookie('explicitlyClosedTogglables', elem.attr('id'), true);
		log($.cookie('explicitlyClosedTogglables'));
	},

	expandOperationsForResource: function(resource) {
		// Make sure the resource container is open..
		Docs.expandEndpointListForResource(resource);
		$('li#resource_' + resource + ' li.operation div.content').each(function() {
			Docs.expandOperation($(this));
		});
	},

	collapseOperationsForResource: function(resource) {
		// Make sure the resource container is open..
		Docs.expandEndpointListForResource(resource);
		$('li#resource_' + resource + ' li.operation div.content').each(function() {
			Docs.collapseOperation($(this));
		});
	},

	expandOperation: function(elem) {
		elem.slideDown();
		$.setSubCookie('explicitlyOpenTogglables', elem.attr('id'), true);
	},

	collapseOperation: function(elem) {
		elem.slideUp();
		$.removeSubCookie('explicitlyOpenTogglables', elem.attr('id'));
	},

	toggleOperationContent: function(dom_id) {
		var elem = $('#' + dom_id);
		(elem.is(':visible')) ? Docs.collapseOperation(elem) : Docs.expandOperation(elem);
	}

};