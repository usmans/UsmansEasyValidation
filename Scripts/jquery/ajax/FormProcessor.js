



  function ProcessForm () {

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
            "MyData": arr

        }

        PageMethods.validateInputs(arr, OnComplete);

    }




function OnComplete(resultset) {


             for (var i = 0; i < resultset.prams.length; i++) {
                 if (resultset.prams[i].status == "false") {
                     ShowTooltip(resultset.prams[i].Name,resultset.prams[i].ErrorMsg);

                 }


             }


         }


function ShowTooltip(controlid,msg) {

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
                          tip: true,
                          classes: 'ui-tooltip-red'
                      }

                  });


}

             
         