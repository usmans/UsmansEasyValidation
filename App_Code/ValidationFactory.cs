using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Text.RegularExpressions;

/// <summary>
/// This Factory Will decide which method or class object to call for validation
/// </summary>
public  class ValidationFactory
{

    
	
    public static void ValidateInputArray(ValidationResult ItemstoValidate, ref ValidationResult ItemstoValidateResult)
    {


        for (int i = 0; i < ItemstoValidate.prams.Count; i++)
        {

            Validationobject tempobj = ValidateElement(ItemstoValidate.prams[i]);
            ItemstoValidateResult.prams[i] = tempobj;
            if (tempobj.status.ToString().ToLower() != "true")
            {
                ItemstoValidate.ValidationStatusOverAll = false;

            }

        }




    }

    public static Validationobject ValidateElement(Validationobject elementtoValidate)
    {

        switch (elementtoValidate.type) { 
        
            case "text":
                TextBoxValidation.validateTextbox(ref elementtoValidate);

                break;
        
            case "checkbox":
               
                break;
            case "dropdown":
                break;
            case "radio":
                break;
        
            default:
                elementtoValidate.status = "true";
                break;

        
        
        
        }


        return elementtoValidate;
    
    
    
    
    
    }


  
}