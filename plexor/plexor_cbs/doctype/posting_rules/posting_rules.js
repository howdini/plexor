

frappe.ui.form.on("Posting Rules", {
         refresh: function(frm) {
                frm.disable_save();
                frm.add_custom_button('Save <div style=\"font-size: 50%;\"><b>plexor</b></div>', () => {
                    delete frm.doc.credit_accounts;
                    delete frm.doc.debit_accounts;
                    plexSave(frm,"Posting Rules");
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
            setup_grid(frm, 'debit_accounts',
                            "plexor.plexlib_web.get_posting_rule", JSON.stringify({postingRule: "frm.doc.name", type: 'Debit'}),
                             'Enter Account To Debit', 'CUSTOM_FORM', add_filter_function,
                              "name", "plexor.plexlib_web.save_posting_rule", JSON.stringify({doc: "THIS_FORM", postingRule: "frm.doc.name", type: 'Debit',account: "values.name"}),
                            "plexor.plexlib_web.delete_posting_rule", JSON.stringify({postingRule: "frm.doc.name", type: 'Debit', account: "row.doc.account"}));
            setup_grid(frm, 'credit_accounts',
                            "plexor.plexlib_web.get_posting_rule", JSON.stringify({postingRule: "frm.doc.name", type: 'Credit'}),
                             'Enter Account To Credit', 'CUSTOM_FORM', add_filter_function,
                            "name", "plexor.plexlib_web.save_posting_rule", JSON.stringify({doc: "THIS_FORM", postingRule: "frm.doc.name", type: 'Credit',account: "values.name"}),
                            "plexor.plexlib_web.delete_posting_rule", JSON.stringify({postingRule: "frm.doc.name", type: 'Credit', account: "row.doc.account"}));
            document.getElementsByClassName('indicator-pill')[0].remove();
}
