import mysql.connector
from plexlib import mysql_connection, mysql_connection_MC, generate_sig, generate_sig2, get_current_datetime, create_trigger
from plex_crud import create_maker_checker, create_maker_checker_child, crud_get_record
import json
from time import time as _time, sleep as _sleep
from threading import Event
import frappe
import re
from werkzeug.wrappers import Response
from frappe.modules import load_doctype_module
#import plexor.plexor.plexor_cbs.doctype.posting_rules



@frappe.whitelist()
def getDocModified(table, docname):
    mydb = mysql_connection()
    cur = mydb.cursor(dictionary=True)
    #val = (self.name)
    sql = ("SELECT * FROM `"+table+"` where `name`='" + docname + "' limit 1")
    cur.execute(sql)
    rv = cur.fetchone()
    try:
        return rv["modified"]
    except:
        return "BLANK"

@frappe.whitelist()
def getDocCreated(table, docname):
    mydb = mysql_connection()
    cur = mydb.cursor(dictionary=True)
    sql = ("SELECT * FROM `"+table+"` where `name`='" + docname + "' limit 1")
    cur.execute(sql)
    rv = cur.fetchone()
    try:
        return rv["creation"]
    except:
        return "BLANK"

@frappe.whitelist()
def unlock_doc(table, docname):
        mydb = mysql_connection()
        cur = mydb.cursor(dictionary=True)
        sql = ("UPDATE `"+table+"` set sig_status=0 WHERE `name`='" + docname + "' limit 1")
        cur.execute(sql)
        mydb.commit()
        #frappe.msgprint("GOT "+docname)
        return "BLANK"


@frappe.whitelist()
def reg_user():
    mydb = mysql_connection()
    mycursor = mydb.cursor()
    sql = ("INSERT INTO `plexUser` (name, creation, modified, modified_by, owner, docstatus, idx,"
           + "user, status ,sig)"
           + "VALUES( '"+frappe.get_user().doc.name+"', now(), now(), '"+frappe.get_user().doc.name+"', '"+frappe.get_user().doc.name+"', 1, 1, '"
           + frappe.get_user().doc.name+"', 1, '-'  )")
    try:
        mycursor.execute(sql)
        mydb.commit()
    except:
        mydb.commit()

@frappe.whitelist()
def load_permissions():
    print("LOADING PERMISSIONS AND MAPPINGS ....")
    user = str(frappe.session.user)
    print(user)
    role = get_role(user)
    if(role=="FORBIDDEN"):
        print("None banking user...")
        return

    # PERMISSION ROLES
    mydb = mysql_connection()
    cur = mydb.cursor(dictionary=True)
    sql = (f"SELECT * FROM plexRolesPermissions where `role`='{role}' order by permission")
    print(sql)
    cur.execute(sql)
    rv = cur.fetchall()
    if cur.rowcount > 0:
        permission = ""
        try:
            for rec in rv:
                permission = permission + "{\"" + rec["permission"] + "\"},"
        except:
            frappe.throw("Access Forbidden")
        frappe.cache.set_value("setperms|"+frappe.session.user, permission);
    else:
        return "FORBIDDEN2"
    print(frappe.cache.get_value("setperms|"+frappe.session.user))

    # TABLE MAPPINGS
    sql = (f"SELECT * FROM plexTableMapping order by `doctype`")
    print(sql)
    cur.execute(sql)
    rv = cur.fetchall()
    if cur.rowcount > 0:
        doctype = ""
        try:
            for rec in rv:
                doctype = doctype + "\"" + rec["doctype_name"] + "\" : { \"doctype\" : \"" + rec["doctype"] + "\", \"table_name\" : \"" + rec["table_name"] + "\"},"
        except:
            frappe.throw("Access Forbidden")
        frappe.cache.set_value("TableMapping", "{"+doctype[:-1]+"}");
    else:
        return "FORBIDDEN2"
    print(frappe.cache.get_value("TableMapping"))

def get_role(user):
    mydb = mysql_connection()
    cur = mydb.cursor(dictionary=True)
    qry = "SELECT * FROM `plexUser` where `name`='" + str(user) + "' limit 1"
    sql = (qry)
    print(sql)
    cur.execute(sql)
    rv = cur.fetchone()
    try:
        return rv["role"]
    except:
        return "FORBIDDEN"


def get_max_pages(type):
    mydb = mysql_connection()
    cur = mydb.cursor(dictionary=True)
    my_dest_group = json.dumps(frappe.get_roles(frappe.session.user)).replace('[', '').replace(']', '')
    user = frappe.get_user().doc.email
    if (type == "0"):
        qry = "SELECT count(*) as cnt FROM `notify_messages` where (`dest_user`='" + user + "' OR dest_group IN (" + my_dest_group + "))"
    else:
        qry = "SELECT count(*) as cnt FROM `notify_messages` where msg_type = " + type + " and (`dest_user`='" + user + "' OR dest_group IN (" + my_dest_group + "))"
    print(qry)
    cur.execute(qry)
    rv = cur.fetchone()
    return rv["cnt"]/10

@frappe.whitelist()
def show_inbox(type, page):
    print("TYPE::: "+type+",   PAGE::: "+page)
    mydb = mysql_connection()
    cur = mydb.cursor(dictionary=True)
    offset = int(page) * 15
    max_page = get_max_pages(type)
    print("Max pages:: "+str(max_page))
    my_dest_group = json.dumps(frappe.get_roles(frappe.session.user)).replace('[', '').replace(']', '')
    user = frappe.get_user().doc.email
    if(type=="0"):
        qry = "SELECT * FROM `notify_messages` where (`dest_user`='" + user + "' OR dest_group IN (" + my_dest_group + ")) order by creation desc limit 10 offset " + str(offset)
    else:
        qry = "SELECT * FROM `notify_messages` where msg_type = "+type+" and (`dest_user`='" + user + "' OR dest_group IN (" + my_dest_group + ")) order by creation desc limit 10 offset "+str(offset)
    print(qry)
    cur.execute(qry)
    rv = cur.fetchall()
    msgs = ""
    msg_count = 10
    isFirst = True
    fillers = msg_count
    if cur.rowcount > 0:
        if cur.rowcount < msg_count:
            fillers = msg_count - cur.rowcount
        else:
            fillers = 0
        doctype = ""
        try:
            for rec in rv:
                dis = ">" if str(rec["read"])=="0" else " class=\"disabled\">"
                msgs = msgs + "<tr  onclick = \"init2('message_"+str(rec["name"])+"');\" id=\"row_"+str(rec["name"])+"\" " + dis + " <td>"+str(rec["creation"]).replace(" ","&nbsp;&nbsp;")[0:27]+" <td align='center'>"+inbox_type(rec["msg_type"])+" <td align='center'>"+inbox_error(rec["error_level"])+" <td>"+str(rec["message"])[0:50]+" ..."
                if(isFirst):
                    isFirst = False
                    msgs = msgs + ("<td rowspan='20' valign='top'>"
                                    "<div id=\"msg_id\">"
                                            "<div class=\"box\"> "
                                                    "<b>Created</b> : "+str(rec["creation"])+" <br>"
                                                    "<b>Recepients</b> : "+str(rec["dest_user"])+" <br>"
                                                    "<b>Type</b> : "+inbox_type(rec["msg_type"])+" <br>"
                                                    "<b>Error Level</b> : "+inbox_error(rec["error_level"])+" <br>"
                                            "</div>"
                                            "<div class=\"box2\">"
                                                    "<b>Message</b><br>"
                                                    " "+str(rec["message"])+"  "
                                                    "<br>&nbsp;<br>&nbsp;<br>&nbsp;<br>&nbsp;<br>&nbsp;"
                                            "</div> "
                                   "</div> ")

                message_id = ("<div class=\"box\"> "
                                                    "<b>Created</b> : "+str(rec["creation"])+" <br>"
                                                    "<b>Recepients</b> : "+str(rec["dest_user"])+" <br>"
                                                    "<b>Type</b> : "+inbox_type(rec["msg_type"])+" <br>"
                                                    "<b>Error Level</b> : "+inbox_error(rec["error_level"])+" <br>"
                                            "</div>"
                                            "<div class=\"box2\">"
                                                    "<b>Message</b><br>"
                                                    " "+str(rec["message"])+"  "
                                                    "<br>&nbsp;<br>&nbsp;<br>&nbsp;<br>&nbsp;<br>&nbsp;"
                                            "</div> ")
                msgs = msgs + "<input type='hidden' id=\"message_"+str(rec["name"])+"\" value='"+message_id+"'>"
        except:
            frappe.throw("Access Forbidden")
    else:
        msgs = msgs + ""

    for x in range(fillers):
        msgs = msgs + "<tr class=\"disabled\"> <td colspan=\"4\"> &nbsp"

    msgs = msgs + "<tr><td colspan=\"4\" valign=\"middle\"><a style=\"text-decoration:none\" href=\"#\" onclick=\"loadit(1, "+type+", "+page+");\"> <b>|< </a> &nbsp;&nbsp;&nbsp;<a style=\"text-decoration:none\" href=\"#\" onclick=\"loadit(2, "+type+", "+page+");\"> <b><  </a>&nbsp;&nbsp;&nbsp; <a style=\"text-decoration:none\" href=\"#\" onclick=\"loadit(3, "+type+", "+page+");\">  <b>>  </a>&nbsp;&nbsp;&nbsp; <a style=\"text-decoration:none\" href=\"#\" onclick=\"loadit(4, "+type+", "+str(round(max_page))+");\">  <b>>|  </a> &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; Page "+page+" of "+str(round(max_page))+"</tbody></table>"

    html = """
            
            <script>

                var busyi;

                function init()
                {
                  busyi = new busy_indicator(document.getElementById("busybox"),
                  document.querySelector("#busybox div"));
            
                  busyi.show();
                  setTimeout(finish, 500);
                }
                function finish()
                {
                  switch_page();
                  busyi.hide();
                }
                
                var curr_row = ""
                function init2( row )
                {
                  curr_row = row;
                  busyi = new busy_indicator(document.getElementById("busybox"),
                  document.querySelector("#busybox div"));
            
                  busyi.show();
                  setTimeout(finish2, 200);
                }
                function finish2()
                {
                   busyi.hide();
                   document.getElementById('msg_id').innerHTML=document.getElementById(curr_row).value;
                   set_to_read(curr_row);
                }
                
                function set_to_read(msg_id)
                {
                      var xhttp = new XMLHttpRequest();
                      xhttp.onreadystatechange = function() {
                        if (this.readyState == 4 && this.status == 200) {
                        console.log(msg_id);
                            document.getElementById(msg_id.replace("message_", "row_")).classList.add("disabled");
                        }
                      };
                      xhttp.open("GET", "/api/method/plexor.plexlib_web.set_to_read?msg_id="+msg_id, true);
                      xhttp.send();
                }
                
                "use strict";
                function busy_indicator(cntr_el, img_el, show_cb, hide_cb)
                {
                    this.el = {};
                    this.cb = {show: null, hide: null};
                    this.pos = {x: 0, y: 0};
                    this.show_class = "show";
                
                
                    this._set_prm.call(this.el, "cntr", cntr_el);
                    this.el.img = img_el;
                    if (show_cb != undefined)
                        this.cb.show = show_cb;
                    if (hide_cb != undefined)
                        this.cb.hide = hide_cb;
                
                    this.cnt = 0;
                }
                
                busy_indicator.prototype._set_prm = function (n, v)
                {
                    if (( v == undefined ) || ( v == null ))
                        throw("busy_indicator: " + n + " is not supplied");
                    this[n] = v;
                }
                
                busy_indicator.prototype.show = function ()
                {
                    var top, left;
                    var img_el;
                
                
                    this.cnt++;
                    if ( this.cnt > 1 )
                        return;
                
                    this.el.cntr.classList.add(this.show_class);
                
                    this.align();
                    
                    if (this.cb.show != undefined)
                        this.cb.show();
                }
                
                busy_indicator.prototype.align = function ()
                {
                    if (this.el.img == null)
                        return;
                    
                    this.pos = this.calc_pos();
                
                    this.el.img.style.top = this.pos.y + "px";
                    this.el.img.style.left = this.pos.x + "px";
                }
                
                busy_indicator.prototype.calc_pos = function ()
                {
                    var x, y;
                
                
                    x = this.el.cntr.clientWidth/2 - this.el.img.offsetWidth/2;
                    y = this.el.cntr.clientHeight/2 - this.el.img.offsetHeight/2;
                    
                    return {x: x, y: y};
                }
                
                busy_indicator.prototype.hide = function ()
                {
                    if ( this.cnt > 0 )
                        this.cnt--;
                    else
                        return;
                
                    if ( this.cnt )
                        return;
                
                    this.el.cntr.classList.remove(this.show_class);
                
                    if (this.cb.hide != undefined)
                        this.cb.hide();
                }
                
                var mcurr_page = 0;
                var mcurr_type = 0;
                var mdirection = 0;
                
                function loadit(direction, curr_type, curr_page)
                {
                    mcurr_page = curr_page;
                    mcurr_type = curr_type;
                    mdirection = direction;
                    init();
                }
                
                function switch_page()
                {
                    curr_page = mcurr_page;
                    curr_type = mcurr_type;
                    direction = mdirection;
                    if(direction==1)
                        curr_page = 0;
                    else if(direction==2)
                        curr_page = curr_page-1;
                    else if(direction==3)
                        curr_page = curr_page+1;
                    else if(direction==4)
                        curr_page = curr_page-1;
                    window.location.href = "/api/method/plexor.plexlib_web.show_inbox?type="+curr_type+"&page="+curr_page;
                }
            </script>
            
            <div id="busybox" class="fog_div">
                    <div></div>
            </div>

                <table id="tableId">
                  <thead>
                    <tr>
                      <th align='center'>Date
                      <th style="text-align: center;">Notification Type
                      <th style="text-align: center;">Error Level
                      <th>Message
                      <th style='width:40%;' align='center'>Details
                  </thead>
                  <tbody>"""
    response = Response(get_inbox_css() + html + msgs, content_type='text/html')
    response.status_code = 200
    return response
    #return get_inbox_css() + html + msgs

def inbox_type(type):
    if(type==1):
        return "<span class=\"w3-tag  w3-round-large w3-blue w3-center\" style=\"font-size:12px;padding:6px\"> Approval </span>"
    elif(type==2):
        return "<span class=\"w3-tag  w3-round-large w3-red w3-center\" style=\"font-size:12px;padding:6px\"> Security </span>"
    elif(type==3):
        return "<span class=\"w3-tag  w3-round-large w3-orange w3-center\" style=\"font-size:12px;padding:6px\"> General </span>"

def inbox_error(type):
    if(type==1):
        return "<span class=\"w3-tag  w3-round-large w3-green w3-center\" style=\"font-size:12px;padding:6px\">Success"
    elif(type==2):
        return "<span class=\"w3-tag  w3-round-large w3-gray w3-center\" style=\"font-size:12px;padding:6px\">Notification"
    elif(type==3):
        return "<span class=\"w3-tag  w3-round-large w3-pink w3-center\" style=\"font-size:12px;padding:6px\">Warning"
    elif(type==4):
        return "<span class=\"w3-tag  w3-round-large w3-red w3-center\" style=\"font-size:12px;padding:6px\">Critical"
    elif(type==5):
        return "<span class=\"w3-tag  w3-round-large w3-white w3-center\" style=\"font-size:12px;padding:6px\">Information"
    elif(type==6):
        return "<span class=\"w3-tag  w3-round-large w3-purple w3-center\" style=\"font-size:12px;padding:6px\">Important"

def get_inbox_css():
    return """
        <link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
        <style> @import url(https://fonts.googleapis.com/css?family=Open+Sans:400,600);
        
        
        body {
          height: 100%;
        }
        .box { 
            margin-top: 0rem; 
            margin-left: 0rem; 
            margin-right: 0rem; 
            width: 98%; 
            height: 20%; 
            padding: 1rem; 
            box-sizing: border-box; 
            border: 1px solid gray; 
            text-align: left; 
            color: white; 
        } 
  
        .box2 { 
            margin-top: 1rem; 
            margin-left: 0rem; 
            margin-right: 0rem; 
            width: 98%; 
            display: flex;
              flex-direction: column;
              min-height: 100%;
            border: 1px solid gray; 
            padding: 1rem; 
            text-align: left; 
            color: white; 
        } 
        
            
            *, *:before, *:after {
              margin: 0;
              padding: 0;
              box-sizing: border-box;
            }
            
            body {
              background: #105469;
              font-family: 'Open Sans', sans-serif;
            }
            table {
              background: #012B39;
              border-radius: 0.25em;
              border-collapse: collapse;
              margin: 1em;
              width: 100%;
            }
            th {
              border-bottom: 1px solid #364043;
              color: #E2B842;
              font-size: 0.85em;
              font-weight: 600;
              padding: 0.5em 1em;
              text-align: left;
            }
            td {
              color: #fff;
              font-weight: 400;
              font-size: 0.85em;
              padding: 0.65em 1em;
            }
            .disabled td {
              color: #4F5F64;
            }
            tbody tr {
              transition: background 0.25s ease;
            }
            tbody tr:hover {
              background: #014055;
            }
             
             
             
             #busybox {
                }
                
                #busybox div {
                        position: fixed;
                        width: 48px;
                        height: 48px;
                        border-radius: 50%;
                        border: 8px solid white;
                        border-left-color: transparent;
                        border-right-color: transparent;
                
                        animation: busybox_kf 1s linear 0s infinite normal none running;
                }
                
                @keyframes busybox_kf {
                        0% { transform: rotate(0deg); }
                        100% { transform: rotate(360deg); }
                }
                
                @-webkit-keyframes busybox_kf {
                        0% { transform: rotate(0deg); }
                        100% { transform: rotate(360deg); }
                }

                .fog_div {
                  display: none;
                  position: fixed;
                  top: 0px;
                  left: 0px;
                  height: 100%;
                  width: 100%;
                  z-index: 100;
                  background-color: rgba(30, 30, 30, 0.5);
                }
                #busybox.show {
                  display: block;
                }
        </style>
            
            """

@frappe.whitelist()
def set_to_read(msg_id):
    msg_id = msg_id.replace("message_", "")
    mydb2 = mysql_connection()
    cur2 = mydb2.cursor(dictionary=True)
    sql = ("UPDATE notify_messages set `read` = 1 WHERE `name`='" + msg_id + "' limit 1")
    cur2.execute(sql)
    mydb2.commit()

@frappe.whitelist()
def get_user_messages():
    user = frappe.get_user().doc.email
    init = False
    is_first =True
    last_msg_stamp = get_last()
    if last_msg_stamp == "1990-01-01 12:00:00":
        init = True

    my_dest_group = json.dumps(frappe.get_roles(frappe.session.user)).replace('[','').replace(']','')
    mydb2 = mysql_connection()
    cur2 = mydb2.cursor(dictionary=True)
    sql = ("SELECT * FROM notify_messages where (`dest_user`='" + user + "' OR dest_group IN ("+my_dest_group+")) and creation>\""+str(last_msg_stamp)+".9999\" order by creation desc limit 10")

    #msg_string = "1|1|0,0,0|Unknown error being experienced in the notification system<br>lst: "+str(last_msg_stamp)+"|||"
    msg_string = "BLANK"
    #frappe.msgprint(sql)
    cur2.execute(sql)
    rv2 = cur2.fetchall()
    #sleep(1)
    Event().wait(1.0)
    if cur2.rowcount > 0:
        inter = 1
        #frappe.msgprint("Found: "+str(cur2.rowcount))
    else:
        return "1|1|" + str(get_unread(1, my_dest_group)) + "," + str(get_unread(2, my_dest_group)) + "," + str(
            get_unread(3, my_dest_group)) + "|BLANK|||"
    try:
        for rec in rv2:
            if is_first==True:
                is_first = False
                last_msg_stamp = rec["creation"]
                msg_string = ""
            msg_string = msg_string + str(rec["msg_type"])+"|"+str(rec["error_level"])+"|"+str(get_unread(1,my_dest_group))+","+str(get_unread(2,my_dest_group))+","+str(get_unread(3,my_dest_group))+"|"+str(rec["message"])+"|"+str(rec["error_level"])+"|||"
            #frappe.msgprint(msg_string)
    except mysql.connector.Error as err:
        return "1|1|"+str(get_unread(1,my_dest_group))+","+str(get_unread(2,my_dest_group))+","+str(get_unread(3,my_dest_group))+"|Error occurred while getting notifications:<br> "+err.msg+"|||"
    set_last(last_msg_stamp, init)
    if(msg_string == "BLANK" or msg_string == "" ):
        return "1|1|" + str(get_unread(1, my_dest_group)) + "," + str(get_unread(2, my_dest_group)) + "," + str(
            get_unread(3, my_dest_group)) + "|BLANK|||"
    else:
        return msg_string

def get_last():
    mydb = mysql_connection()
    cur = mydb.cursor(dictionary=True)
    user = frappe.get_user().doc.email
    sql = ("SELECT * FROM notify_last_alert where `user`='" + user + "' order by last_msg_stamp desc limit 1")
    cur.execute(sql)
    rv = cur.fetchone()
    if cur.rowcount > 0:
        try:
            return str(rv["last_msg_stamp"])
        except:
            frappe.throw("Error getting last_msg_stamp")
    else:
        return "1990-01-01 12:00:00"

def set_last(last_msg_stamp, init):
    mydb = mysql_connection()
    mycursor = mydb.cursor(dictionary=True)
    if init == True:
        sql = ("INSERT INTO `notify_last_alert` (id, `user`, last_msg_stamp)"
               + "VALUES( NULL, '"+ frappe.get_user().doc.email + "', '" + str(last_msg_stamp) + "'  )")
    else:
        sql = ("UPDATE `notify_last_alert` SET last_msg_stamp = '" + str(last_msg_stamp) + "' WHERE `user` = '"+ frappe.get_user().doc.email + "'")
    #frappe.msgprint(sql)
    mycursor.execute(sql)
    mydb.commit()

def get_unread(msg_type,my_dest_group):
    mydb = mysql_connection()
    cur = mydb.cursor(dictionary=True)
    user = frappe.get_user().doc.email
    sql = ("SELECT count(*) as cnt FROM notify_messages where (`dest_user`='" + user + "' OR dest_group IN (" + my_dest_group + ")) and `read`=0 and msg_type="+str(msg_type))
    #print(sql)
    cur.execute(sql)
    rv2 = cur.fetchone()
    try:
        return rv2["cnt"]
    except mysql.connector.Error as err:
        return "0"
    return 0


@frappe.whitelist()
@frappe.validate_and_sanitize_search_inputs
def get_addresses(doctype, txt, searchfield, start, page_len, filters):
    print("GETTING ADDRESSES")
    mydb = mysql_connection()
    cur = mydb.cursor()
    sql = "SELECT `name` FROM `plexAddress` where `name` LIKE '%"+txt+"%' ORDER BY `name`"
    cur.execute(sql)
    rv = cur.fetchall()
    return rv


@frappe.whitelist()
@frappe.validate_and_sanitize_search_inputs
def get_countries(doctype, txt, searchfield, start, page_len, filters):
    print("GETTING COUNTRIES :"+json.dumps(frappe.local.form_dict))
    mydb = mysql_connection()
    cur = mydb.cursor()
    sql = "SELECT `name` FROM `plexCountry` where `name` LIKE '%"+txt+"%' ORDER BY `name`"
    cur.execute(sql)
    rv = cur.fetchall()
    return rv


@frappe.whitelist()
@frappe.validate_and_sanitize_search_inputs
def get_users(doctype, txt, searchfield, start, page_len, filters):
    print("GETTING COUNTRIES :"+json.dumps(frappe.local.form_dict))
    mydb = mysql_connection()
    cur = mydb.cursor()
    sql = "SELECT `name` FROM `plexUser` where `name` LIKE '%"+txt+"%' ORDER BY `name`"
    cur.execute(sql)
    rv = cur.fetchall()
    return rv

@frappe.whitelist()
def get_checkers(form,  type):
    data = json.loads(form)
    doctype = data["doctype"]
    parent = data["name"]
    # print(doctype)
    checker_count = required_checkers_count(doctype, type)
    if(checker_count == "-1"):
        f_checkers = get_required_checkers(doctype, type)
        sql = "SELECT `name` FROM `plexUser` where `name` != '" + frappe.session.user + "' and `name` in (\""+f_checkers.replace(",", "\",\"")+"\") ORDER BY `name`"
    else:
        sql = "SELECT `name` FROM `plexUser` where `name` != '"+frappe.session.user+"' ORDER BY `name`"


    print("GETTING USERS :"+json.dumps(frappe.local.form_dict))
    print(sql)
    mydb = mysql_connection()
    cur = mydb.cursor()
    cur.execute(sql)
    rv = cur.fetchall()
    rv.insert(0, checker_count)
    return rv

@frappe.whitelist()
@frappe.validate_and_sanitize_search_inputs
def get_branches(doctype, txt, searchfield, start, page_len, filters):
    print("GETTING COUNTRIES :"+json.dumps(frappe.local.form_dict))
    mydb = mysql_connection()
    cur = mydb.cursor()
    sql = "SELECT `name` FROM `plexBranch` where `name` LIKE '%"+txt+"%' ORDER BY `name`"
    cur.execute(sql)
    rv = cur.fetchall()
    return rv


@frappe.whitelist()
@frappe.validate_and_sanitize_search_inputs
def get_debit_account(doctype, txt, searchfield, start, page_len, filters):
    print("GETTING COUNTRIES :"+json.dumps(frappe.local.form_dict))
    mydb = mysql_connection()
    cur = mydb.cursor()
    sql = "SELECT `name` FROM `plexAccountMapping` where `name` LIKE '%"+txt+"%' ORDER BY `name`"
    cur.execute(sql)
    rv = cur.fetchall()
    return rv


@frappe.whitelist()
@frappe.validate_and_sanitize_search_inputs
def get_credit_account(doctype, txt, searchfield, start, page_len, filters):
    print("GETTING COUNTRIES :"+json.dumps(frappe.local.form_dict))
    mydb = mysql_connection()
    cur = mydb.cursor()
    sql = "SELECT `name` FROM `plexAccountMapping` where `name` LIKE '%"+txt+"%' ORDER BY `name`"
    print(sql)
    cur.execute(sql)
    rv = cur.fetchall()
    return rv

@frappe.whitelist()
@frappe.validate_and_sanitize_search_inputs
def get_permissions(doctype, txt, searchfield, start, page_len, filters):
    print("GETTING get_permissions :"+json.dumps(frappe.local.form_dict))
    mydb = mysql_connection()
    cur = mydb.cursor()
    sql = "SELECT `name` FROM `plexPermissions` where `name` LIKE '%"+txt+"%' ORDER BY `name`"
    cur.execute(sql)
    rv = cur.fetchall()
    return rv

def is_maker_checker(table, name):
    sql = "SELECT * FROM `"+table+"` WHERE `name`='"+name+"'"
    print(sql)
    mydb = mysql_connection()
    cur = mydb.cursor(dictionary=True)
    cur.execute(sql)
    rv = cur.fetchall()
    print("MAKER CHEKER FOUND RECORDS:  " + str(cur.rowcount))
    if (cur.rowcount > 0):
        return False
    else:
        return True

@frappe.whitelist()
def is_maker_checker_required(doctype, type):
    doctype = doctype.replace(" ","")
    sql = "SELECT * FROM `plexSetting` WHERE `type`='MCHECKER' AND `codename`=UPPER(CONCAT('"+doctype+"','_"+type+"')) and `value`='yes' and `status`=1"
    print(sql)
    mydb = mysql_connection()
    cur = mydb.cursor(dictionary=True)
    cur.execute(sql)
    rv = cur.fetchall()
    print("FOUND RECORDS:  "+ str(cur.rowcount))
    if(cur.rowcount>0):
        return True
    else:
        return False

@frappe.whitelist()
def get_required_checkers(doctype, type):
    doctype = doctype.replace(" ","")
    sql = "SELECT * FROM `plexSetting` WHERE `type`='MCHECKER' AND `codename`=UPPER(CONCAT('"+doctype+"','_"+type+"')) and `value`='yes' and `status`=1"
    print(sql)
    mydb = mysql_connection()
    cur = mydb.cursor(dictionary=True)
    cur.execute(sql)
    rv = cur.fetchone()
    print("FOUND RECORDS:  "+ str(cur.rowcount))
    if(cur.rowcount>0):
        return rv["value3"]
    else:
        frappe.throw("Error getting required checkers count")

@frappe.whitelist()
def required_checkers_count(doctype, type):
    doctype = doctype.replace(" ","")
    sql = "SELECT * FROM `plexSetting` WHERE `type`='MCHECKER' AND `codename`=UPPER(CONCAT('"+doctype+"','_"+type+"')) and `value`='yes' and `status`=1"
    print(sql)
    mydb = mysql_connection()
    cur = mydb.cursor(dictionary=True)
    cur.execute(sql)
    rv = cur.fetchone()
    print("FOUND RECORDS:  "+ str(cur.rowcount))
    if(cur.rowcount>0):
        return rv["value2"]
    else:
        frappe.throw("Error getting required checkers count")

@frappe.whitelist()
def check_parent_makerchecker_status(form,  type):
    #print("LOGGED")
    data = json.loads(form)
    doctype = data["doctype"]
    parent =  data["name"]
    #print(doctype)
    table = get_current_table(doctype)
    is_mc = is_maker_checker(table, parent)
    is_mc_req = is_maker_checker_required(doctype, type)
    try:
        if(is_mc==True and is_mc_req==True):
            return "is_mc|is_mc_req"
        elif(is_mc==True and is_mc_req==False):
            return "is_mc"
        elif(is_mc==False and is_mc_req==True):
            return "is_mc_req"
        elif(is_mc==False and is_mc_req==False):
            return False
        else:
            return False
    except Typerror:  # includes simplejson.decoder.JSONDecodeError
        print('Decoding JSON has failed')

def get_current_table(doctype):
    mappings = frappe.cache.get_value("TableMapping")
    print("TABLE MAPPINGS")
    print(mappings)
    # Parse the JSON string into a Python dictionary
    try:
        data = json.loads(mappings)
    except TypeError:  # includes simplejson.decoder.JSONDecodeError
        print('Error gettting session details. Login required.')
        load_permissions()
        data = json.loads(mappings)

    # Extract the username value for sammy
    table_name = data[doctype.replace(" ","")]["table_name"]
    print("FOUND TABLE::: "+table_name)
    return table_name

def get_doctype(doctype_name):
    mappings = frappe.cache.get_value("TableMapping")
    print(mappings)
    # Parse the JSON string into a Python dictionary
    data = json.loads(mappings)

    # Extract the username value for sammy
    doctype = data[doctype_name.replace(" ", "")]["doctype"]
    print("FOUND doctype::: " + doctype)
    return doctype

@frappe.whitelist()
def post_mc_transaction(docname):
    sql = "SELECT * FROM `plexMakerChecker` WHERE `name`='"+docname+"' "
    print(sql)
    mydb = mysql_connection()
    cur = mydb.cursor(dictionary=True)
    cur.execute(sql)
    rv = cur.fetchone()
    print("FOUND RECORDS:  " + str(cur.rowcount))
    table_name = get_tablename(rv["document"])
    document_id = rv["document_id"]
    if(rv["trx_type"]=="INSERT"):
        qry = "INSERT INTO plexorCBS.`"+table_name+"` (select * from plexorCBS_MC.`"+table_name+"` where `name` = '"+document_id+"')"
        print(qry)
        cur.execute(qry)
        mydb.commit()
        #post_table_data(table_name, document_id, str(rv["values"]))
        post_mc_transaction_children(document_id)
    elif (rv["trx_type"]=="UPDATE"):
        if(rv["parent"] is None or rv["parent"]==""):
            print("PARENT update detected")
            post_mc_transaction_update(document_id, table_name, str(rv["values"]), str(rv["modified"]), str(rv["modified_by"]))
        else:
            if(rv["child_trx_type"] == "INSERT"):
                print("CHILD Insert detected")
                table_name = get_tablename(rv["document"])
                post_table_data(table_name, rv["document_id"], str(rv["values"]), time=str(rv["creation"]), owner=str(rv["owner"]))
            elif (rv["child_trx_type"] == "DELETE"):
                print("CHILD Delete detected")
                table_name = get_tablename(rv["document"])
                qry = "DELETE FROM plexorCBS.`" + table_name + "` WHERE `name` = '" + rv["document_id"] + "' "
                print(qry)
                cur.execute(qry)
                mydb.commit()
            elif (rv["child_trx_type"] == "UPDATE"):
                print("CHILD Update detected")
                table_name = get_tablename(rv["document"])
                # Given JSON string
                json_string = rv["values"]

                # Parse the JSON string
                data = json.loads(json_string)

                # Extract the child element
                child = data["child"]

                # Format the key-value pairs with specified quotes
                result = ', '.join(f"`{key}`=\"{value}\"" for key, value in child.items())

                # Print the result
                print(result)
                sql = "UPDATE plexorCBS.`" + table_name + "` SET "+result+" WHERE `name`='" + rv["document_id"] + "' "
                print(sql)
                mydb = mysql_connection()
                cur = mydb.cursor(dictionary=True)
                cur.execute(sql)
                mydb.commit()
    elif (rv["trx_type"] == "DELETE"):
        print("DELETE PARENT logic!!!")
        # DELETE ChILDREN FIRST
        data = json.loads(rv["values"])
        child_tables = data["children_tables"].split(",")
        child_tables_fields = data["children_fields"].split(",")
        #frappe.throw("STOPPING HERE FOR NOW")
        x = 0
        for table_doctype in child_tables:
            delete_children(table_doctype, child_tables_fields[x], document_id)
            x = x + 1

        # DELETE PARENT
        mydb = mysql_connection()
        mycursor = mydb.cursor()
        sql = "DELETE FROM `" + get_doctypes_table(rv["document"], use_classname=True) + "` WHERE name = '" + document_id + "'"
        print("SQL::   " + sql)
        mycursor.execute(sql)
        mydb.commit()

    fcursor = mydb.cursor()
    qry2 = "UPDATE `plexMakerChecker` SET  posted_status=1, posted_result='ok' where `name` = '" + docname + "'"
    print(qry2)
    fcursor.execute(qry2)
    mydb.commit()

    qry3 = "INSERT INTO `plexMakerCheckerLogs` (SELECT * FROM `plexMakerChecker` where `name` = '" + docname + "')"
    print(qry3)
    fcursor.execute(qry3)
    mydb.commit()

    qry4 = "DELETE FROM `plexMakerChecker` where `name` = '" + docname + "'"
    print(qry4)
    fcursor.execute(qry4)
    mydb.commit()
    return "success"

def json_format_correction(json_String):
    # Replace single quotes with double quotes and ensure that the property names are quoted
    corrected_json_string = re.sub(r"(\w+)\s*:", r'"\1":', json_String)
    corrected_json_string = corrected_json_string.replace("'", '"')
    # Ensure the JSON string starts and ends with curly braces
    corrected_json_string = f'{{{corrected_json_string.strip("{}")}}}'
    vals = corrected_json_string
    print("json_format_correction :: " + vals)
    return vals

@frappe.whitelist()
def post_mc_transaction_update(document_id, table_name, vals, modified, modified_by):
    vals = json_format_correction(vals)
    data = json.loads(vals)
    keys = data.keys()
    keys_list = list(keys)

    old_record_vals = crud_get_record(table_name, document_id, is_mc=False)
    print(old_record_vals)
    values = ""
    first = True
    for key in keys_list:
        if(first==True):
            values = values + " `"+key+"`='" + data[key] + "'"
            old_record_vals[key]=data[key]
            first = False
        else:
            values = values + ", `"+key+"`='" + data[key] + "'"
            old_record_vals[key]=data[key]

    old_record_vals["modified"] = modified
    old_record_vals["modified_by"] = modified_by
    print(old_record_vals)
    doctype = get_table_doctype(table_name, fetch_dotype=True)
    doc_class = create_class(doctype)

    sig = generate_sig2(doc_class.pars, old_record_vals)
    qry = "UPDATE plexorCBS.`" + table_name + "` SET " + values + ", sig = '"+sig+"' where `name` = '" + document_id + "' limit 1"
    print(qry)
    mydb = mysql_connection()
    cur = mydb.cursor(dictionary=True)
    cur.execute(qry)
    mydb.commit()
    return "success"

@frappe.whitelist()
def post_mc_transaction_child(document_id, table_name, vals):
    post_table_data(table_name, document_id, vals)
    return "success"

@frappe.whitelist()
def post_mc_transaction_children(parent_id):
    sql = "SELECT * FROM `plexMakerChecker` WHERE `parent`='"+parent_id+"' order by creation asc"
    print(sql)
    mydb = mysql_connection()
    cur = mydb.cursor(dictionary=True)
    cur.execute(sql)
    rv = cur.fetchall()
    print("FOUND RECORDS:  " + str(cur.rowcount))
    for rec in rv:
        table_name = get_tablename(rec["document"])
        #qry = "INSERT INTO plexorCBS.`"+table_name+"` (select * from plexorCBS_MC.`"+table_name+"` where `name` = '"+rec["document_id"]+"')"
        #docname = rec["name"]
        #print(qry)
        #cur.execute(qry)
        #mydb.commit()
        post_table_data(table_name, rec["document_id"], str(rec["values"]))
    qry2 = "UPDATE `plexMakerChecker` SET  posted_status=1, posted_result='ok' where `parent` = '" + parent_id + "'"
    print(qry2)
    cur.execute(qry2)
    mydb.commit()

    qry3 = "INSERT INTO `plexMakerCheckerLogs` (SELECT * FROM `plexMakerChecker` where `parent` = '" + parent_id + "')"
    print(qry3)
    cur.execute(qry3)
    mydb.commit()

    qry4 = "DELETE FROM `plexMakerChecker` where `parent` = '" + parent_id + "'"
    print(qry4)
    cur.execute(qry4)
    mydb.commit()
    return "success"


def post_table_data(table_name, document_id, vals, time="", owner=""):
    # docl_ist = ['creation', 'modified', 'modified_by', 'owner', 'docstatus', 'idx']
    #print("GETTING VALUES :: " + vals)

    if(document_id==""):
        print(vals)
        vals = vals.replace('{"child":','').replace("}}","}")
        vals = json_format_correction(vals)
        print(vals)
        data = json.loads(vals)
        print(data)
        keys = data.keys()
        keys_list = list(keys)

        json_load = json.loads("{\"creation\": \"" + str(time) + "\",\"modified\": \"" + str(time) + "\",\"modified_by\": \"" + owner + "\",\"owner\": \"" + owner + "\"}")

        values = "VALUES( NULL, '"+time+"', '"+time+"', '"+owner+"', '"+owner+"', 0, 0 "
        qry = "INSERT INTO plexorCBS.`" + table_name + "` (`name`, `creation`, `modified`, `modified_by`, `owner`, `docstatus`, `idx`"
        for key in keys_list:
            qry = qry + ", `" + key + "`"
            print("KEY:: "+key)
            values = values + ", '" + data[key] + "'"
            json_load[key] = data[key]
        qry = qry + ", `sig`, `sig_status`) "
        sig = generate_sig2(keys_list, json_load)
        values = values + ", '"+sig+"', '0') "
        qry = qry + values
    else:
        # Fix the JSON string format
        # Replace single quotes with double quotes and ensure that the property names are quoted
        corrected_json_string = re.sub(r"(\w+)\s*:", r'"\1":', vals)
        corrected_json_string = corrected_json_string.replace("'", '"')
        # Ensure the JSON string starts and ends with curly braces
        corrected_json_string = f'{{{corrected_json_string.strip("{}")}}}'
        vals = corrected_json_string+"}"
        vals = vals.replace("}}}","}}")
        print(vals)
        data = json.loads(vals)
        #data2 = json.loads(data["child"])
        keys = data["child"].keys()
        keys_list = list(keys)
        qry = "INSERT INTO plexorCBS.`" + table_name + "` (select NULL, `creation`, `modified`, `modified_by`, `owner`, `docstatus`, `idx`"
        for key in keys_list:
            qry = qry + ", `" + key + "`"
        qry = qry + ", `sig`, `sig_status` from plexorCBS_MC.`" + table_name + "` where `name` = '" + document_id + "')"
    # docl_ist.append("sig")
    # docl_ist.append("sig_status")

    mydb = mysql_connection()
    cur = mydb.cursor(dictionary=True)
    print(qry)
    cur.execute(qry)
    mydb.commit()

def get_tablename(classname):
    mydb = mysql_connection()
    cur = mydb.cursor(dictionary=True)
    sql = ("SELECT * FROM plexTableMapping where `doctype_name`='" + classname + "' limit 1")
    print(sql)
    cur.execute(sql)
    rv = cur.fetchone()
    if cur.rowcount > 0:
        try:
            print("Found tablename: "+str(rv["table_name"]))
            return rv["table_name"]
        except:
            frappe.throw("Error getting table_name from classname")
    else:
        return "---"

def get_doctypes_table(doctype, use_classname=False):
    mydb = mysql_connection()
    cur = mydb.cursor(dictionary=True)
    if(use_classname==False):
        sql = ("SELECT * FROM plexTableMapping where `doctype`='" + doctype + "' limit 1")
    else:
        sql = ("SELECT * FROM plexTableMapping where `doctype_name`='" + doctype + "' limit 1")
    print(sql)
    cur.execute(sql)
    rv = cur.fetchone()
    if cur.rowcount > 0:
        try:
            print("Found tablename: "+str(rv["table_name"]))
            return rv["table_name"]
        except:
            frappe.throw("Error getting table_name from classname")
    else:
        return "---"


def get_table_doctype(table_name, fetch_dotype=True):
    mydb = mysql_connection()
    cur = mydb.cursor(dictionary=True)
    if(fetch_dotype==True):#doctype
        sql = ("SELECT doctype as res FROM plexTableMapping where `table_name`='" + table_name + "' limit 1")
    else:#doctype_name
        sql = ("SELECT doctype_name as res FROM plexTableMapping where `table_name`='" + table_name + "' limit 1")
    print(sql)
    cur.execute(sql)
    rv = cur.fetchone()
    if cur.rowcount > 0:
        try:
            print("Found doctype: "+str(rv["res"]))
            return rv["res"]
        except:
            frappe.throw("Error getting docytpe from table_name")
    else:
        return "---"


@frappe.whitelist()
def deleteDoc(form, children="", children_fields=""):
    data = json.loads(form)
    doctype = data["doctype"]
    parent = data["name"]

    module_name = "Plexor CBS"
    module = load_doctype_module(doctype, module_name)
    classname = doctype.replace(" ", "").replace("-", "")
    class_ = getattr(module, classname, None)
    #frappe.throw(class_.table)

    if is_maker_checker(get_doctypes_table(doctype), parent):
        frappe.throw("Cannot delete an unconfirmed document. Opt instead to cancel it.")
    elif is_maker_checker_required(doctype, "DELETE"):
        print("DETECTED maker checker")
        create_maker_checker("DELETE", class_, form, class_.pars, doctype=doctype)
        return "success" #No update to be committed to table if maker checker enabled

    #DELETE ChILDREN FIRST
    child_tables = children.split(",")
    child_tables_fields = children_fields.split(",")
    x = 0
    for table_doctype in child_tables:
        print("DELETE CHILD: "+table_doctype)
        delete_children(table_doctype, child_tables_fields[x], parent)
        x = x + 1

    #DELETE PARENT
    mydb = mysql_connection()
    mycursor = mydb.cursor()
    sql = "DELETE FROM `" + get_doctypes_table(doctype) + "` WHERE name = '" + parent + "'"
    print("SQL::   " + sql)
    mycursor.execute(sql)
    mydb.commit()
    return "success"

def delete_children(table_doctype, parent_field, parent):
    mydb = mysql_connection()
    cur = mydb.cursor(dictionary=True)
    sql = ("DELETE FROM `"+get_doctypes_table(table_doctype)+"` where `"+parent_field+"`='" + parent + "'")
    print(sql)
    cur.execute(sql)
    mydb.commit()

def getDoctype(self):
    doctype = self.__name__
    print("DOCTYPE [[ " + doctype + " ]]")
    return doctype

@frappe.whitelist()
def db_query(sql, db):
    rez = frappe.db.sql(sql)
    return rez

@frappe.whitelist()
def save_role_permission(doc, role, account, checkers):
    print("Adding rule :" + str(json.dumps(doc)))
    pars = ["postingRule",
            "type",
            "account"]
    #if(is_maker_checker("plexPostingRules",postingRule)):
    maker_check = False
    if(is_maker_checker("plexPostingRules",postingRule) or is_maker_checker_required("PostingRules", "UPDATE")):
        maker_check = True
        mydb = mysql_connection_MC()
    else:
        mydb = mysql_connection()
    cur = mydb.cursor()
    sql = "insert into plexPostingRulesAccounts(name, postingRule, type, account) values(NULL, '" + postingRule +"', '" + type +"', '" + account +"') "
    print(sql)
    try:
        cur.execute(sql)
        child_id = cur.lastrowid
        #child_id = mydb.insert_id()
        mydb.commit()
        if(maker_check == True):
            raw = "{\"postingRule\": \"" + postingRule + "\", \"type\": \"" + type + "\", \"account\": \"" + account + "\"}"
            print(raw)
            jdoc = json.loads(raw)
            create_maker_checker_child("UPDATE", "PostingRulesAccounts", jdoc, pars, postingRule, child_id, checkers)
    except mysql.connector.Error as err:
        frappe.msgprint(err.msg)
        return "failed"
    return "success"

@frappe.whitelist()
def delete_role_permission(role, account, checkers):
    print("Deleting rule :" + account)
    if (is_maker_checker("plexPostingRules", postingRule) or is_maker_checker_required("PostingRules", "DELETE")):
        raw = "{\"postingRule\": \"" + postingRule + "\", \"type\": \"" + type + "\", \"account\": \"" + account + "\"}"
        print(raw)
        jdoc = json.loads(raw)
        create_maker_checker_child("DELETE", "PostingRulesAccounts", jdoc, pars, postingRule, checkers)
        mydb = mysql_connection_MC()
    else:
        mydb = mysql_connection()
    cur = mydb.cursor()
    sql = "delete from plexPostingRulesAccounts where postingRule='" + postingRule +"' and type='" + type +"' and account='" + account +"' limit 1"
    print(sql)
    try:
        cur.execute(sql)
        mydb.commit()
    except mysql.connector.Error as err:
        frappe.msgprint(err.msg)
        return "failed"
    return "success"

@frappe.whitelist()
def get_role_permission(role):
    print("Getting get_role_permission :" + role)
    if (is_maker_checker("plexRoles", role)):
        mydb = mysql_connection_MC()
    else:
        mydb = mysql_connection()
    cur = mydb.cursor(dictionary=True)
    sql = "SELECT `role`, `permission` FROM `plexRolesPermissions` where `role` = '"+role+"' ORDER BY `permission`"
    print(sql)
    cur.execute(sql)
    rv = cur.fetchall()
    return rv

@frappe.whitelist()
def save_child_row(doctype, parent_id, row, checkers, edit_action="False"):
    print("GETTING GET/POST PARS :" + json.dumps(frappe.local.form_dict))
    print(row)
    #frappe.throw(row)
    child_id = ""
    jdoc = json.loads(row)
    doctype_parent = get_parent(doctype)
    parent_table = get_tablename(doctype_parent)
    child_table = get_tablename(doctype)
    child_class = create_class(doctype)
    parent_class = create_class(doctype_parent)

    pars = child_class.pars

    maker_check = False
    if(is_maker_checker(parent_table,parent_id) or is_maker_checker_required(doctype_parent, "UPDATE")):
        maker_check = True
        mydb = mysql_connection_MC()
    else:
        mydb = mysql_connection()

    first = True
    qry = ""
    qry_vals = ""
    if (edit_action == "False"):
        print("JDOC1")
        print(pars)
        for x in pars:
            if (first):
                qry = "`" + x + "`"
                qry_vals = " '" + str(jdoc[x]) + "'"
                first = False
            else:
                qry = qry + ", " + "`" + x + "`"
                qry_vals = qry_vals + ", \"" + str(jdoc[x]).replace('"', '\\"') + "\""
    else:
        print("JDOC2")
        print(jdoc)
        for x in pars:
            if (first):
                qry = "`" + x + "`="+" '" + str(jdoc[x]) + "'"
                first = False
            else:
                qry = qry + ", " + "`" + x + "`="+" \"" + str(jdoc[x]).replace('"', '\\"') + "\""

    cur = mydb.cursor()
    creator = frappe.get_user().doc.name
    nowtime = get_current_datetime()
    jdoc["creation"]=nowtime
    jdoc["modified"]=nowtime
    jdoc["modified_by"]=creator
    jdoc["owner"]=creator
    sig = generate_sig2(pars, jdoc)
    if(edit_action == "False"):
        sql = "insert into `"+child_table+"`(name, creation, modified, modified_by, owner, docstatus, idx, sig, sig_status, "+qry+") values(NULL, '"+nowtime+"', '"+nowtime+"', '"+frappe.get_user().doc.name+"', '"+frappe.get_user().doc.name+"',  0, 1, '"+sig+"', 0, " + qry_vals +") "
    else:
        sql = "update `"+child_table+"` set " + qry + " where `name`='"+str(jdoc["name"])+"'"
    print(sql)
    try:
        if(is_maker_checker(parent_table, parent_id)==False and is_maker_checker_required(doctype_parent, "UPDATE")): # If is not a new doc, no
            pass
        else:
            cur.execute(sql)
            if (edit_action == "False"):
                child_id = cur.lastrowid
                #child_id = mydb.insert_id()
            else:
                child_id = str(jdoc["child_mc_id"])
            mydb.commit()
        if(maker_check == True):
            if (edit_action == "False"):
                child_trx_type_val = "INSERT"
            else:
                child_trx_type_val = "UPDATE"
            if(child_trx_type_val=="UPDATE"):
                jdoc["child"] = json.loads(row);
                create_maker_checker_child("UPDATE", doctype, jdoc, None, child_class.pars, checkers, child_trx_type=child_trx_type_val, parent_id=parent_id, child_mc_id=child_id)
            else:
                create_maker_checker_child("UPDATE", doctype, jdoc, parent_class.pars, child_class.pars, checkers, child_trx_type=child_trx_type_val, parent_id=parent_id, child_mc_id=child_id)
    except mysql.connector.Error as err:
        frappe.msgprint(err.msg)
        return "failed"
    return "success"

@frappe.whitelist()
def delete_child_row(checkers, form):
    jdoc = json.loads(form)
    print("PRINTING JDOC")
    print("")
    print("")
    print(jdoc)
    doctype = jdoc["child"]["doctype"].replace(" ", "").replace("-", "")
    doctype_parent = jdoc["doctype"].replace(" ", "").replace("-", "")
    parent_table = get_tablename(doctype_parent)
    child_table = get_tablename(doctype)
    parent_class = create_class(doctype_parent)
    child_class = create_class(doctype)

    pars = []
    if (is_maker_checker(parent_table, jdoc["name"]) == False and is_maker_checker_required(doctype_parent, "DELETE")):
        print(jdoc)
        create_maker_checker_child("UPDATE", doctype, jdoc, parent_class.pars, child_class.pars, checkers, child_trx_type="DELETE")
        return  "success" #Cannot proceed until approved
    elif(is_maker_checker(parent_table, jdoc["name"])):
        #Allow updates on yet approved document
        print("Allow updates on yet approved document")
        print(jdoc)
        mydb = mysql_connection()
        cur = mydb.cursor()
        sql = "delete from `plexMakerChecker` where trx_type='UPDATE' and child_trx_type='INSERT' and document='"+doctype+"' and parent='"+str(jdoc["child"]["parent"])+"' and document_id='"+str(jdoc["child"]["child_id"])+"' limit 1"
        print(sql)
        cur.execute(sql)
        mydb.commit()

        mydbc = mysql_connection_MC()
        curc = mydbc.cursor()
        sql = "delete from "+child_table+" where name='" + str(jdoc["child"]["child_id"]) +"' limit 1"
        print(sql)
        curc.execute(sql)
        mydbc.commit()
        return "success"
    else:
        #No approval required, so just update
        print("No approval required, so just update")
        mydb = mysql_connection()
    cur = mydb.cursor()
    print(jdoc)
    sql = "delete from "+child_table+" where name='" + str(jdoc["child"]["child_id"]) +"' limit 1"
    print(sql)
    try:
        cur.execute(sql)
        mydb.commit()
    except mysql.connector.Error as err:
        frappe.msgprint(err.msg)
        return "failed"
    return "success"

@frappe.whitelist()
def get_child_row(parent_value, parent_field, conds, child_doctype_name):
    doctype_parent = get_parent(child_doctype_name)
    parent_table = get_tablename(doctype_parent)
    child_table = get_tablename(child_doctype_name)
    print("Getting child of :" + parent_value)
    if (is_maker_checker(parent_table, parent_value)):
        mydb = mysql_connection_MC()
    else:
        mydb = mysql_connection()
    cur = mydb.cursor(dictionary=True)
    if(parent_field==""):
        sql = "SELECT *, `name` as child_id FROM `" + child_table + "` where " + conds
    else:
        sql = "SELECT *, `name` as child_id FROM `"+child_table+"` where `"+parent_field+"` = '"+parent_value+"' and "+conds
    print(sql)
    cur.execute(sql)
    rv = cur.fetchall()
    return rv

def create_class(doctype_name):
    doctype = get_doctype(doctype_name)
    module_name = "Plexor CBS"
    module = load_doctype_module(doctype, module_name)
    classname = doctype.replace(" ", "").replace("-", "")
    class_ = getattr(module, classname, None)
    return class_

def get_parent(doctype):
    mydb = mysql_connection()
    cur = mydb.cursor(dictionary=True)
    sql = "SELECT * from plexParentChild where `child` = '" + doctype + "'"
    print(sql)
    cur.execute(sql)
    rv = cur.fetchone()
    return rv["parent"]

@frappe.whitelist()
def get_type_settings(type):
    print("Getting settings :" + type)
    mydb = mysql_connection()
    cur = mydb.cursor(dictionary=True)
    sql = "SELECT * FROM `plexSetting` where `type` = '"+type+"' ORDER BY `setting`"
    print(sql)
    cur.execute(sql)
    rv = cur.fetchall()
    return rv

@frappe.whitelist()
def save_type_settings(type, setting, codename, value, status):
    print("Adding setting :" + codename)
    mydb = mysql_connection()
    cur = mydb.cursor()
    sql = "insert into plexSetting(name, type, setting, codename, value, status) values('" + codename + "', '" + type +"', '" + setting +"', '" +codename +"', '" +value +"', '" + status +"') "
    print(sql)
    try:
        cur.execute(sql)
        mydb.commit()
    except mysql.connector.Error as err:
        frappe.msgprint(err.msg)
        return "failed"
    return "success"

@frappe.whitelist()
def delete_type_settings(codename):
    print("Deleting setting :" + codename)
    mydb = mysql_connection()
    cur = mydb.cursor()
    sql = "delete from plexSetting where codename='" + codename +"' limit 1"
    print(sql)
    try:
        cur.execute(sql)
        mydb.commit()
    except mysql.connector.Error as err:
        frappe.msgprint(err.msg)
        return "failed"
    return "success"

@frappe.whitelist()
def getTrigger(doctype):
    doctype = doctype.replace(" ", "").replace("-", "")
    doc_class = create_class(doctype)
    table = get_tablename(doctype)
    pars = doc_class.pars
    trig = create_trigger(table, pars)
    return trig