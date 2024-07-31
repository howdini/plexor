frappe.ui.form.on("Settings", {

         refresh: function(frm) {
                frm.disable_save();
                frm.add_custom_button('Save', () => {
                    plexSave(frm);
                }).removeClass('btn-default').addClass('btn-primary').css({'color':'white','font-weight': 'normal'});
         },
        onload: function(frm) {

//      setup_grid(frm, grid_name,
//                    load_function, load_args,
//                    add_title, add_doctype, add_filter_function,
//                    add_field, add_function, add_args,
//                    delete_function, delete_args )
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
        }
});


frappe.ui.form.on("plexSettingValue", "status", function(frm, cdt, cdn) {
    save_grid_form(frm);
});

