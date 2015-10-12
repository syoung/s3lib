var widgetContainerID = "wContainer";

function getWidget(dump)
{
	if (rm_widgetId == null)
		throw "WidgetID is null.";

	if (rm_serviceLocation == null)
		throw "Service Location not specified.";

	document.write("<div id='" + widgetContainerID + "'></div>");
	var argString = "widgetID=" + rm_widgetId + "&CallBack=writeWidget";

	if (typeof rm_affiliateId != "undefined")
		argString += "&AffiliateId=" + rm_affiliateId;

	callWidgetFunc("getWidget", argString, dump);
}

function callWidgetFunc(functName, argString, dump)
{
	var request = rm_serviceLocation + "?op=" + functName + "&" + argString + (dump != null ? "&dump=1" : "");
	injectScript(request);
}

function injectScript(content)
{
	var head = document.getElementsByTagName("head").item(0);
	var script = document.createElement("script");
	script.setAttribute("type", "text/javascript");
	script.setAttribute("src", content);
	head.appendChild(script);
}

function writeWidget(dataHtml, styleData)
{
	var container = document.getElementById(widgetContainerID);

	if (dataHtml == null)
		throw "Widget error: The widget which came from a server is empty.";

	container.innerHTML = unescape(dataHtml);

	if (styleData != null)
	{
		if (document.createStyleSheet != null)
			document.createStyleSheet().cssText = unescape(styleData);
		else
		{
			var styleElement = document.createElement("style");
			styleElement.type = 'text/css';
			styleElement.appendChild(document.createTextNode(unescape(styleData)));
			document.getElementsByTagName("head")[0].appendChild(styleElement);
		}
	}

	try
	{
		var elements = GetElementsByClassName(container, "RM_PositionTitle");

		for (var n = 0, length = elements.length; n < length; n++)
		{
			var element = elements[n];

			autoEllipseText(element, element.parentNode.parentNode);
		}
	} catch (ex) { }
}

function GetElementsByClassName(parentElement, className)
{
	function _GetChildrenByClassName(elements, element, className)
	{
		for (var node = element.firstChild; node; node = node.nextSibling)
		{
			if (node.nodeType == 1)
			{
				if (node.className == className)
					elements[elements.length] = node;
				else
					_GetChildrenByClassName(elements, node, className);
			}
		}

		return elements;
	}

	return _GetChildrenByClassName(new Array(), parentElement, className);
}

function autoEllipseText(textElement, container)
{
	if (textElement.offsetWidth > container.offsetWidth)
	{
		var i = 1;
		var text = textElement.innerHTML;
		var width = container.clientWidth - 10;
		textElement.innerHTML = '';

		while (textElement.offsetWidth < width && i < text.length)
		{
			textElement.innerHTML = text.substr(0, i) + '...';
			i++;
		}
	}
}
