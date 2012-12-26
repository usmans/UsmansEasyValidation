<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Default.aspx.cs" Inherits="_Default" %>



<%@ Register src="Scripts/JControls/JavascriptCombined.ascx" tagname="JavascriptCombined" tagprefix="uc1" %>



<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <link href="http://ajax.googleapis.com/ajax/libs/jqueryui/1.8.10/themes/blitzer/jquery-ui.css" rel="stylesheet" type="text/css" />
    <link href="Styles/Qtip/RoundCornerQtip.css" rel="stylesheet" type="text/css" />
  <link href="Styles/Qtip/jquery.qtip.css" rel="stylesheet" type="text/css" />
    <link href="Styles/Qtip/jquery.qtip.min.css" rel="stylesheet" type="text/css" />
    <link href="Styles/bootstrap/bootstrap.css" rel="stylesheet" type="text/css" />
   
     <link rel="stylesheet" type="text/css" href="themes/default/easyui.css">
	<link rel="stylesheet" type="text/css" href="themes/icon.css">





</head>
<body>
    <form id="form1" runat="server">
    <asp:ScriptManager ID="ScriptManager1" runat="server" EnablePageMethods ="true">
    <Scripts>
   
    <asp:ScriptReference  Path="~/Scripts/validation/ValidationFlagsFactory.js" />
     <asp:ScriptReference  Path="~/Scripts/validation/ValidationFactory.js" />
     <asp:ScriptReference  Path="~/Scripts/validation/textboxValidation.js" />
   
      
    </Scripts>
    </asp:ScriptManager>
    
   <script src="Scripts/jquery/jquery-1.8.3.min.js" type="text/javascript"></script>
<script src="Scripts/jquery/ajax/form2js.js" type="text/javascript"></script>
    <script src="Scripts/easyui/jquery.easyui.min.js" type="text/javascript"></script>
    <script src="Scripts/bootstrap/bootstrap.js" type="text/javascript"></script>
    
    <script src="Scripts/jquery/ajax/jquery.toObject.js" type="text/javascript"></script>
    <script src="Scripts/jquery/ajax/js2form.js" type="text/javascript"></script>
   <script src="Scripts/jquery/ajax/json2.js" type="text/javascript"></script>
    
    
     <script src="Scripts/jquery/plugins/qitp/jquery.qtip.js" type="text/javascript"></script>
   

     <script type="text/javascript">

         $(document).ready(function () {

             unloadwindow();
         
          });
         function test() {

            $('.qtip').remove();
             $("input").removeClass();
             //  var s =JSON.stringify($('#testForm').serializeObject());
             var arr = $('#testdiv :input').map(function () {
                 return { 'Name': $(this).attr('id'),
                     'value': $(this).attr('value'),
                     'validationRules': $(this).attr('validationRules'),
                     'Type': $(this).attr('type'),
                     'status': "",
                     'clientName': $(this).attr('ClientName'),
                     'ErrorMsg': $(this).attr('ErrorMsg'),
                     'ReturnMsg': $(this).attr('ReturnMsg')

                 }
             }).get();

             var obj = {
                 "abc": arr

             }
            
             var result = validateClientInputs(arr);
             if (CheckifClientIsValid(arr)) {PageMethods.validateInputs(arr, OnComplete);}
             else {FormatResultValidationClient(result);return;}
             

         }



         function CheckifClientIsValid(arr) {


             for (var i = 0, arrLength = arr.length; i < arrLength; i++) {
                
                 if (arr[i].status == "false") {
                     return false;                }
             }
             return true;
         
         }







         function FormatResultValidationClient(result) {

             for (var i = 0; i < result.length; i++) {
                 if (result[i].status == "false") {
                     ShowError(result[i].Name, result[i].ErrorMsg);
                     HeighlightError("div" + result[i].Name);
                 }
                 else {

                     HeighlightGood("div" + result[i].Name);
                 }
             
             }
         
         
         }

         function OnComplete(resultset) {

             for (var i = 0; i < resultset.prams.length; i++) {
                 if (resultset.prams[i].status == "false") {
                     ShowError(resultset.prams[i].Name, resultset.prams[i].ErrorMsg);
                     HeighlightError("div" + resultset.prams[i].Name);
                 }
                 else {

                     HeighlightGood("div" + resultset.prams[i].Name);
                 }

             }
         
            


         }

         function HeighlightError(divelement) {
             $("#" + divelement).attr("class", "control-group error");

         }
         function HeighlightGood(divelement) {
             $("#" + divelement).attr("class", "control-group success");

         }

         function HeighlightReset(divelement) {
             $("#" + divelement).attr("class", "");

         }

         function ShowError(controlid, msg) {

             $("#" + controlid).qtip(
                  {
                      target: $("#" + controlid),
                      position: {
                          my: 'left center',
                          at: 'center right'
                      },
                      content: {
                          // Set the text to an image HTML string with the correct src URL to the loading image you want to use
                          text: "<span class=\"ui-icon ui-icon-alert\" style=\"float: left; margin-right: .3em;\"></span>" + msg

                      },
                      show: {
                          when: false,
                          ready: true
                      },
                      hide: 'unfocus',
                      style: {

                          tip: true, // Apply a speech bubble tip to the tooltip at the designated tooltip corner
                          classes: 'ui-tooltip-red'

                      }
                  });


         }

         function loadwindows() {

             $('#win').window({
                 width: 550,
                 height: 300,
                 modal: true
             });  
         
         }

         function unloadwindow() {

             $('#win').window('close');
             return false;
         }


    </script>

    
    <div style="width:400px; margin:0px auto; margin-top:40%">
   <a id="btn" href="#"  class="btn btn-large btn-block btn-primary" onclick="loadwindows();" >Click here to start</a>  </div>
  <div id="win" class="easyui-window" title="My Window" style="width:510px;"  
        data-options="iconCls:'icon-save',modal:true">  

     <div  class="form-horizontal">
    
     <div class="bs-docs-example" id="testdiv" style="width:500px; margin:0px auto; margin-top:10px;">
   
   <div class="well">
           <br />
    
     
  <div id="divtxtinputName"class="control-group">
    <label class="control-label" for="txtinputName">Name</label>
    <div class="controls">
      <input type="text" id="txtinputName" clientName="Name" validationRules="required"/>
    </div>
  </div>
  <div id ="divtxtinputEmail" class="control-group">
    <label class="control-label" for="inputPassword">Email</label>
    <div class="controls">
      <input type="text" id="txtinputEmail"  clientName="Email" validationRules="required.email"/>
    </div>
  </div>
  <div class="control-group">
    <div class="controls">
      <label class="checkbox">
        <input type="checkbox"> Remember me
      </label>
      <button type="submit" class="btn btn-success" onclick="test();return false;" >Sign in</button>
    
    
    </div>
  </div>



</div>
      
      </div>
      
      </div>
   
</div>  
    </form>
</body>
</html>
