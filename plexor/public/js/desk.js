document.addEventListener("DOMContentLoaded", (event) => {
    //navbar notification icons
    stateChange(-1);
})

frappe.router.on('change', () => {
    console.log("Route change detected::: "+frappe.get_route())
    route = frappe.get_route();
    if(route.some(str => str.includes("Plexor CBS")) ||
        route.some(str => str.includes("Member"))
      )
    {
        if(!frappe.user_roles.includes("Plexor User"))
        {
            frappe.msgprint({
                title: __("Unauthorized User"),
                indicator: "error",
                message: __(
                   "<link href=\"https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css\" rel=\"stylesheet\" />"
                  +"<table width=\"100%\" style=\"width=100%;table-layout: fixed\">"
                  +"<td >You have not been granted authorization to access this part of the system.<br> Role <b>\"Plex User\"</b> is required. "
                  +"</td></tr><tr><td style=\"font-size: 10px;text-align: right;\">Ple<b>xor Ban</b>king</td></tr></table>")
            });
            frappe.set_route("Workspaces","Home");
        }
        else
        {
            if(route.some(str => str.includes("Plexor CBS")))
                regizter();
        }
    }
    else
        console.log("Not Plexor");
})

function is_printerble_key(evt)
{
    if((evt.keyCode > 47 && evt.keyCode < 58)   || // number keys
                        evt.keyCode == 32 || evt.keyCode == 13   || // spacebar & return key(s) (if you want to allow carriage returns)
                        (evt.keyCode > 64 && evt.keyCode < 91)   || // letter keys
                        (evt.keyCode > 95 && evt.keyCode < 112)  || // numpad keys
                        (evt.keyCode > 185 && evt.keyCode < 193) || // ;=,-./` (in order)
                        (evt.keyCode > 218 && evt.keyCode < 223))
        return true;
    else
        return false;
}

function regizter()
{
  frappe.call({
            method: "plexor.plexlib_web.reg_user", //dotted path to server method
            callback: function(r) {
                responseText = r.message
                console.log("REG COMPLETE :"+responseText);
            }
        });

}


function stateChange(newState) {
    setTimeout(function () {
        if (newState == -1) {
            let navbar = document.querySelector(".navbar-collapse");
            let anc = document.createElement('div');
            anc.setAttribute("id", "plxnot");
            anc.innerHTML=update_notification_icons(0,0,0);
            navbar.prepend(anc);
        }
    }, 1000);
}

function get_alerts()
{
  frappe.call({
            method: "plexor.plexlib_web.get_user_messages", //dotted path to server method
            callback: function(r) {
                responseText = r.message
                console.log("GOT :"+responseText);
                if(responseText.localeCompare("BLANK")==0)
                {

                }
                else if(responseText.localeCompare("SEC_DENY")==0)
                {
                    duration = 10;
                    theme = 'success';
                    indicator = 'green'
                    frappe.show_alert({
                                    message:__(
                                      "<link href=\"https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css\" rel=\"stylesheet\" />"
                                      +"<table width=\"100%\" style=\"width=100%;table-layout: fixed\">"
                                      +"<tr><td style=\"text-align: center;\"> User Not Allowed</td></tr><tr>"
                                      +"<td >"+responseText
                                      +"</td></tr><tr><td style=\"font-size: 10px;text-align: right;\">Ple<b>xor Ban</b>king</td></tr></table>"),
                                    indicator:indicator
                                }, duration);
                }
                else
                {
                        //alert( this.responseText );
                        var messages = responseText.split("|||");
                        for(let x=0; x<=messages.length-1; x++)
                        {
                            // Form elements
                            var myArray = messages[x].split("|");
                            //let word = myArray[1];
                            var title = myArray[1];//"Message Title";
                            var message = myArray[3];//'Place the real message content here once the development phase is completed.';
                            var counts = " "; counts = myArray[2];
                            if(counts==null)
                                return;
                            var msg_counts = counts.split(",");
                            notices_approvals = parseInt(msg_counts[0]);
                            notices_securities = parseInt(msg_counts[1]);
                            notices_systems = parseInt(msg_counts[2]);
                            //frappe.msgprint("Counts : "+notices_approvals+"   Counts : "+notices_securities+"   Counts : "+notices_systems);
                            var position = 'nfc-bottom-right';
                            //var duration = parseInt(myArray[3]);
                            var theme = 'warning';
                            var indicator = 'blue'
                            if(myArray[0].localeCompare("1")==0)
                            {
                                duration = 10;
                                theme = 'success';
                                indicator = 'green'
                            }
                            else if(myArray[0].localeCompare("2")==0)
                            {
                                duration = 10;
                                theme = 'info';
                                indicator = 'blue'
                            }
                            else if(myArray[0].localeCompare("3")==0)
                            {
                                duration = 15;
                                theme = 'warning';
                                indicator = 'orange'
                            }
                            else if(myArray[0].localeCompare("4")==0)
                            {
                                duration = 30;
                                theme = 'error';
                                indicator = 'red'
                            }
                            else if(myArray[0].localeCompare("5")==0)
                            {
                                duration = 10;
                                theme = 'none';
                                indicator = 'blue'
                            }
                                //message = message + "("+myArray[0]+")"
                            var closeOnClick = true;
                            var displayClose = false;

                            if(!message) {
                                message = 'You did not enter a message...';
                                continue;
                            }

                        document.getElementById('plxnot').innerHTML = update_notification_icons(notices_approvals, notices_securities, notices_systems);
                        if(message=="BLANK")
                            return;
                            var titlems = ""
                            if(title=="1")
                                titlems = "<a class=\"fa fa-thumbs-up\"> &nbsp;<b style=\"font-size:13px;font-family: var(--font-stack)\">Authorization Notification</b>";
                            else if(title=="2")
                                titlems = "<a class=\"fa fa-shield\"> &nbsp;<b style=\"font-size:13px;font-family: var(--font-stack)\">Security Notification</b>";
                            else
                                titlems = "<a class=\"fa fa-bell-o\"> &nbsp;<b style=\"font-size:13px;font-family: var(--font-stack)\">System Notification</b>";

                            if(myArray[0].localeCompare("0")==0)
                            {
                                indicator = 'red'
                                frappe.msgprint({
                                    title: __(titlems),
                                    indicator: indicator,
                                    message: __(
                                       "<link href=\"https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css\" rel=\"stylesheet\" />"
                                      +"<table width=\"100%\" style=\"width=100%;table-layout: fixed\">"
                                      +"<td >"
                                      +message
                                      +"</td></tr><tr><td style=\"font-size: 10px;text-align: right;\">Ple<b>xor Ban</b>king</td></tr></table>")
                                });
                            }
                            else
                            {
                                frappe.show_alert({
                                    message:__(
                                      "<link href=\"https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css\" rel=\"stylesheet\" />"
                                      +"<table width=\"100%\" style=\"width=100%;table-layout: fixed\">"
                                      +"<tr><td style=\"text-align: center;\"> "+titlems+"</td></tr><tr>"
                                      +"<td >"
                                      +message
                                      +"</td></tr><tr><td style=\"font-size: 10px;text-align: right;\">Ple<b>xor Ban</b>king</td></tr></table>"),
                                    indicator:indicator
                                }, duration);
                            }

                        }
                }
            }
        });

}

function update_notification_icons(notices_approvals, notices_securities, notices_systems)
{
    var num1_space = "right: -10px;";
    var num2_space = "right: -10px;";
    var num3_space = "right: -5px;";

    if(notices_approvals>99) num1_space = "right: -13px;"; else if(notices_approvals>9 && notices_approvals<99 ) num1_space = "right: -9px;"; else num1_space = "right: -6px;";
    if(notices_securities>99) num2_space = "right: -13px;"; else if(notices_securities>9 && notices_securities<99 ) num2_space = "right: -9px;"; else num2_space = "right: -6px;";
    if(notices_systems>99) num3_space = "right: -13px;"; else if(notices_systems>9 && notices_systems<99 ) num3_space = "right: -9px;"; else num3_space = "right: -6px;";

    var ret = "Ple<b>xor Ban</b>king &nbsp;&nbsp;&nbsp;&nbsp;"+
            "<link href=\"https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css\" rel=\"stylesheet\" />"+

            "<a class=\"fa fa-thumbs-up\" href=\"/app/plexnotification?msg_type=1\">"+(notices_approvals>0?
            "  <span class=\"fa fa-comment\" style=\"color: #428df5;\"></span>"+
            "  <span class=\"num\" style=\""+num1_space+"\"><b>"+notices_approvals+"</b></span>":"")+

            "</a>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;"+
            "<a class=\"fa fa-shield\" href=\"/app/plexnotification?msg_type=2\">"+(notices_securities>0?
            "  <span class=\"fa fa-comment\" style=\"color: red;\"></span>"+
            "  <span class=\"num\" style=\""+num2_space+"\"><b>"+notices_securities+"</b></span>":"")+

            "</a>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;"+
            "<a class=\"fa fa-bell-o\" href=\"/app/plexnotification?msg_type=3\">"+(notices_systems>0?
            "  <span class=\"fa fa-comment\" style=\"color: #6cdb56\"></span>"+
            "  <span class=\"num\" style=\""+num3_space+"\"><b>"+notices_systems+"</b></span>":"")+

            "</a>";
            return ret;
}

//'use strict';
const interval = setInterval(function() {
   get_alerts();
 }, 6000);
