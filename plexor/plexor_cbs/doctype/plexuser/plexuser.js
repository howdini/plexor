address_gl = "";

frappe.ui.form.on("plexUser", {
        refresh: function(frm) {
            frm.disable_save();
            frm.add_custom_button('Save <div style=\"font-size: 50%;\"><b>plexor</b></div>', () => {
                plexSave(frm);
            }).removeClass('btn-default').addClass('btn-primary').css({'color':'white','font-weight': 'normal'});
        },
        onload: function(frm,cdt,cdn) {
            address_gl = "";
            var p = frm.doc;
            frm.set_query("role", function()
            {
                return {
                    query: "plexor.plexlib_web.get_list",
                    page_length: 1000,
                    txt: address_gl,
                    //searchfield: "address",
                    //filters: {"name":p.role}
                };
            });
        },
        onload_post_render: function(frm) {
            cur_frm.fields_dict.role.$input.on("keydown", function(evt){
                 if(evt.key == "Backspace")
                 {
                    address_gl = address_gl.substring(0, address_gl.length-1);
                 }
                 else if(is_printerble_key(evt))
                    address_gl = address_gl+evt.key;
            });
        },
        "role": function(frm)
        {
            address_gl = cur_frm.doc.role;
        }
});
