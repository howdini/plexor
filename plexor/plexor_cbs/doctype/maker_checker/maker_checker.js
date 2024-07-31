frappe.ui.form.on("Maker-Checker", {

         refresh: function(frm) {
                frm.disable_save();
                frm.add_custom_button('Approve', () => {
                    plexSave(frm);
                }).removeClass('btn-default').addClass('btn-primary').css({'color':'white','font-weight': 'normal'});
                frm.add_custom_button('Reject', () => {
                        // MultiSelectDialog with custom query method
                        let query_args = {
                            //query:"plexor.plexlib_web.get_credit_account"
                        }

                        new frappe.ui.form.MultiSelectDialog({
                            doctype: "User",
                            target: this.frm,
                            setters: {
                                schedule_date: null,
                                status: null
                            },
                            add_filters_group: 0,
                            date_field: "creation",
                            child_fieldname: "name", // child table fieldname, whose records will be shown &amp; can be filtered
                            child_columns: ["name"],
                            columns: ["name"],
                            get_query() {
                                return query_args;
                            },
                            action(selections) {
                                console.log(selections);
                            }
                        });
                }).removeClass('btn-default').addClass('btn-primary').css({'color':'white','font-weight': 'normal'});
                frm.add_custom_button('Request Update', () => {
                    plexSave(frm);
                }).removeClass('btn-default').addClass('btn-primary').css({'color':'white','font-weight': 'normal'});
         },
 });
