
doctypeName = "User Roles";

frappe.ui.form.on(doctypeName, {

         refresh: function(frm) {
                frm.disable_save();
                frm.add_custom_button('Submit', () => {
                    plexSave(frm,doctypeName);
                }).removeClass('btn-default').addClass('btn-primary').css({'color':'white','font-weight': 'normal'});
         },
        onload: function(frm) {
            row = frm;
            add_filter_function = [
                                        {
                                            label: 'Select Permission',
                                            fieldname: 'name',
                                            fieldtype: 'Link',
                                            options: "Permissions",
                                            get_query() {
                                                return {
                                                    query: "plexor.plexlib_web.get_permissions",
                                                    txt: self["name"]
                                                };
                                              }
                                        }
                                    ];

            setup_grid(frm, 'permissions',
                            "plexor.plexlib_web.get_role_permission", JSON.stringify({role: "frm.doc.name"}),
                             'Enter Role Permission', 'CUSTOM_FORM', add_filter_function,
                              "name", "plexor.plexlib_web.save_role_permission", JSON.stringify({doc: "THIS_FORM", postingRule: "frm.doc.name",permission: "values.name"}),
                            "plexor.plexlib_web.delete_role_permission", JSON.stringify({role: "frm.doc.name", permission: "row.doc.account"}));
            document.getElementsByClassName('indicator-pill')[0].remove();
        }
});
