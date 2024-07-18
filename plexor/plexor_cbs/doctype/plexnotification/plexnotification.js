// Copyright (c) 2024, Borealis Systems and contributors
// For license information, please see license.txt

// frappe.ui.form.on("plexNotification", {
// 	refresh(frm) {

// 	},
// });

 frappe.ui.form.on("plexNotification", {


 refresh: function(frm) {
        if(frm.doc.sig_status=="1")
        {
            frm.disable_save();
            frm.set_intro(__("<b>Direct database modification of this document has been detected."
            +"</b> <br>Record modification has been disabled pending admin action."), "red");

            if (frappe.user_roles.includes('System Manager')) {
                frm.add_custom_button(("Unlock Record"), () => {

                    frappe.call({
                        method: "plexor.plexlib_web.unlock_doc", //dotted path to server method
                        args: {
                                table:"notify_messages",
                                docname:frm.doc.name
                              },
                        callback: function(r) {
                            frm.reload_doc();
                        }
                    });

                    frappe.show_alert({
                        message:__('Record unlocked successfully'),
                        indicator:'green'
                    }, 5);
                }).addClass("btn-warning").css({'color':'white','background-color': 'red','font-weight': 'bold'});
            }
        }
    },

 before_save: function(frm) {
 //if(frm.doc.modified=="")
     frappe.call({
            method: "plexor.plexlib_web.getDocModified", //dotted path to server method
            args: {
                    table:"notify_messages",
                    docname:frm.doc.name
                  },
            callback: function(r) {
                if(r.message!=="BLANK")
                {
                    frm.doc.modified = r.message
                }
            }
        });

     frappe.call({
            method: "plexor.plexlib_web.getDocCreated", //dotted path to server method
            args: {
                    table:"notify_messages",
                    docname:frm.doc.name
                  },
            callback: function(r) {
                if(r.message!=="BLANK")
                {
                    frm.doc.creation = r.message
                }
            }
        });
     }



 });