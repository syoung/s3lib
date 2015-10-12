/*
 * Copyright (C) 2007 by Institute for Systems Biology,
 * Seattle, Washington, USA.  All rights reserved.
 *
 * This source code is distributed under the GNU Lesser
 * General Public License, the text of which is available at:
 *   http://www.gnu.org/copyleft/lesser.html
 */


/**
 * screen scrape the search results page of the KEGG Pathway database.
 *
 * This allows returning which genes in your search set matched a pathway,
 * rather than all genes in that pathway.
 *
 * references FG_kegg in FG_keggSearchResults.getSpecies(...)
 */
var FG_keggSearchResults = new Object();


// this is a read-only handler
FG_keggSearchResults.dontDisplayInMenu = true;


FG_keggSearchResults.recognize = function(doc) {
	if (doc) {
		var url = doc.location.href;
		return url.indexOf("http://www.genome.jp/kegg-bin/search_pathway_www") >=0;
	}
	else
		return false;
}

FG_keggSearchResults.states = { INITIAL:0, FOUND_WARNING:1, FOUND_UNKNOWN_ITEMS:2, FOUND_LIST_ITEMS:3 };


/**
 * return an object with a list of names and a species
 */
FG_keggSearchResults.getPageData = function(doc) {
	var results = [];

	dump("scraping kegg search results page...\n\n");

	var species = this.getSpecies(doc);
	
	//dump("species = " + species + "\n");

	var preElement = ufmt.first(doc.getElementsByTagName("pre"));
	if (!preElement)
		preElement = ufmt.first(doc.getElementsByTagName("body"));

	if (preElement) {
		var i = 0;
		var state = this.states.INITIAL;
		while (i < preElement.childNodes.length) {
			//dump("\n------------------------------\n");
			//dump(preElement.childNodes[i] + ":\"" + preElement.childNodes[i].nodeName + "\"\n");
			
			var node = preElement.childNodes[i];

			if (state == this.states.INITIAL && node.nodeName == "FONT")
				state = this.states.FOUND_WARNING;
			else if (state == this.states.FOUND_WARNING && node.nodeName == "#text") {
				state = this.states.FOUND_UNKNOWN_ITEMS;

				// create a list of names
				var names = ufmt.trim(node.nodeValue).split("\n");
				//dump("names(" + names.length + ") = " + names + "\n");

				// if names were found, add them to the broadcastable results
				if (names.length > 0) {
					results.push(
						new FG_GaggleData(
						    "Items not found in KEGG Pathway",
						    "NameList",
							names.length,
							species,
							names));
				}
			}
			else if (state == this.states.INITIAL ||
			         state == this.states.FOUND_UNKNOWN_ITEMS ||
			         state == this.states.FOUND_LIST_ITEMS) {
				if (node.nodeName == "LI") {
					state == this.states.FOUND_LIST_ITEMS;

					// the page has an LI element with and anchor tag <a ...> and bold
					// text <b> nested inside it.
					var result = doc.evaluate("a/b[1]", node, null, XPathResult.STRING_TYPE, null);
					//dump("pathway = " + result.stringValue + "\n");
					
					// example: "hal00400 Phenylalanine, tyrosine and tryptophan biosynthesis"
					var pathway = new Object();
					pathway.keggCode = result.stringValue.substring(0,result.stringValue.indexOf(" "));
					pathway.name = result.stringValue.substring(result.stringValue.indexOf(" ")+1);
					pathway.genes = [];

					var names = [];

					var lines = ufmt.trim(ufmt.getText(node)).split("\n");
					//dump("lines = " + lines.length + "\n");
					for (var j=0; j<lines.length; j++) {
						var gene = this._parsePathwayEntryLine(lines[j]);
						if (gene) {
							pathway.genes.push(gene);
							names.push(gene.name);
							dump(gene.name + "," + gene.commonName + ",\"" + pathway.name + "\",\"" + gene.annotation + "\"," + gene.ec + "," + gene.swissProt + "\n");
						}
					}
					
					results.push(
						new FG_GaggleData(
						    pathway.name + " pathway",
						    "NameList",
							names.length,
							species,
							names));
				}
			}
	
			i++;
		}
		
		// We could collect the pathway objects and do something cool
		// with them here. Might be a nice use of tuples.
	}

	return results;
}


/**
 * get the species, if available, from the page. If query items match no
 * kegg pathway, then species is not in the page.
 */
FG_keggSearchResults.getSpecies = function(doc) {
	// use XPATH to grab the 3 letter species code
	var result = doc.evaluate("/html/body/ul/pre/li/a/b[1]", doc,
		null, XPathResult.STRING_TYPE, null);
	if (result && result.stringValue) {
		// convert to standard species name
		return FG_kegg.toStandardSpeciesName(result.stringValue.substring(0,3));
	}
	else {
		return "unknown";
	}
}


/**
 * a slightly hacky way to parse a line of KEGG output
 */
FG_keggSearchResults._parsePathwayEntryLine = function(line) {
	
	// example: VNG0314G       aroD; 3-dehydroquinate dehydratase [EC:4.2.1.10] [SP:AROD_HALSA]
	//          VNG1121G       aspC2; aspartate aminotransferase [EC:2.6.1.1]
	//          VNG1648G       trpF; phosphoribosylanthranilate isomerase [EC:5.3.1.24] [SP:TRPF_HALSA]
    //          VNG1341G       fabG; 3-oxoacyl-[acyl-carrier-protein] reductase [EC:1.1.1.100]

	//dump("parsing line: " + line + "\n");
	if (line) {
		var words = line.split(/\s+/);
		if (words.length > 0) {
			var gene = new Object();
			gene.name = words[0];
			
			//dump("words = [" + words + "]\n");
	
			if (words.length > 1) {
				var pos = 1;

				// find common name (ending with a semicolon)
				var m = words[pos].match(/(\w+);$/);
				if (m) {
					gene.commonName = m[1];
					pos++;
				}

				// find gene annotation, extracting EC and SP identifiers if present
				gene.annotation = "";
				while (pos < words.length) {
					m = words[pos].match(/\[EC:(.+)\]/);
					if (m) {
						gene.ec = m[1];
						pos++;
						continue;
					}
					m = words[pos].match(/\[SP:(.+)\]/);
					if (m) {
						gene.swissProt = m[1];
						pos++;
						continue;
					}
					
					// if the word is not an EC or SP identifier, make it part of the annotation
					gene.annotation += (" " + words[pos++]);
				}
			}
			
//			dump(FG_util.objectToString(gene) + "\n\n");
			
			return gene;
		}
	}
	return null;
}


// register handler
FG_addWebsiteHandler("KEGG Search Results", FG_keggSearchResults);


