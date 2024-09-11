

frappe.ui.form.on("Posting Rules", {
         refresh: function(frm) {
                frm.disable_save();
                //document.getElementById('deleteButton').style.display = 'none';
                frm.add_custom_button('Save <div style=\"font-size: 50%;\"><b>plexor</b></div>', () => {
                    delete frm.doc.credit_accounts;
                    delete frm.doc.debit_accounts;
                    plexSave(frm);
                }).removeClass('btn-default').addClass('btn-primary').css({'color':'white','font-weight': 'normal'});
                frm.add_custom_button('Delete <div style=\"font-size: 50%;\"><b>plexor</b></div>', () => {
                    prepare_delete(frm, children="Posting Rules Accounts", children_fields="postingRule");
                }).removeClass('btn-default').addClass('btn-primary').css({'color':'white','font-weight': 'normal'});
                frm.add_custom_button('Messages <div style=\"font-size: 50%;\"><b>plexor</b></div>', () => {
                        dialog = new frappe.ui.Dialog({
                                        title: __('Plexor Notifications'),
                                          fields: [
                                              {"fieldtype": "HTML" , "fieldname": "Message" , "label": "Message", "options": "<iframe id=\"dialog_id\" name=\"dialog_id\" width=\"100%\" height=\"650px\" src=\"/api/method/plexor.plexlib_web.show_inbox?type=0&page=0\"></iframe>"},
                                            ],
                                      });
                                dialog.show()
                                dialog.$wrapper.find('.modal-dialog').css("max-width", "90%");
                                dialog.$wrapper.find('.modal-dialog').css("width", "90%");

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
                                            label: 'Select Account',
                                            fieldname: 'name',
                                            fieldtype: 'Link',
                                            options: "Account Mapping",
                                            get_query() {
                                                return {
                                                    query: "plexor.plexlib_web.get_credit_account",
                                                    txt: self["name"]
                                                };
                                              }
                                        }
                                    ];
            delete frm.doc.credit_accounts;
            delete frm.doc.debit_accounts;

            setup_grid(     frm,
                            'debit_accounts',
                            JSON.stringify({parent_value: "frm.doc.name", parent_field: "postingRule", conds: " type='Debit'", child_doctype_name: "PostingRulesAccounts"}),
                            'Enter Account To Debit',
                             add_filter_function,
                             JSON.stringify({doctype: "PostingRulesAccounts", postingRule: "frm.doc.name", type: 'Debit',account: "values.name"}),
                             add_grids
                            );
            setup_grid(     frm,
                            'credit_accounts',
                            JSON.stringify({parent_value: "frm.doc.name", parent_field: "postingRule", conds: " type='Credit'", child_doctype_name: "PostingRulesAccounts"}),
                            'Enter Account To Credit',
                            add_filter_function,
                            JSON.stringify({doctype: "PostingRulesAccounts", postingRule: "frm.doc.name", type: 'Credit',account: "values.name"}),
                            add_grids
                            );
            document.getElementsByClassName('indicator-pill')[0].remove();
}
