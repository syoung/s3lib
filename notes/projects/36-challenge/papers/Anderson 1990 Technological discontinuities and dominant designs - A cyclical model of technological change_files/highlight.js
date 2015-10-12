var wds;	// words
var lss;	// line starts
var lts;	// line tops
var lhs;	// line heights
var wis;	// word indexes
var wls;	// word lefts
var wws;	// word widths


/**
 *	@param	aText	text to be handled.
 *	@return	word ID.  -1 if not available.
 */
function text2id(aText) {
	var ts = wds.split(" ");
	var optHyphen = aText.replace(/-+/g, "-*");
	var regex = new RegExp("\\b" + optHyphen + "\\b", "i");
	var wids = [];
	for (var i=0, w=0; i<ts.length; i++) {
		if (regex.test(ts[i])) {
			wids[w] = i;
			w++;
		}
	}
	return wids;
}


/**
 *	@param	wids	array of word IDs obtained from text2id()
 *	@return	(Array) occurrence indexes.
 */
function findAllOccurIndexes(wids) {
	var allOccurs = [];
	for (var i=0; i<wids.length; i++) {
		var oneResult = findOccurIndexes(wids[i]);
		for (var r=0; r<oneResult.length; r++) {
			allOccurs.push(oneResult[r]);
		}
	}
	return allOccurs;
}


/**
 *	@param	aWid	word ID obtained from text2id()
 *	@return	(Array) occurrence indexes.
 */
function findOccurIndexes(aWid) {
	var result = [];
	if (aWid == -1) {
		return result;
	}
	for (var i=0; i<wis.length; i++) {
		if (wis[i] == aWid) {
			result.push(i);
		}
	}
	return result;
}


/**
 *	@param	aOccur	occurrence index.
 *	@return	line number.
 *	@todo	binary search.
 */
function getLine(aOccur) {
	for (var i=0; i<lss.length; i++) {
		if (lss[i] > aOccur) {
			return i-1;
		}
	}
	return lss.length-1;
}


/**
 *	render highlight span elements.
 *	@param	aTerms	(Array) terms to be handled.
 *			condition: lower cas, purified.
 */
function render(aTerms) {
	for (var i=0; i<aTerms.length; i++) {
		var t = aTerms[i];

		// proximity regex.  
		// NOTE: sync with HighlightPattern.PHRASE
		//
		var regex = new RegExp("\"([-a-zA-Z0-9' ]+)\"(~([0-9]*))?");
		var match = regex.exec(t);

		if (match == null) {
			renderTerm(t);

			var hyphens = /-+/;
			if ( hyphens.test(t) ) {
				var phrase = t.replace(/-+/g, " ");
				renderPhrase(phrase, 1);
			}

			continue;
		}
		
		var terms = t;
		var proximity = 1;

		if (match[1]) {
			terms = match[1];
		}
		if (match[3]) {
			proximity = parseInt(match[3]);
		}
		renderPhrase(terms, proximity);
	}
}


/**
 *	render highlight span element for one single term.
 *	@param	aTerm	term to be handled.
 */
function renderTerm(aTerm) {
	var wids = text2id(aTerm);
	for (var w = 0; w < wids.length; w++) {
		var occurs = findOccurIndexes(wids[w]);

		var div = document.getElementById("pageImageContainer");
			for (var i=0; i<occurs.length; i++) {
			var idx = occurs[i];
			var span = newSpan(idx);
			maybeAppend(div, span);
			// div.appendChild(span);
		}
	}
}


/**
 *	render highlight span element for phrase.
 *	@param	aPhrase	phrase to be handled.
 *	@param	aProximity proximity value.
 */
function renderPhrase(aPhrase, aProximity) {
	var wids = [];
	var ts = tokenize(aPhrase, " ");

	for (var i=0; i<ts.length; i++) {
		var wid = text2id(ts[i]);
		if (wid.length == 0) {
			return;		// at least a term doesn't exist
		}

		wids.push(text2id(ts[i]));
	}

	var occurs = [];
	for (var i=0; i<wids.length; i++) {
		var os = findAllOccurIndexes(wids[i]);
		occurs.push(os);
	}

	var indexes = filterPhrase(occurs, aProximity);

	var sps = [];
	var div = document.getElementById("pageImageContainer");
	for (var i=0; i<indexes.length; i++) {
		var idx = indexes[i];
		if (indexOf(sps, idx) != -1) {
			continue;
		}
		var span = newSpan(idx);
		maybeAppend(div, span);
		// div.appendChild(newSpan(idx));
		sps.push(idx);
	}
}


/**
 *	tokenize a string with delimiter.
 *	@param	aString	string to be tokenized.
 *	@param	aDelim	delimiter.
 *	@return	(Array) tokenized string.
 */
function tokenize(aString, aDelim) {
	var ts = [];
	var ss = aString.split(aDelim);
	for (var i=0; i<ss.length; i++) {
		if (ss[i].length > 0) {
			ts.push(ss[i]);
		}
	}
	return ts;
}


/**
 *	@param	aOccurs	(Array[Array]) occurances.
 *			e.g.: [[128,192,246],[129,193,248]]
 *	@param	aProximity proximity value.
 *	@return	array of occurrences.
 *			e.g.: [128, 129, 192, 193] for proximity 1,
 *				  [128, 129, 192, 193, 246, 248] for proximity 2.
 */
function filterPhrase(aOccurs, aProximity) {
	var result = [];
	var first = aOccurs[0];
	for (var i=0; i<first.length; i++) {
		var arrays = filterSubPhrase(first[i], aOccurs, aProximity);
		if (arrays.length == aOccurs.length) {
			pushAll(result, arrays);
		}
	}
	return result;
}


/**
 *	@param	aFirstOccur	first term occur index.
 *	@param	aOccurs		all term occurs arrays.
 *	@param	aProximity	proximity value.
 *	@return	word occur indexes.
 */
function filterSubPhrase(aFirstOccur, aOccurs, aProximity) {

	var result = [];
	result.push([aFirstOccur]);
	for (var i=1; i<aOccurs.length; i++) {
		var array = [];
		for (var j=0; j<aOccurs[i].length; j++) {
			var diff = Math.abs(aOccurs[i][j] - aFirstOccur);
			var ok = false;
			if (aProximity == 1) {	// exact match
				ok = (diff <= i);
	// <= handles hyphenated words
			} else {				// priximity match
				ok = (diff <= aProximity+1);
			}
			if (ok) {
				array.push(aOccurs[i][j]);
			}
		}
		if (array.length > 0) {
			result.push(array);
		}
	}
	return result;
}


/**
 *	@param	aResult	1D-array[]
 *	@param	aArrays	2D-array[][]
 */
function pushAll(aResult, aArrays)
{
	for (var i=0; i<aArrays.length; i++) {
		for (var j=0; j<aArrays[i].length; j++) {
			aResult.push(aArrays[i][j]);
		}
	}
}


/**
 *	@param	aArray	(Array) items.
 *	@param	aItem	item to be looked up.
 *	@return	index in array.  -1 if not found.
 */
function indexOf(aArray, aItem)
{
	for (var i=0; i<aArray.length; i++) {
		if (aArray[i] == aItem) {
			return i;
		}
	}
	return -1;
}


/**
 *	@param	aOccur	occurrence index.
 *	@return	new <span> element.
 */
function newSpan(aOccur)
{
	var line = getLine(aOccur);
	var span = document.createElement("span");
	var name = lts[line] + "." + wls[aOccur] + "." + lhs[line] + "." + wws[aOccur];
	span.setAttribute("hiliteName", name);
	span.className = "highlight";

	span.style.top = (lts[line]+1) + "px";		// +1 for border
	span.style.left = (wls[aOccur]+1) + "px";	// +1 for border
	span.style.height = lhs[line] + "px";
	span.style.width = wws[aOccur] + "px";
	return span;
}

function maybeAppend(node, cand)
{
	var children = node.childNodes;
	var candName = cand.getAttribute("hiliteName");

	for (var i=0; i<children.length; i++) {
		var child = children[i];
		if (child.nodeType == 1) {	// Element
			var childName = child.getAttribute("hiliteName");
			if (childName == candName) {
				return;
			}
		}
	}

	// If we reach this point, we haven't found the candidate. Append it.
	node.appendChild(cand);
}
