debit_gl = "";
credit_gl = "";

frappe.ui.form.on("Posting Rules", {
        refresh: function(frm) {
            frm.set_df_property('debit_accounts', 'cannot_add_rows', true);
            frm.set_df_property('credit_accounts', 'cannot_add_rows', true);
            frm.set_df_property('debit_accounts', 'cannot_delete_rows', true);
            frm.set_df_property('credit_accounts', 'cannot_delete_rows', true);
            //frm.saving = false;




//=====================================LOADING GRIDS===================================================
            //Load debit accounts
             frappe.call({
                            method: "plexor.plexlib_web.get_posting_rule",
                            args: {
                                    postingRule: frm.doc.name, type: 'Debit',
                                },
                            callback: function(r) {
                                responseText = r.message
                                let items = responseText
                                items.forEach(item=>{
                                    frm.add_child('debit_accounts', item);
                                })
                                frm.refresh_field('debit_accounts');
                            }
                        });

            //load credit accounts
             frappe.call({
                            method: "plexor.plexlib_web.get_posting_rule",
                            args: {
                                    postingRule: frm.doc.name, type: 'Credit',
                                },
                            callback: function(r) {
                                responseText = r.message
                                let items = responseText
                                items.forEach(item=>{
                                    frm.add_child('credit_accounts', item);
                                })
                                frm.refresh_field('credit_accounts');
                            }
                        });


//=====================================DELETING GRID ROWS===================================================

            frm.fields_dict["debit_accounts"].grid.add_custom_button(__('Delete'),
                function() {
                var grid = frm.fields_dict["debit_accounts"].grid.grid_rows;

                grid.forEach(function(row) {
                    if (row && row.wrapper.find('.grid-row-check').is(':checked')) {
                        var docname = row.doc.name;
                        console.log(row.doc.accoount);
                        frappe.call({
                            method: "plexor.plexlib_web.delete_posting_rule",
                            args: {
                                    postingRule: frm.doc.name, type: 'Debit',account: row.doc.accoount,
                                },
                            callback: function(r) {
                                responseText = r.message
                                console.log("DELETE COMPLETE :"+responseText);
                                if(responseText=="success")
                                {
                                    row.remove();
                                    //frm.add_child('debit_accounts', {"postingRule":frm.doc.name,"type":"Debit","accoount":values.name,});
                                    frm.refresh_field('debit_accounts');
                                }
                            }
                        });
                    }
                });
            });


            frm.fields_dict["credit_accounts"].grid.add_custom_button(__('Delete'),
                function() {
                var grid = frm.fields_dict["credit_accounts"].grid.grid_rows;

                grid.forEach(function(row) {
                    if (row && row.wrapper.find('.grid-row-check').is(':checked')) {
                        var docname = row.doc.name;
                        console.log(row.doc.accoount);
                        frappe.call({
                            method: "plexor.plexlib_web.delete_posting_rule",
                            args: {
                                    postingRule: frm.doc.name, type: 'Credit',account: row.doc.accoount,
                                },
                            callback: function(r) {
                                responseText = r.message
                                console.log("DELETE COMPLETE :"+responseText);
                                if(responseText=="success")
                                {
                                    row.remove();
                                    //frm.add_child('debit_accounts', {"postingRule":frm.doc.name,"type":"Debit","accoount":values.name,});
                                    frm.refresh_field('credit_accounts');
                                }
                            }
                        });
                    }
                });
            });


//=====================================ADDING GRID ROWS===================================================

            frm.fields_dict["debit_accounts"].grid.add_custom_button(__('Add'),
                function() {
                    let d = new frappe.ui.Dialog({
                    title: 'Enter Account To Debit',
                    fields: [
                        {
                            label: 'Select Account',
                            fieldname: 'name',
                            fieldtype: 'Link',
                            options: 'Account Mapping',
                            get_query() {
                                return {
                                    query: "plexor.plexlib_web.get_credit_account",
                                    page_length: 1000,
                                    txt: d.name,
                                    searchfield: "accoount",
                                    filters: {"name":d.name},
                                };
                              }
                        }
                    ],
                    size: 'small', // small, large, extra-large
                    primary_action_label: 'Save',
                    primary_action(values) {
                        frappe.call({
                            method: "plexor.plexlib_web.save_posting_rule",
                            args: {
                                    postingRule: frm.doc.name, type: 'Debit',account: values.name,
                                },
                            callback: function(r) {
                                responseText = r.message
                                console.log("SAVE COMPLETE :"+responseText);
                                if(responseText=="success")
                                {
                                    frm.add_child('debit_accounts', {"postingRule":frm.doc.name,"type":"Debit","accoount":values.name,});
                                    frm.refresh_field('debit_accounts');
                                }
                            }
                        });
                        d.hide();
                    }
                });
                d.show();
            });
            frm.fields_dict["debit_accounts"].grid.grid_buttons.find('.btn-custom').removeClass('btn-default').addClass('btn-primary');


            frm.fields_dict["credit_accounts"].grid.add_custom_button(__('Add'),
                function() {
                    let d = new frappe.ui.Dialog({
                    title: 'Enter Account To Credit',
                    fields: [
                        {
                            label: 'Select Account',
                            fieldname: 'name',
                            fieldtype: 'Link',
                            options: 'Account Mapping',
                            get_query() {
                                return {
                                    query: "plexor.plexlib_web.get_credit_account",
                                    page_length: 1000,
                                    txt: d.name,
                                    searchfield: "accoount",
                                    filters: {"name":d.name},
                                };
                              }
                        }
                    ],
                    size: 'small', // small, large, extra-large
                    primary_action_label: 'Save',
                    primary_action(values) {
                        frappe.call({
                            method: "plexor.plexlib_web.save_posting_rule",
                            args: {
                                    postingRule: frm.doc.name, type: 'Credit',account: values.name,
                                },
                            callback: function(r) {
                                responseText = r.message
                                console.log("SAVE COMPLETE :"+responseText);
                                if(responseText=="success")
                                {
                                    frm.add_child('credit_accounts', {"postingRule":frm.doc.name,"type":"Credit","accoount":values.name,});
                                    frm.refresh_field('credit_accounts');
                                }
                            }
                        });
                        d.hide();
                    }
                });
                d.show();
            });
            frm.fields_dict["credit_accounts"].grid.grid_buttons.find('.btn-custom').removeClass('btn-default').addClass('btn-primary');


        }
});
