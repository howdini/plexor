frappe.ui.form.on("User Roles", {

         refresh: function(frm) {
                frm.disable_save();
                frm.add_custom_button('Submit', () => {
                    delete frm.doc.permissions_grid;
                    plexSave(frm,doctypeName);
                }).removeClass('btn-default').addClass('btn-primary').css({'color':'white','font-weight': 'normal'});
                frm.add_custom_button('Delete <div style=\"font-size: 50%;\"><b>plexor</b></div>', () => {
                    prepare_delete(frm, children="Posting Rules Accounts", children_fields="postingRule");
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
                                            label: 'Select Permission',
                                            fieldname: 'permission',
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
            delete frm.doc.permissions_grid;

            setup_grid(     frm,
                            'permissions_grid',
                            JSON.stringify({parent_value: "frm.doc.name", parent_field: "role", conds: " 1=1", child_doctype_name: "UserRolesPermissions"}),
                            'Select Role Permission',
                             add_filter_function,
                             JSON.stringify({doctype: "UserRolesPermissions", role: "frm.doc.name",permission: "values.permission"}),
                             add_grids,							// ADD GRIDS FUNCTION CALLBACK
				             actions="ADD|DEL"
                            );
            document.getElementsByClassName('indicator-pill')[0].remove();
}
