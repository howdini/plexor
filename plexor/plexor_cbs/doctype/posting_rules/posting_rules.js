frappe.ui.form.on("Posting Rules", {

         refresh: function(frm) {
                frm.disable_save();
                frm.add_custom_button('Save', () => {
                    plexSave(frm,"Posting Rules");
                }).removeClass('btn-default').addClass('btn-primary').css({'color':'white','font-weight': 'normal'});
         },
        onload: function(frm) {

//setup_grid(frm, grid_name, load_function, load_args, add_title, add_doctype, add_filter_function, add_field, add_function, add_args, delete_function, delete_args )
        row = frm;
            setup_grid(frm, 'debit_accounts',
                            "plexor.plexlib_web.get_posting_rule", JSON.stringify({postingRule: "frm.doc.name", type: 'Debit'}),
                             'Enter Account To Debit', 'Account Mapping', "plexor.plexlib_web.get_credit_account",
                              "name", "plexor.plexlib_web.save_posting_rule", JSON.stringify({postingRule: "frm.doc.name", type: 'Debit',account: "values.name"}),
                            "plexor.plexlib_web.delete_posting_rule", JSON.stringify({postingRule: "frm.doc.name", type: 'Debit',account: "row.doc.account"}));
            setup_grid(frm, 'credit_accounts',
                            "plexor.plexlib_web.get_posting_rule", JSON.stringify({postingRule: "frm.doc.name", type: 'Credit'}),
                             'Enter Account To Credit', 'Account Mapping', "plexor.plexlib_web.get_credit_account",
                            "name", "plexor.plexlib_web.save_posting_rule", JSON.stringify({postingRule: "frm.doc.name", type: 'Credit',account: "values.name"}),
                            "plexor.plexlib_web.delete_posting_rule", JSON.stringify({postingRule: "frm.doc.name", type: 'Credit',account: "row.doc.account"}));



        }
});
