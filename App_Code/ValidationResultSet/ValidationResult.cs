using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

[Serializable]
public class ValidationResult
{
   
    public bool ValidationStatusOverAll = false;
    
    public List<Validationobject> prams;
    public int pramCount=0;


}

