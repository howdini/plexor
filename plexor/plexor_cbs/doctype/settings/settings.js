doctypeName = "Settings";

frappe.ui.form.on("Settings", {
         refresh: function(frm) {
                 frm.disable_save();

                frm.add_custom_button('Trigger Generator <div style=\"font-size: 50%;\"><b>plexor</b></div>', () => {
                    frappe.prompt('Doctype Name', ({ value }) => {
                        frappe.call({
                        method: "plexor.plexlib_web.getTrigger",
                        args: {doctype: value},
                        callback: function(r) {
                            responseText = r.message
                            frappe.msgprint('Run the following script from a script file e.g.<br><b>mysql -u root -p***** plexorCBS < plex.sql --verbose && mysql -u root -p***** plexorCBS_MC < plex.sql --verbose</b><br><textarea name="Text1" cols="80" rows="80" style="font-size:9px;">'+responseText+'</textarea>');
                        }
                        });
                    });
                }).removeClass('btn-default').addClass('btn-primary').css({'color':'white','font-weight': 'normal'});
         },
         before_discard: function(frm) {
            frappe.throw("OVERRIDING DELETION FUNCTION");
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
                                            options: 'GENERAL\nSECURITY\nSAVINGS\nLOANS\nMCHECKER'
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
                                            label: 'Value 2',
                                            fieldname: 'value2',
                                            fieldtype: 'Data'
                                        },
                                        {
                                            label: 'Value 3',
                                            fieldname: 'value3',
                                            fieldtype: 'Data'
                                        },
                                        {
                                            label: 'Active',
                                            fieldname: 'status',
                                            fieldtype: 'Check'
                                        },
                                        {
                                            label: 'child_id',
                                            read_only: 1,
                                            hidden: 1,
                                            fieldname: 'child_id',
                                            fieldtype: 'Data'
                                        }
                                    ];


            delete frm.doc.general_grid;
            delete frm.doc.security_grid;
            delete frm.doc.deposits_grid;
            delete frm.doc.loans_grid;
            delete frm.doc.maker_checker_grid;
            setup_grid(     frm,
                            'general_grid',
                            JSON.stringify({parent_value: "Default Settings", parent_field: "", conds: " type='GENERAL'", child_doctype_name: "plexSettingValue"}),
                            'Enter setting and value',
                             add_filter_function,
                             JSON.stringify({doctype: "plexSettingValue", name:  "values.child_id", type:  "values.type", setting: "values.setting", codename: "values.codename", value: "values.value", status: "values.status"}),
                             add_grids,
                            actions="ADD|DEL|UPD"
                            );
            setup_grid(     frm,
                            'security_grid',
                            JSON.stringify({parent_value: "Default Settings", parent_field: "", conds: " type='SECURITY'", child_doctype_name: "plexSettingValue"}),
                            'Enter security setting amd value',
                            add_filter_function,
                            JSON.stringify({doctype: "plexSettingValue", name:  "values.child_id", type:  "values.type", setting: "values.setting", codename: "values.codename", value: "values.value", status: "values.status"}),
                            add_grids,
                            actions="ADD|DEL|UPD"
                            );

            setup_grid(     frm,
                            'maker_checker_grid',
                            JSON.stringify({parent_value: "Default Settings", parent_field: "", conds: " type='MCHECKER'", child_doctype_name: "plexSettingValue"}),
                            'Enter verification setting amd value',
                            add_filter_function,
                            JSON.stringify({doctype: "plexSettingValue", name:  "values.child_id", type:  "values.type", setting: "values.setting", codename: "values.codename", value: "values.value", value2: "values.value2", value3: "values.value3", status: "values.status"}),
                            add_grids,
                            actions="ADD|DEL|UPD"
                            );
            document.getElementsByClassName('indicator-pill')[0].remove();
}



