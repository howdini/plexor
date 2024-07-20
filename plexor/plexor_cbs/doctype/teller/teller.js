user_gl = "";
branch_gl = "";
debit_account_gl = "";
credit_account_gl = "";

frappe.ui.form.on("Teller", {

        onload: function(frm,cdt,cdn) {
            user_gl = "";
            branch_gl = "";
            debit_account_gl = "";
            credit_account_gl = "";
            var p = frm.doc;
            frm.set_query("user", function()
            {
                return {
                    query: "plexor.plexlib_web.get_users",
                    page_length: 1000,
                    txt: user_gl,
                    searchfield: "user",
                    filters: {"name":p.user}
                };
            });
            frm.set_query("branch", function()
            {
                return {
                    query: "plexor.plexlib_web.get_branches",
                    page_length: 1000,
                    txt: branch_gl,
                    searchfield: "branch",
                    filters: {"name":p.branch}
                };
            });
            frm.set_query("debit_account", function()
            {
                return {
                    query: "plexor.plexlib_web.get_debit_account",
                    page_length: 1000,
                    txt: debit_account_gl,
                    searchfield: "debit_account",
                    filters: {"name":p.debit_account}
                };
            });
            frm.set_query("credit_account", function()
            {
                return {
                    query: "plexor.plexlib_web.get_credit_account",
                    page_length: 1000,
                    txt: credit_account_gl,
                    searchfield: "credit_account",
                    filters: {"name":p.credit_account}
                };
            });
        },
        onload_post_render: function(frm) {
            cur_frm.fields_dict.user.$input.on("keydown", function(evt){
                 if(evt.key == "Backspace")
                 {
                    user_gl = user_gl.substring(0, user_gl.length-1);
                 }
                 else if(is_printerble_key(evt))
                    user_gl = user_gl+evt.key;
            });
            cur_frm.fields_dict.branch.$input.on("keydown", function(evt){
                 if(evt.key == "Backspace")
                 {
                    branch_gl = branch_gl.substring(0, branch_gl.length-1);
                 }
                 else if(is_printerble_key(evt))
                    branch_gl = branch_gl+evt.key;
            });
            cur_frm.fields_dict.debit_account.$input.on("keydown", function(evt){
                 if(evt.key == "Backspace")
                 {
                    debit_account_gl = debit_account_gl.substring(0, debit_account_gl.length-1);
                 }
                 else if(is_printerble_key(evt))
                    debit_account_gl = debit_account_gl+evt.key;
            });
            cur_frm.fields_dict.credit_account.$input.on("keydown", function(evt){
                 if(evt.key == "Backspace")
                 {
                    credit_account_gl = credit_account.substring(0, credit_account_gl.length-1);
                 }
                 else if(is_printerble_key(evt))
                    credit_account_gl = credit_account_gl+evt.key;
            });
        },
        "user": function(frm)
        {
            user_gl = cur_frm.doc.user;
        },
        "branch": function(frm)
        {
            branch_gl = cur_frm.doc.branch;
        },
        "debit_account": function(frm)
        {
            debit_account_gl = cur_frm.doc.debit_account;
        },
        "credit_account": function(frm)
        {
            credit_account_gl = cur_frm.doc.credit_account;
        }
});