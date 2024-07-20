country_gl = "";
frappe.ui.form.on("Addresses", {
        onload: function(frm,cdt,cdn) {
            country_gl = "";
            var p = frm.doc;
            frm.set_query("country", function()
            {
                return {
                    query: "plexor.plexlib_web.get_countries",
                    page_length: 1000,
                    txt: country_gl,
                    searchfield: "country",
                    filters: {"name":p.country}
                };
            });
        },
        onload_post_render: function(frm) {
            cur_frm.fields_dict.country.$input.on("keydown", function(evt){
                 if(evt.key == "Backspace")
                 {
                    country_gl = country_gl.substring(0, country_gl.length-1);
                 }
                 else if(is_printerble_key(evt))
                    country_gl = country_gl+evt.key;
            });
        },
        "country": function(frm)
        {
            country_gl = cur_frm.doc.country;
        }
});
