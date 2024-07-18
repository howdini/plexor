country_gl = "";
frappe.ui.form.on("Addresses", {
        onload: function(frm,cdt,cdn) {
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
                 else if((evt.keyCode > 47 && evt.keyCode < 58)   || // number keys
                        evt.keyCode == 32 || evt.keyCode == 13   || // spacebar & return key(s) (if you want to allow carriage returns)
                        (evt.keyCode > 64 && evt.keyCode < 91)   || // letter keys
                        (evt.keyCode > 95 && evt.keyCode < 112)  || // numpad keys
                        (evt.keyCode > 185 && evt.keyCode < 193) || // ;=,-./` (in order)
                        (evt.keyCode > 218 && evt.keyCode < 223))
                    country_gl = country_gl+evt.key;
            });
        },
        "country": function(frm)
        {
            country_gl = cur_frm.doc.country;
        }
});
