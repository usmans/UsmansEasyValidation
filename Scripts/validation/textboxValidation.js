
//Genral Validation Functions

///////////////////////////////////////////////////////////////////////////////////////////////////////////
//Required Textbox
function validateRequiredTextbox(elementToValidate) {

    if (elementToValidate.value && elementToValidate.value != '') {

        elementToValidate.status = "true";
        return elementToValidate;
    }
    else {
        if (elementToValidate.ReturnMsg != '') {//Show custom message for this error 
            elementToValidate.ErrorMsg = elementToValidate.ReturnMsg;
        }
        else {
            //show default msg for this error
            elementToValidate.ErrorMsg = elementToValidate.clientName + " is a Required feild!";
            elementToValidate.status = "false";
        }

    }

    return elementToValidate;


}
///////////////////////////////////////////////////////////////////////////////////////////////////////////

//Email Address validation
function validateIsEmailTextbox(elementToValidate) {

    var str = elementToValidate.value
    var filter = /^([\w-]+(?:\.[\w-]+)*)@((?:[\w-]+\.)*\w[\w-]{0,66})\.([a-z]{2,6}(?:\.[a-z]{2})?)$/i
    if (filter.test(str)) {
        elementToValidate.status = "true";
        return elementToValidate;
    }
    else {

        if (elementToValidate.ReturnMsg != '') {//Show custom message for this error 
            elementToValidate.ErrorMsg = elementToValidate.ReturnMsg;
        }
        else {
            //show default msg for this error
            elementToValidate.ErrorMsg = elementToValidate.clientName + " is not a valid!";
            elementToValidate.status = "false";
        }
    }

    return elementToValidate;

}
 




