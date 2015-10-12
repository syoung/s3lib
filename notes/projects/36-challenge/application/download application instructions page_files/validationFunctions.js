/**
 * trim
 * Function to trim the leading and trailing spaces from a given string
 * @param inputString String
 * @return inputString without leading and trailing spaces
 */
function trim(inputString) {
   // Removes leading and trailing spaces from the passed string. Also removes
   // consecutive spaces and replaces it with one space. If something besides
   // a string is passed in (null, custom object, etc.) then return the input.
   if (typeof inputString != "string") { return inputString; }
   var retValue = inputString;
   var ch = retValue.substring(0, 1);
   while (ch == " ") { // Check for spaces at the beginning of the string
      retValue = retValue.substring(1, retValue.length);
      ch = retValue.substring(0, 1);
   }
   ch = retValue.substring(retValue.length-1, retValue.length);
   while (ch == " ") { // Check for spaces at the end of the string
      retValue = retValue.substring(0, retValue.length-1);
      ch = retValue.substring(retValue.length-1, retValue.length);
   }
   /*while (retValue.indexOf("  ") != -1) { // Note that there are two spaces in the string - look for multiple spaces within the string
      retValue = retValue.substring(0, retValue.indexOf("  ")) + retValue.substring(retValue.indexOf("  ")+1, retValue.length); // Again, there are two spaces in each of the strings
   }*/
   //alert("\""+inputString+"\"==\""+retValue+"\"");
   return retValue; // Return the trimmed string back to the user
} // Ends the "trim" function


/**
 * deblankForm
 * Function to trim the leading and trailing spaces from each of the fields of a given form object
 * @param theForm a document.form object
 */
function deblankForm(theForm){
	for (var i = 0; i < theForm.elements.length; i++){
		if (theForm.elements[i].type == "text") {
			theForm.elements[i].value=trim(theForm.elements[i].value);
		}
	}
}

/**
 * allNumbers
 * Function to determine if a given string is a specified length and
 * is all numbers
 * @param str String
 * @param len length of str
 * @return true if valid
 */
function allNumbers(str, len){
	if (str.length == len) {
		var m=str.match( "^([0-9]+)$" );
		return m!=null;
	} else return false;
}

/**
 * isNumber
 * Function to determine if a given string is a number
 * @param str String
 * @return true if valid
 */
function isNumber(str, len){
	var m=str.match( "^([0-9]+)$" );
	return m!=null;
}

/**
 * validPhoneNo
 * Function to determine if a valid phone number is given, something
 * consisting only of numbers and -'s
 * @param phoneNo String
 * @return true if valid
 */
function validPhoneNo(phoneNo){
	if (phoneNo.length < 10)
		return false;
	var m=phoneNo.match( "^([0-9,-]+)$" );
	return m!=null;
}

/**
 * validUSPhoneNo
 * Function to determine if a valid US phone number is given of any of
 * the following forms ###-###-#### or (###)###-#### or ##########
 * @param phoneNo String
 * @return true if valid
 */
function validUSPhoneNo(phoneNo){
	var m;
	//###-###-####
	m=phoneNo.match( "^([0-9]{3})-([0-9]{3})-([0-9]{4})$" );
	if (m!=null) return true;

	//(###)###-####
	m=phoneNo.match( "^\(([0-9]{3})\)([0-9]{3})-([0-9]{4})$" );
	if (m!=null) return true;

	return allNumbers(phoneNo,10);
}

/**
 * validUSZip
 * Function to determine if a valid US zip code is given in the
 * following forms ##### or #####-#### or #########
 * @param zip String
 * @return true if valid
 */
function validUSZip(zip){
	var m;
	m=zip.match( "^([0-9]{5})-([0,9]{4})$" );
	if (m!=null) return true;

	m=zip.match( "^([0-9]{5})$" );
	if (m!=null) return true;

	m=zip.match( "^([0-9]{9})$" );
	if (m!=null) return true;

	return false;
}

/**
 * validEMail
 * Function to determine if a valid EMail has been entered
 * @param addr String
 * @return true if valid
 */
function validEMail(addr){
	var filter  = /^([\d\w\.\-\+])+\@(([\d\w\-\+])+\.)+([a-zA-Z]{2,})$/;
	return (filter.test(addr));
}

/**
 * setFormFieldValue
 * Function to set the value of a field in a form appropriate to 
 * the type of field as listed in the DOM
 * @param field form field <FORM name>.field
 * @param value value to set in the field
 */
function setFormValue(field, value){
	var i=0;
	if (field.type == "select-one"){
		for(i=0; i< field.options.length; i++){
			if (field.options[i].text == value)
				field.options[i].selected=true;
			else field.options[i],selected=false;
		}//for
	} else if (field.type == "checkbox"){
		if ((value == "1") || (value == "true"))
			field.checked=true;
	}else{
		field.value=value;
	}
}

/**
 * setFormFieldValue
 * Function to set the value of a field in a form appropriate to 
 * the type of field as listed in the DOM
 * @param field form field <FORM name>.field
 * @param value value to set in the field
 */
function setFormValue(field, value){
	var i=0;
	if (field.type == "select-one"){
		for(i=0; i< field.options.length; i++){
			if (field.options[i].text == value)
				field.options[i].selected=true;
			else field.options[i],selected=false;
		}//for
	} else if (field.type == "checkbox"){
		if ((value == "1") || (value == "true"))
			field.checked=true;
	}else{
		field.value=value;
	}
}