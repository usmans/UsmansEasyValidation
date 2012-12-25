using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Text.RegularExpressions;

/// <summary>
/// Summary description for ValidationMethods
/// </summary>
public static class ValidationMethods
{





    //Required Feild validation functions 
    //Methods for strings
    public static void ValidateRequiredText(ref Validationobject elementtoValidate)
    {

        if (elementtoValidate.Value != null && elementtoValidate.Value != "")
        {

            elementtoValidate.status = "true";
        }
        else {

            elementtoValidate.status = "false";




            if (elementtoValidate.ReturnMsg != "" && elementtoValidate.ReturnMsg != null)
                //Show custom message for this error 
                elementtoValidate.ErrorMsg = elementtoValidate.ReturnMsg;
            else
                //show default msg for this error
                elementtoValidate.ErrorMsg = elementtoValidate.clientName + " is a Required feild!";






        
        }

        // return false;

    }
    public static void ValidateEmail(ref Validationobject elementtoValidate)
    {

        bool isvalid = Regex.IsMatch(elementtoValidate.Value , @"^([\w-\.]+)@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.)|(([\w-]+\.)+))([a-zA-Z]{2,4}|[0-9]{1,3})(\]?)$");


        if (isvalid)
        {
            elementtoValidate.status = "true";

            // return true;
        }
        else
        {
            elementtoValidate.status = "false";

            if (elementtoValidate.ReturnMsg != "" && elementtoValidate.ReturnMsg != null)
                //Show custom message for this error 
                elementtoValidate.ErrorMsg = elementtoValidate.ReturnMsg;
            else
                //show default msg for this error
                elementtoValidate.ErrorMsg = elementtoValidate.clientName + " is not a valid Email address!";




        }








    }
 




    //-----------------------------------------------------------------------------------------

    //Valid Email Address function 









    
   

}