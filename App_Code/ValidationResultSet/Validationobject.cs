using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

/// <summary>
/// Summary description for Validationobject
/// </summary>
[Serializable]
public class Validationobject
{
	public Validationobject()
	{
		//
		// TODO: Add constructor logic here
		//
	}
    public string ReturnMsg { get; set; }
    public string Name
    {
        get;
        set;
    }
    public string Value
    {
        get;
        set;
    }
   
    public string
        clientName
    {
        get;
        set;
    }

    public string status
    {
        get;
        set;
    }
    public string type { get; set; }

    public string validationRules { get; set; }
    public string ErrorMsg { get; set; }


}


