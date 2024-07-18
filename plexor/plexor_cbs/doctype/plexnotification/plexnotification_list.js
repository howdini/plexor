
frappe.listview_settings['plexNotification'] = {
add_fields: ['creation'],
hide_name_column: true,
colwidths: {"message": 905},
page_length: 10,
set_row_background: function(row) {
        //if (cint(row.sig_status)==0) return 'danger';
        if (cint(row.sig_status)==1)
            return 'danger';
        else
        {
            if (cint(row.read)==1)
                cont = true;
            else
            {
                if (cint(row.error_level)==1) return 'success';
                if (cint(row.error_level)==2) return 'info';
                if (cint(row.error_level)==3) return 'warning';
                if (cint(row.error_level)==4) return 'danger';
                if (cint(row.error_level)==5) return 'primary';
                if (cint(row.error_level)==6) return 'danger';
            }
        }
    }
}