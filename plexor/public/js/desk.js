

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

function get_current_datetime()
{
    var currentdate = new Date();
    var datetime =  currentdate.getDate() + "/"
                + (currentdate.getMonth()+1)  + "/"
                + currentdate.getFullYear() + " "
                + currentdate.getHours() + ":"
                + currentdate.getMinutes() + ":"
                + currentdate.getSeconds();
    return datetime;
}

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

function reroute(classname, docid)
{
    sql = "SELECT `name` FROM tabDocType WHERE REPLACE(`name`, ' ', '')='"+classname+"'";
    frappe.call({
            method: "plexor.plexlib_web.db_query", //dotted path to server method
            args: {sql:sql, db:"main"},
            callback: function(r) {
                doctype = String(r.message);
                console.log("query doctype= :"+doctype+ ", document:"+docid);
                doctype = doctype.replace(" ", "-").toLowerCase();
                //frappe.route_options = {
				//	"xxx": "TextCode"
				//};
                frappe.set_route("Form", doctype, docid);
                //return responseText;
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

function load_message(id)
{
    alert("go "+id);
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
function post_trx(docname)
{
    frappe.call({
                    method: "plexor.plexlib_web.post_mc_transaction",
                    args: {docname: docname},
                    callback: function(r) {
                        responseText = r.message
                        if(responseText=="success")
                        {
                            frappe.msgprint("This docuemnt has been successfully approved and posted.")
                            frm.dirty();
                            frm.save();
                        }
                    }
                });
}

function plexSave(frm)
{
    if(frm.is_new())
        is_maker_checker_enabled(frm, frm["doctype"],"INSERT");
    else if(!frm.is_new())
        is_maker_checker_enabled(frm, frm["doctype"],"UPDATE")
    else
    {
        frm.dirty();
        frm.save();
    }
    //if (frm.is_new())
        //frm.reload_doc()
}

function prepare_delete(frm, children="", children_fields="")
{
    frappe.call({
        method: "plexor.plexlib_web.check_parent_makerchecker_status",
        args: {form: frm.doc, type: "UPDATE"},
        callback: function(r) {
            responseText = r.message
            console.log("IS MAKE CHECKER:::"+responseText);
            if(responseText=="is_mc_req")
            {
                console.log("GETTING CHECKERS");
                frappe.call({
                    method: "plexor.plexlib_web.get_checkers",
                    args: {},
                    callback: function(r) {
                        responseText = r.message
                        console.log(responseText);
                        data = "[";
                        for(let x in responseText)
                            {
                                data = data + "{\"checker\":\""+responseText[x]+"\"},";
                            }
                            data = data.substring(0, data.length - 1);
                        data = data + "]";
                        console.log(data);
                        selectCheckersParentDelete(frm, JSON.parse(data), "Confirm Delete", "-", args, children, children_fields);
                    }
                });
            }
            else  // No maker checker dialog required
            {
                args["checkers"] = "";
                frm.doc["children"] = children;
                frm.doc["children_fields"] = children_fields;
                    frappe.call({
                        method: "plexor.plexlib_web.deleteDoc",
                        args: {form: frm.doc, children:children,  children_fields: children_fields},
                        callback: function(r) {
                            responseText = r.message
                            if(responseText=="success")
                            {
                                frappe.msgprint("Document deleted successfully.");
                            }
                        }
                    });
            }
        }
    });
}

function is_maker_checker_enabled(frm, doctype,type)
{
    doctype = doctype.replace(" ","");
    frappe.call({
                    method: "plexor.plexlib_web.is_maker_checker_required",
                    args: {doctype: doctype, type: type},
                    callback: function(r) {
                        responseText = r.message
                        console.log("IS MAKE CHECKER:::"+responseText);
                        if(responseText==true)
                        {
                            console.log("GETTING CHECKERS");
                            frappe.call({
                                method: "plexor.plexlib_web.get_checkers",
                                args: {},
                                callback: function(r) {
                                    responseText = r.message
                                    console.log(responseText);
                                    data = "[";
                                    for(let x in responseText)
                                        {
                                            data = data + "{\"checker\":\""+responseText[x]+"\"},";
                                        }
                                        data = data.substring(0, data.length - 1);
                                    data = data + "]";
                                    console.log(data);
                                    selectCheckers(frm, JSON.parse(data));
                                }
                            });
                        }
                        else
                        {
                            frm.dirty();
                            frm.save();
                        }
                    }
                });
}

function selectCheckers(frm, data)
{
    let d = new frappe.ui.Dialog({
        title: 'Select Insert Checkers',
        fields: [
            {
                label: 'Maker-checker is enabled for this action. Please Select verifiers from list below.',
                fieldname: 'checkers',
                fieldtype: 'Table',
                cannot_add_rows: true,
                in_place_edit: false,
                cannot_add_rows: 1,
                cannot_delete_rows : 1,
                data: data,
                //data: [{checker:'Row1.1'}, {checker:'Row2.1'}, {checker:'Row3.1'}, {checker:'Row4.1'}, {checker:'Row5.1'}],
                fields: [
                    { fieldname: 'checker', fieldtype: 'Data', in_list_view: 1, read_only: 1, label: 'Checkers' }
                ]
            },
        ],
        size: 'small', // small, large, extra-large
        primary_action_label: 'Submit',
        primary_action(values) {
            checkers = "";
            for(let key in values)
            {
                //console.log(values[key]);
                obj = values[key];
                for(let x in obj)
                {
                    if(obj[x].__checked)
                    {
                        console.log(obj[x].checker);
                        checkers = checkers + obj[x].checker + ",";
                    }
                }
            }
            frm.set_value('checkers', checkers);
            frm.dirty();
            if(frm.is_new())
                frm.save();
            else
                frm.dirty();
                frm.save();//("Update");
            console.log("POST CHECKERS:"+checkers)
            d.hide();

        }
    });

    d.show();
}


function selectCheckersChild(frm, datas, add_title, add_filter_function, add_args, add_function, grid_name, add_grids)
{
    let d = new frappe.ui.Dialog({
        title: 'Select Insert Child Checkers',
        fields: [
            {
                label: 'Maker-checker is enabled for this action. Please Select verifiers from list below.',
                fieldname: 'checkers',
                fieldtype: 'Table',
                cannot_add_rows: true,
                in_place_edit: false,
                cannot_add_rows: 1,
                cannot_delete_rows : 1,
                data: datas,
                //data: [{checker:'Row1.1'}, {checker:'Row2.1'}, {checker:'Row3.1'}, {checker:'Row4.1'}, {checker:'Row5.1'}],
                fields: [
                    { fieldname: 'checker', fieldtype: 'Data', in_list_view: 1, read_only: 1, label: 'Checkers' }
                ]
            },
        ],
        size: 'small', // small, large, extra-large
        primary_action_label: 'Submit',
        primary_action(values) {
            checkers = "";
            for(let key in values)
            {
                //console.log(values[key]);
                obj = values[key];
                for(let x in obj)
                {
                    if(obj[x].__checked)
                    {
                        console.log(obj[x].checker);
                        checkers = checkers + obj[x].checker + ": pending,";
                        //frm.set_value('checkers', checkers);
                        //frm.dirty();
                        //frm.save();
                    }
                }
            }
            console.log("POST CHECKERS:"+checkers)
            d.hide();
            grid_addrow_custom_form(frm, add_title, add_filter_function, add_args, add_function, grid_name, checkers, add_grids);
        }
    });

    d.show();
}


function selectCheckersParentDelete(frm, data, del_title, title, args, children="", children_fields="")
{
    //No update an d so
    let d = new frappe.ui.Dialog({
        title: 'Select Delete Parent Checkers',
        fields: [
            {
                label: 'Maker-checker is enabled for this action. Please Select verifiers from list below.',
                fieldname: 'checkers',
                fieldtype: 'Table',
                cannot_add_rows: true,
                in_place_edit: false,
                cannot_add_rows: 1,
                cannot_delete_rows : 1,
                data: data,
                //data: [{checker:'Row1.1'}, {checker:'Row2.1'}, {checker:'Row3.1'}, {checker:'Row4.1'}, {checker:'Row5.1'}],
                fields: [
                    { fieldname: 'checker', fieldtype: 'Data', in_list_view: 1, read_only: 1, label: 'Checkers' }
                ]
            },
        ],
        size: 'small', // small, large, extra-large
        primary_action_label: 'Submit',
        primary_action(values) {
            checkers = "";
            for(let key in values)
            {
                //console.log(values[key]);
                obj = values[key];
                for(let x in obj)
                {
                    if(obj[x].__checked)
                    {
                        console.log(obj[x].checker);
                        checkers = checkers + obj[x].checker + ",";
                    }
                }
            }
            console.log("POST CHECKERS:"+checkers)
            args["checkers"] = checkers;
            frm.doc["checkers"] = checkers;
            frm.doc["children"] = children;
            frm.doc["children_fields"] = children_fields;
            d.hide();
            frappe.call({
                    method: "plexor.plexlib_web.deleteDoc",
                    args: {form: frm.doc, children: children, children_fields: children_fields},
                    callback: function(r) {
                        responseText = r.message

                        if(args["checkers"].length >= 2 )
                            frappe.msgprint("Deletion request has been successfully queued.");
                        else
                        {
                            //frm.add_child(grid_name, args);
                            frm.refresh_field(grid_name);
                            //frm.dirty();
                            //frm.save('Update');
                        }
                        //if(responseText=="success")
                        //{
                        //    row.remove();
                        //    frm.refresh_field(grid_name);
                        //}
                    }
                });
        }
    });

    d.show();
}

function selectCheckersChildDelete(frm, data, del_title, title, args,  grid_name)
{
    //No update an d so
    let d = new frappe.ui.Dialog({
        title: 'Select Child Delete Checkers',
        fields: [
            {
                label: 'Maker-checker is enabled for this action. Please Select verifiers from list below.',
                fieldname: 'checkers',
                fieldtype: 'Table',
                cannot_add_rows: true,
                in_place_edit: false,
                cannot_add_rows: 1,
                cannot_delete_rows : 1,
                data: data,
                //data: [{checker:'Row1.1'}, {checker:'Row2.1'}, {checker:'Row3.1'}, {checker:'Row4.1'}, {checker:'Row5.1'}],
                fields: [
                    { fieldname: 'checker', fieldtype: 'Data', in_list_view: 1, read_only: 1, label: 'Checkers' }
                ]
            },
        ],
        size: 'small', // small, large, extra-large
        primary_action_label: 'Submit',
        primary_action(values) {
            checkers = "";
            for(let key in values)
            {
                //console.log(values[key]);
                obj = values[key];
                for(let x in obj)
                {
                    if(obj[x].__checked)
                    {
                        console.log(obj[x].checker);
                        checkers = checkers + obj[x].checker + ": pending,";
                        //frm.set_value('checkers', checkers);
                        //frm.dirty();
                        //frm.save();
                    }
                }
            }
            console.log("POST CHECKERS:"+checkers)
            args["checkers"] = checkers;
            //args["child_id"] = child_id;
            console.log(frm.doc);
            args["doc"] = frm.doc;
            d.hide();
            frappe.call({
                    method: "plexor.plexlib_web.delete_child_row",
                    args: args,
                    callback: function(r) {
                        responseText = r.message

                        if(args["checkers"].length >= 2 )
                            frappe.msgprint("Deletion request has been successfully queued.");
                        else
                        {
                            //frm.add_child(grid_name, args);
                            frm.refresh_field(grid_name);
                            //frm.dirty();
                            //frm.save('Update');
                        }
                        //if(responseText=="success")
                        //{
                        //    row.remove();
                        //    frm.refresh_field(grid_name);
                        //}
                    }
                });
        }
    });

    d.show();
}


function setup_grid(frm, grid_name, load_args, add_title, add_filter_function, add_args ,add_grids)
{
    load_function = "plexor.plexlib_web.get_child_row";
    add_function = "plexor.plexlib_web.save_child_row";
    add_field="name";
    //if(add_doctype!="ALLOW_FORM")
    //{
        frm.set_df_property(grid_name, 'cannot_add_rows', true);
        frm.fields_dict[grid_name].grid.wrapper.on('click', '.grid-row', function(event) {

        });
    //}
    frm.set_df_property(grid_name, 'cannot_delete_rows', true);

    //=====================================LOADING GRIDS===================================================
            //Load debit accounts
            var docname = row.doc.name;
            args = JSON.parse(load_args);
            for (let x in args) {
               console.log(x + ": "+ args[x])
               if(args[x].startsWith("frm.doc."))
               {
                    doc_field = args[x].replace("frm.doc.", "");
                    args[x] = frm.doc[doc_field];
               }
            }
             frappe.call({
                    method: load_function,
                    args: args,
                    callback: function(r) {
                        responseText = r.message
                        let items = responseText
                        items.forEach(item=>{
                            frm.add_child(grid_name, item);
                            console.log(item);
                        })
                        frm.refresh_field(grid_name);
                    }
                });
    //=====================================DELETING GRID ROWS===================================================
            //if (!frm.is_new())
            frm.fields_dict[grid_name].grid.add_custom_button(__('Delete'),
                function() {
                var grid = frm.fields_dict[grid_name].grid.grid_rows;

                grid.forEach(function(row) {
                    if (row && row.wrapper.find('.grid-row-check').is(':checked')) {
                        var docname = row.doc.child_id;
                        console.log(">>>>"+docname);
                        console.log(row);
                        //frappe.msgprint(docname);
                        //console.log("delete_args :: "+delete_args)
                        args = JSON.parse("{}");
                        frm["doc"]["child"]=row.doc;
                        for (let x in args) {
                           console.log(x + ": "+ args[x])
                           if(args[x].startsWith("row.doc."))
                           {
                                doc_field = args[x].replace("row.doc.", "");
                                args[x] = row.doc[doc_field];
                                console.log("Converted:: "+args[x])
                           }
                           else if(args[x].startsWith("frm.doc."))
                           {
                                doc_field = args[x].replace("frm.doc.", "");
                                args[x] = frm.doc[doc_field];
                                console.log("Converted:: "+args[x])
                           }
                        }
                        console.log(args);

                        //doctype = doctypeName.replace(" ","");
                        //console.log(frm.doc.name)
                    frappe.call({
                            method: "plexor.plexlib_web.check_parent_makerchecker_status",
                            args: {form: frm.doc, type: "UPDATE"},
                            callback: function(r) {
                                responseText = r.message
                                console.log("IS MAKE CHECKER:::"+responseText);
                                if(responseText=="is_mc_req")
                                {
                                    console.log("GETTING CHECKERS");
                                    frappe.call({
                                        method: "plexor.plexlib_web.get_checkers",
                                        args: {},
                                        callback: function(r) {
                                            console.log("Here It Is....");
                                            args['form'] = frm.doc;
                                            responseText = r.message
                                            console.log(responseText);
                                            data = "[";
                                            for(let x in responseText)
                                                {
                                                    data = data + "{\"checker\":\""+responseText[x]+"\"},";
                                                }
                                                data = data.substring(0, data.length - 1);
                                            data = data + "]";
                                            console.log(data);
                                            //frm["doc"]["c_doctype"] = add_doctype;
                                            args["child_id"] = docname;
                                            selectCheckersChildDelete(frm, JSON.parse(data), "Confirm Delete", "-", args, grid_name);
                                        }
                                    });
                                }
                                else  // No maker checker dialog required
                                {
                                    args["checkers"] = "";
                                    //frm["doc"]["c_doctype"] = add_doctype;
                                    args["form"] = frm.doc;
                                    args["child_id"] = docname;
                                        frappe.call({
                                            method: "plexor.plexlib_web.delete_child_row",
                                            args: args,
                                            callback: function(r) {
                                                responseText = r.message
                                                if(responseText=="success")
                                                {
                                                    row.remove();
                                                    frm.refresh_field(grid_name);
                                                }
                                            }
                                        });
                                }
                            }
                        });
                    }
                });
            });

    //=====================================ADDING GRID ROWS===================================================
            //if (!frm.is_new())
            frm.fields_dict[grid_name].grid.add_custom_button(__('Add'),
                function() {
                    if (frm.is_new())
                    {
                        frappe.msgprint("You need to save this document first before you can add items on this table.");
                        return;
                    }
                    //doctype = doctypeName.replace(" ","");
                    frappe.call({
                            method: "plexor.plexlib_web.check_parent_makerchecker_status",
                            args: {form: frm.doc, type: "UPDATE"},
                            callback: function(r) {
                                responseText = r.message
                                console.log("IS MAKE CHECKER:::"+responseText);
                                if(responseText=="is_mc_req")
                                {
                                    console.log("GETTING CHECKERS");
                                    frappe.call({
                                        method: "plexor.plexlib_web.get_checkers",
                                        args: {},
                                        callback: function(r) {
                                            responseText = r.message
                                            console.log(responseText);
                                            data = "[";
                                            for(let x in responseText)
                                                {
                                                    data = data + "{\"checker\":\""+responseText[x]+"\"},";
                                                }
                                                data = data.substring(0, data.length - 1);
                                            data = data + "]";
                                            console.log(data);
                                            selectCheckersChild(frm, JSON.parse(data), add_title, add_filter_function, add_args, add_function, grid_name, add_grids);
                                        }
                                    });
                                }
                                else  // No maker checker dialog required
                                {
                                    //if(add_doctype=="ALLOW_FORM" || add_doctype=="CUSTOM_FORM")
                                        grid_addrow_custom_form(frm, add_title, add_filter_function, add_args, add_function, grid_name, "", add_grids);
                                    //else
                                    //    grid_addrow_select(frm, add_title, add_field, add_doctype, add_filter_function, add_args, add_function, grid_name);
                                }
                            }
                        });
                    //if(add_doctype=="ALLOW_FORM" || add_doctype=="CUSTOM_FORM")
                    //    grid_addrow_custom_form(frm, add_title, add_filter_function, add_args, add_function, grid_name);
                    //else
                    //    grid_addrow_select(frm, add_title, add_field, add_doctype, add_filter_function, add_args, add_function, grid_name);
            });
            frm.fields_dict[grid_name].grid.grid_buttons.find('.btn-custom').removeClass('btn-default').addClass('btn-primary');
}

function grid_addrow_custom_form(frm, add_title, add_filter_function, add_args, add_function, grid_name, checkers, add_grids)
{
    //console.log("HELLO 2.1");
    let d = new frappe.ui.Dialog({
        title: add_title,
        fields: add_filter_function,
        size: 'small', // small, large, extra-large
        primary_action_label: 'Save',
        primary_action(values) {
            args = JSON.parse(add_args);
            for (let x in args) {
               if(args[x].startsWith("values."))
               {
                    doc_field = args[x].replace("values.", "");
                    args[x] = values[doc_field];
               }
               else if(args[x].startsWith("frm.doc."))
               {
                    doc_field = args[x].replace("frm.doc.", "");
                    args[x] = frm.doc[doc_field];
               }
               else if(args[x].startsWith("THIS_FORM"))
               {
                    //doc_field = args[x].replace("frm.doc.", "");
                    console.log("||||||||")
                    console.log(frm.doc);
                    console.log("||||||||")
               }
            }
            //args["row"] = JSON.stringify(frm.doc);
            args["row"] = JSON.stringify(args)
            args["checkers"] = checkers;
            args["parent_id"] = frm.doc.name;
            console.log(">>>>>>>>>")
            console.log(args);
            console.log("<<<<<<<<<")
            frappe.call({
                method: add_function,
                args: args,
                callback: function(r) {
                    responseText = r.message
                    if(responseText=="success")
                    {
                        if(args["checkers"].length >= 2 )
                            frappe.msgprint("The update has been submitted but will only appear when approval is complete.");
                        else
                        {
                            //frm.add_child(grid_name, args);
                            //frm.refresh_field(grid_name);
                            //frm.refresh();
                            add_grids(frm);
                        }
                    }
                }
            });
            d.hide();
        }
    });
    d.show();
}

function grid_addrow_select(frm, add_title, add_field, add_doctype, add_filter_function, add_args, add_function, grid_name)
{
        //console.log("HELLO 1.1: "+ frm);
        let d = new frappe.ui.Dialog({
        title: add_title,
        fields: [
            {
                label: 'Select Record',
                fieldname: add_field,
                fieldtype: 'Link',
                options: add_doctype,
                get_query() {
                    return {
                        query: add_filter_function,
                        txt: d[add_field]
                    };
                  }
            }
        ],
        size: 'small', // small, large, extra-large
        primary_action_label: 'Save',
        primary_action(values) {
            args = JSON.parse(add_args);
            for (let x in args) {
               if(args[x].startsWith("values."))
               {
                    doc_field = args[x].replace("values.", "");
                    args[x] = values[doc_field];
               }
               else if(args[x].startsWith("frm.doc."))
               {
                    doc_field = args[x].replace("frm.doc.", "");
                    args[x] = frm.doc[doc_field];
               }
               else if(args[x].startsWith("THIS_FORM"))
               {
                    //doc_field = args[x].replace("frm.doc.", "");
                    args[x] = values;
               }
            }
            console.log(args);
            frappe.call({
                method: add_function,
                args: args,
                callback: function(r) {
                    responseText = r.message
                    if(responseText=="success")
                    {
                        frm.add_child(grid_name, args);
                        frm.refresh_field(grid_name);
                    }
                }
            });
            d.hide();
        }
    });
    d.show();
}

function save_grid_form(frm)
{
    console.log(frm.doc);
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


