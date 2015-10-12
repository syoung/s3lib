////////////////////////////////////////////////////////////////////////////
// set_focus
//
// Created: November 8, 2004 - jwcrocke
// Updated: November 8, 2004 - jwcrocke
// Purpose: Sets page focus to specified form element
//
// Inputs: A form element
// Outputs: None
////////////////////////////////////////////////////////////////////////////
function set_focus(field) {
	field.focus();
}

////////////////////////////////////////////////////////////////////////////
// validate_form
//
// Created: November 8, 2004 - jwcrocke
// Updated: November 8, 2004 - jwcrocke
// Purpose: Validates data has been required for the specified fields
//
// Inputs: A form element
// Outputs: true - Success
//			false - Failure
////////////////////////////////////////////////////////////////////////////
function validate_form(form_elements) {
	// Initialize error counter & string
	errors = 0;
	error_str = "";
	
	// Loop through array of form elements
	for (i = 0; i < form_elements.length; i++) {
		// Debug
		//alert(form_elements[i].title + ": " + form_elements[i].type);
		
		// Missing value?
		if (!form_elements[i].value) {
			errors++;
			error_str = error_str + "\n- " + form_elements[i].title
		}
	}	
	
	// If any errors are found, alert the user
	if (errors) {
		alert("Please complete the following fields:" + error_str); 
		return false; 
	}
	return true;	
}

////////////////////////////////////////////////////////////////////////////
// clear_field
//
// Created: January 19, 2005 - jwcrocke
// Updated: January 19, 2005 - jwcrocke
// Purpose: Clears a text field upon user focus, if default value still 
//          exists
//
// Inputs: A form element, default text
// Outputs: true - Success
////////////////////////////////////////////////////////////////////////////
function clear_field(field, original) {
	if (field.value == original) { 
		field.value="";
	}
	return true;
}

function select_navigate(choice) {
	var url = choice.options[choice.selectedIndex].value;
	if(url) {
		location.href = url;
	}	
}

function wrapLogout() {
	var expires = " expires=Thu, 01-Jan-1970 00:00:01 GMT;";
	document.cookie = "WRAP16=;"+expires+" path=/;domain=ncsu.edu";
	document.cookie = "WRAP_REFERER=;"+expires+" path=/;domain=ncsu.edu";
	document.cookie = "WRAP_REFERER_P=;"+expires+" path=/;domain=ncsu.edu";
	document.cookie = "LIBFUNCTION=;"+expires+" path=/;domain=ncsu.edu";
}

function findWrap(){
	var sindex = document.cookie.indexOf("WRAP16");
	if (sindex != -1){
		return 1;
	}
	return 0;
}