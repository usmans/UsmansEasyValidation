
//Entry point for validation function in javascript this function copies the validation array into a a buffer and passes it on for validation
//once each element is validated the result is copied to the clones array as we canot modify the array we are looping on


function validateClientInputs(arr) {

    for (var i = 0, arrLength = arr.length; i < arrLength; i++) {
        // Notice that we've named the counter 'i'
        Validateobjects(arr[i]);
       
    }


    return arr;

}

//This function works as a factory it checks the element type and calls appropriate method 
function Validateobjects(elementToVerify) {

   switch (elementToVerify.Type) {
       case "text":

           return validateTextBox(elementToVerify);

           
         break;
  
    
    }

 }

 

 //--------------------------All Textbox validation functions goes here--------------------------------------//


 //This is entry point function to validate a textbox once object is found to be a textbox a validation function is called accordingly 

 function validateTextBox(elementToValidate) {
     var flag = new validationflags();
   
   var flags= elementToValidate.validationRules.toString().split('.');


   for (var i = 0, arrLength = flags.length; i < arrLength; i++) {
       switch (flags[i]) {
           case flag.Required:
               elementToValidate = validateRequiredTextbox(elementToValidate);
               if (elementToValidate.status == 'false') {
                   return elementToValidate;
                   }
               break;

           case flag.Email:

               elementToValidate = validateIsEmailTextbox(elementToValidate);
               if (elementToValidate.status == 'false') {
                   return elementToValidate;
               }
               break;


             

       }
   }
   return elementToValidate;
   

 }



