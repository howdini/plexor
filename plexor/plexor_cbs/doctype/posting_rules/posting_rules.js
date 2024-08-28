

frappe.ui.form.on("Posting Rules", {
         refresh: function(frm) {
                frm.disable_save();
                //document.getElementById('deleteButton').style.display = 'none';
                frm.add_custom_button('Save <div style=\"font-size: 50%;\"><b>plexor</b></div>', () => {
                    delete frm.doc.credit_accounts;
                    delete frm.doc.debit_accounts;
                    plexSave(frm,"Posting Rules");
                }).removeClass('btn-default').addClass('btn-primary').css({'color':'white','font-weight': 'normal'});
                frm.add_custom_button('Delete <div style=\"font-size: 50%;\"><b>plexor</b></div>', () => {
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
                                            selectCheckersParentDelete(frm, JSON.parse(data), "Confirm Delete", "-", args, children="Posting Rules Accounts", children_fields="postingRule");
                                        }
                                    });
                                }
                                else  // No maker checker dialog required
                                {
                                    args["checkers"] = "";
                                        frappe.call({
                                            method: "plexor.plexlib_web.deleteDoc",
                                            args: {form: frm.doc},
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
                            "plexor.plexlib_web.get_child_row",
                            JSON.stringify({parent_value: "frm.doc.name", parent_field: "postingRule", conds: " type='Debit'", child_doctype_name: "PostingRulesAccounts"}),
                            'Enter Account To Debit',
                            'CUSTOM_FORM',
                             add_filter_function,
                             "name",
                             "plexor.plexlib_web.save_child_row",
                             JSON.stringify({doctype: "PostingRulesAccounts", postingRule: "frm.doc.name", type: 'Debit',account: "values.name"})
                            );
            setup_grid(     frm,
                            'credit_accounts',
                            "plexor.plexlib_web.get_child_row",
                            JSON.stringify({parent_value: "frm.doc.name", parent_field: "postingRule", conds: " type='Credit'", child_doctype_name: "PostingRulesAccounts"}),
                            'Enter Account To Credit',
                            'CUSTOM_FORM',
                            add_filter_function,
                            "name",
                            "plexor.plexlib_web.save_child_row",
                            JSON.stringify({doctype: "PostingRulesAccounts", postingRule: "frm.doc.name", type: 'Credit',account: "values.name"})
                            );
            document.getElementsByClassName('indicator-pill')[0].remove();
}
/*
            setup_grid(frm, 'debit_accounts',
                            "plexor.plexlib_web.get_child_row", JSON.stringify({parent: "frm.doc.name", conds: " type='Debit'", child_doctype_name: "PostingRulesAccounts"}),
                             'Enter Account To Debit', 'CUSTOM_FORM', add_filter_function,
                              "name", "plexor.plexlib_web.save_posting_rule", JSON.stringify({doc: "THIS_FORM", postingRule: "frm.doc.name", type: 'Debit',account: "values.name"}),
                            "plexor.plexlib_web.delete_child_row", JSON.stringify({ parent_value: "frm.doc.name", child_value: "row.doc.child_value"}));
            setup_grid(frm, 'credit_accounts',
                            "plexor.plexlib_web.get_child_row", JSON.stringify({parent: "frm.doc.name", conds: " type='Credit'", child_doctype_name: "PostingRulesAccounts"}),
                             'Enter Account To Credit', 'CUSTOM_FORM', add_filter_function,
                            "name", "plexor.plexlib_web.save_posting_rule", JSON.stringify({doc: "THIS_FORM", postingRule: "frm.doc.name", type: 'Credit',account: "values.name"}),
                            "plexor.plexlib_web.delete_child_row", JSON.stringify({ parent_value: "frm.doc.name", child_value: "row.doc.child_value"}));
            document.getElementsByClassName('indicator-pill')[0].remove();
            */