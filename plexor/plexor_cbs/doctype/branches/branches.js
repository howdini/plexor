frappe.ui.form.on("Branches", "onload", function(frm) {
    frm.set_query("address", function() {
    return {
            query: "plexor.plexlib_web.get_addresses"
        };
    });
});