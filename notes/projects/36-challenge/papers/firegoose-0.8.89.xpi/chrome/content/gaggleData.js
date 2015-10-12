/*
 * Copyright (C) 2007 by Institute for Systems Biology,
 * Seattle, Washington, USA.  All rights reserved.
 *
 * This source code is distributed under the GNU Lesser
 * General Public License, the text of which is available at:
 *   http://www.gnu.org/copyleft/lesser.html
 */


/**
 * To support asynchronous calls, set the property 'isAsynch' to true
 * and implement the method 'asynchronouslyFetchData', which takes a
 * callback function as an arguement. See the function FG_broadcast in
 * firegoose.js.
 */
function FG_GaggleData(name, dataType, size, species, data) {
	this._name = name;
	this._type = dataType;
	this._size = size;
	this._species = species;
	this._data = data;
}

FG_GaggleData.prototype.getName = function() {
	return this._name;
}

/**
 * types are: NameList, Map, Network, DataMatrix, Cluster
 * TODO: support Tuple
 */
FG_GaggleData.prototype.getType = function() {
	return this._type;
}

FG_GaggleData.prototype.getSize = function() {
	return this._size;
}

FG_GaggleData.prototype.getSpecies = function() {
	return this._applyDefaultSpecies(this._species);
}

FG_GaggleData.prototype.getDescription = function() {
	return this.getName() + ": " + this.getType() + this._sizeString();
}

FG_GaggleData.prototype._sizeString = function() {
	if (this.getSize())
		return "(" + this.getSize() + ")";
	else
		return "";
}

FG_GaggleData.prototype.getData = function() {
	return this._data;
}

/**
 * Return data in its Java form (required for broadcasting gaggle data objects
 * through the Gaggle Boss).
 */
FG_GaggleData.prototype._getDataAsJavaObject = function() {
	// getData may already be overridden to read data lazily
	var data = this.getData();
    
	if (!data)
	return null;

    // is this a good way to detect whether data is a java object?
	if (data.getClass) {
		return data;
	}
	else {
		if (this.getType() == "Network") {
			this._data = FG_GaggleData.jsToJavaNetwork(this.getName(), this.getSpecies(), data);
		}
		else if (this.getType() == "DataMatrix") {
			this._data = FG_GaggleData.jsToJavaDataMatrix(this.getName(), this.getSpecies(), data);
		}
		return this._data;
	}
}



FG_GaggleData.prototype.toString = function() {
	return this.getDescription();
}

/**
 * This method will be "overridden" in the firegoose (by
 * replacing it) which is the least goofy way I could think
 * of to avoid a circular dependency between this and
 * firegoose.js where the real defaulting policy is implemented
 */
FG_GaggleData.prototype._applyDefaultSpecies = function(species) {
	return species;
}


/**
 * set the GaggleData object to lazily convert a js object to
 * java when the data is requested (when getData() is called).
 */
FG_GaggleData.prototype.setConvertToJavaOnGetData = function() {

	var oldGetData = this.getData;
	this.getData = function() {

		// getData may already be overridden to read data lazily
	    var data = oldGetData.call(this);

		if (!data)
			return null;

		// is this a good way to detect whether data is a java object?
		if (data.getClass) {
			return data;
		}
		else {
			if (this.getType() == "Network") {
				this._data = FG_GaggleData.jsToJavaNetwork(this.getName(), this.getSpecies(), data);
			}
			else if (this.getType() == "DataMatrix") {
				this._data = FG_GaggleData.jsToJavaDataMatrix(this.getName(), this.getSpecies(), data);
			}
			return this._data;
		}
	}

	return this;
}


// takes a javascript dataMatrix object and returns a java DataMatrix.
FG_GaggleData.jsToJavaDataMatrix = function(name, species, jsDataMatrix) {
	var matrix = javaFiregooseLoader.createDataMatrix();
	matrix.setName(name);
	matrix.setSpecies(species);
	matrix.setRowTitlesTitle(jsDataMatrix.rowTitlesTitle)
	matrix.setRowTitles(javaFiregooseLoader.toJavaArray(java.lang.String, jsDataMatrix.rowTitles));
	matrix.setColumnTitles(javaFiregooseLoader.toJavaArray(java.lang.String, jsDataMatrix.columnTitles))
	matrix.set(javaFiregooseLoader.toJavaDoubleMatrix(jsDataMatrix.data));
	return matrix;
};


// take a javascript network object and create a java equivalent
FG_GaggleData.jsToJavaNetwork = function(name, species, jsNetwork) {
	var network = javaFiregooseLoader.createNetwork();

	// we handle orphan nodes below in the loop through interactions
//		for (var i in jsNetwork.nodes) {
//			var node = jsNetwork.nodes[i];
//			network.add(node);
//		}

	network.setName(name);
	network.setSpecies(species);

	for (var i in jsNetwork.interactions) {
		// rows may be either 1 element (an orphan node) or 3 elements
		// in the form [<node>, <interaction>, <node>]
		var row = jsNetwork.interactions[i];
		if (row.length >= 3 && row[1].length>0 && row[2].length>0) {
			var interaction = javaFiregooseLoader.createInteraction(row[0], row[2], row[1]);
			network.add(interaction);
		}
		else if (row.length >= 1 && row[0].length>0) {
			network.add(row[0]);
		}
	}

	for (var i in jsNetwork.nodeAttributes) {
		var row = jsNetwork.nodeAttributes[i];
		if (row.length >= 3) {
			network.addNodeAttribute(row[0], row[1], row[2]);
		}
	}

	for (var i in jsNetwork.edgeAttributes) {
		var row = jsNetwork.edgeAttributes[i];
		if (row.length >= 3) {
			network.addEdgeAttribute(row[0], row[1], row[2]);
		}
	}

	return network;
};

