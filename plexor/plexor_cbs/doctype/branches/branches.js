address_gl = "";

frappe.ui.form.on("Branches", {
        onload: function(frm,cdt,cdn) {
            address_gl = "";
            var p = frm.doc;
            frm.set_query("address", function()
            {
                return {
                    query: "plexor.plexlib_web.get_addresses",
                    page_length: 1000,
                    txt: address_gl,
                    searchfield: "address",
                    filters: {"name":p.address}
                };
            });
        },
        onload_post_render: function(frm) {
            cur_frm.fields_dict.address.$input.on("keydown", function(evt){
                 if(evt.key == "Backspace")
                 {
                    address_gl = address_gl.substring(0, address_gl.length-1);
                 }
                 else if(is_printerble_key(evt))
                    address_gl = address_gl+evt.key;
            });
        },
        "address": function(frm)
        {
            address_gl = cur_frm.doc.address;
        }
});