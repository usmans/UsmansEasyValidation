using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.Services;
using System.Web.Script.Services;

public partial class _Default : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }

    [WebMethod]
    [ScriptMethod(ResponseFormat = ResponseFormat.Json)]
    public static ValidationResult validateInputs(List<Validationobject> prams)
    {
        ValidationResult result = new ValidationResult();
        result.ValidationStatusOverAll = true;
        result.prams = prams;
        result.pramCount = prams.Count;
        ValidationFactory.ValidateInputArray(result, ref result);
        return result;

    }
}