

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
                                            fieldname: 'account',
                                            fieldtype: 'Link',
                                            options: "Account Mapping",
                                            get_query() {
                                                return {
                                                    query: "plexor.plexlib_web.get_credit_account",
                                                    txt: self["mapper_name"]
                                                };
                                              }
                                        },
                                        {
                                            label: 'child_id',
                                            read_only: 1,
                                            hidden: 1,
                                            fieldname: 'child_id',
                                            fieldtype: 'Data'
                                            //options: "\nAllow\nDeny\nFFFow\nGeny",
                                            //default: "Allow"
                                            //onchange: function () {
                                            //    frappe.msgprint("I gotcha 1");
                                            //}
                                        }
                                    ];
            delete frm.doc.credit_accounts;
            delete frm.doc.debit_accounts;

            setup_grid(     frm,
                            'debit_accounts',
                            JSON.stringify({parent_value: "frm.doc.name", parent_field: "postingRule", conds: " type='Debit'", child_doctype_name: "PostingRulesAccounts"}),
                            'Enter Account To Debit',
                             add_filter_function,
                             JSON.stringify({doctype: "PostingRulesAccounts", postingRule: "frm.doc.name", type: 'Debit',account: "values.account"}),
                             add_grids
                            );
            setup_grid(     frm,
                            'credit_accounts',
                            JSON.stringify({parent_value: "frm.doc.name", parent_field: "postingRule", conds: " type='Credit'", child_doctype_name: "PostingRulesAccounts"}),
                            'Enter Account To Credit',
                            add_filter_function,
                            JSON.stringify({doctype: "PostingRulesAccounts", postingRule: "frm.doc.name", type: 'Credit',account: "values.account"}),
                            add_grids
                            );
            document.getElementsByClassName('indicator-pill')[0].remove();
}
