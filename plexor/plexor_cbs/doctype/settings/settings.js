doctypeName = "Settings";

frappe.ui.form.on("Settings", {
         refresh: function(frm) {
                frm.disable_save();
                frm.add_custom_button('Save <div style=\"font-size: 50%;\"><b>plexor</b></div>', () => {
                    delete frm.doc.credit_accounts;
                    delete frm.doc.debit_accounts;
                    plexSave(frm,"Posting Rules");
                }).removeClass('btn-default').addClass('btn-primary').css({'color':'white','font-weight': 'normal'});

                frm.add_custom_button('Trigger Generator <div style=\"font-size: 50%;\"><b>plexor</b></div>', () => {
                    frappe.prompt('Doctype Name', ({ value }) => {
                        frappe.call({
                        method: "plexor.plexlib_web.getTrigger",
                        args: {doctype: value},
                        callback: function(r) {
                            responseText = r.message
                            //frappe.msgprint(responseText);
                            frappe.msgprint('Run the following script from a script file e.g.<br><b>mysql -u root -p***** plexorCBS < plex.sql --verbose && mysql -u root -p***** plexorCBS_MC < plex.sql --verbose</b><br><textarea name="Text1" cols="80" rows="80" style="font-size:9px;">'+responseText+'</textarea>');
                        }
                        });
                    });
                }).removeClass('btn-default').addClass('btn-primary').css({'color':'white','font-weight': 'normal'});
         },
        onload: function(frm) {
            add_grids(frm);
        },
        after_save: function(frm) {
            add_grids(frm);
        }
});



function add_grids(frm)
{
            row = frm;
            add_filter_function = [
                                        {
                                            label: 'Category',
                                            fieldname: 'type',
                                            fieldtype: 'Select',
                                            options: 'GENERAL\nSECURITY\nSAVINGS\nLOANS\nMCHECKER',
                                        },
                                        {
                                            label: 'Title',
                                            fieldname: 'setting',
                                            fieldtype: 'Data'
                                        },
                                        {
                                            label: 'Codename',
                                            fieldname: 'codename',
                                            fieldtype: 'Data'
                                        },
                                        {
                                            label: 'Value',
                                            fieldname: 'value',
                                            fieldtype: 'Data'
                                        },
                                        {
                                            label: 'Active',
                                            fieldname: 'status',
                                            fieldtype: 'Check'
                                        }
                                    ];
            setup_grid(frm, 'general_grid',
                            "plexor.plexlib_web.get_type_settings", JSON.stringify({type: 'GENERAL'}),
                             "Enter New Setting And Value", "CUSTOM_FORM", add_filter_function,
                             "name", "plexor.plexlib_web.save_type_settings", JSON.stringify({type:  "values.type", setting: "values.setting", codename: "values.codename", value: "values.value", status: "values.status"}),
                             "plexor.plexlib_web.delete_type_settings", JSON.stringify({codename: "row.doc.codename"}));

            setup_grid(frm, 'security_grid',
                            "plexor.plexlib_web.get_type_settings", JSON.stringify({type: 'SECURITY'}),
                             "Enter New Setting And Value", "CUSTOM_FORM", add_filter_function,
                             "name", "plexor.plexlib_web.save_type_settings", JSON.stringify({type:  "values.type", setting: "values.setting", codename: "values.codename", value: "values.value", status: "values.status"}),
                             "plexor.plexlib_web.delete_type_settings", JSON.stringify({codename: "row.doc.codename"}));

            setup_grid(frm, 'deposits_grid',
                            "plexor.plexlib_web.get_type_settings", JSON.stringify({type: 'SAVINGS'}),
                             "Enter New Setting And Value", "CUSTOM_FORM", add_filter_function,
                             "name", "plexor.plexlib_web.save_type_settings", JSON.stringify({type:  "values.type", setting: "values.setting", codename: "values.codename", value: "values.value", status: "values.status"}),
                             "plexor.plexlib_web.delete_type_settings", JSON.stringify({codename: "row.doc.codename"}));

            setup_grid(frm, 'loans_grid',
                            "plexor.plexlib_web.get_type_settings", JSON.stringify({type: 'LOANS'}),
                             "Enter New Setting And Value", "CUSTOM_FORM", add_filter_function,
                             "name", "plexor.plexlib_web.save_type_settings", JSON.stringify({type:  "values.type", setting: "values.setting", codename: "values.codename", value: "values.value", status: "values.status"}),
                             "plexor.plexlib_web.delete_type_settings", JSON.stringify({codename: "row.doc.codename"}));

            setup_grid(frm, 'maker_checker_grid',
                            "plexor.plexlib_web.get_type_settings", JSON.stringify({type: 'MCHECKER'}),
                             "Enter New Setting And Value", "CUSTOM_FORM", add_filter_function,
                             "name", "plexor.plexlib_web.save_type_settings", JSON.stringify({type:  "values.type", setting: "values.setting", codename: "values.codename", value: "values.value", status: "values.status"}),
                             "plexor.plexlib_web.delete_type_settings", JSON.stringify({codename: "row.doc.codename"}));
            document.getElementsByClassName('indicator-pill')[0].remove();
}


frappe.ui.form.on("plexSettingValue", "status", function(frm, cdt, cdn) {
    //save_grid_form(frm);
});

