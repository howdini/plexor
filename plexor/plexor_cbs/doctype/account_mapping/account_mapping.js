// Copyright (c) 2024, Borealis Systems and contributors
// For license information, please see license.txt

// frappe.ui.form.on("Account Mapping", {
// 	refresh(frm) {

// 	},
// });
frappe.ui.form.on("Account Mapping", {

         refresh: function(frm) {
                frm.disable_save();
                frm.add_custom_button('Submit', () => {
                    plexSave(frm,"Account Mapping");
                }).removeClass('btn-default').addClass('btn-primary').css({'color':'white','font-weight': 'normal'});
         }
});