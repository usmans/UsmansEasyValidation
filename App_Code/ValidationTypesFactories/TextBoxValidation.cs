using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

/// <summary>
/// Summary description for TextBoxValidation
/// </summary>
public class TextBoxValidation
{
    public static void validateTextbox(ref Validationobject elementtoValidate)
    {

        if (elementtoValidate.validationRules == null || elementtoValidate.validationRules == "")
        {

            elementtoValidate.status = "false";
            //If some one send a http post request without  a rule
            elementtoValidate.ErrorMsg = "Missing Required SSEC Pram";
            return;

        }


            string[] temp = elementtoValidate.validationRules.Split('.');

            foreach (string item in temp)
            {

                switch (item.ToLower())
                {

                    case ValidationFlags.Required:
                        ValidationMethods.ValidateRequiredText(ref elementtoValidate);
                        if (elementtoValidate.status == "false") {
                            return;
                        }


                        break;
                      

                    case ValidationFlags.Email:
                        ValidationMethods.ValidateEmail(ref elementtoValidate);
                       if (elementtoValidate.status == "false") {
                            return;
                        }


                        break;
                      


                    default:
                        elementtoValidate.status = "false";
                        elementtoValidate.ErrorMsg = "Validation Rule not found";
                        return;


                }

          

            }

                
    }




   






}