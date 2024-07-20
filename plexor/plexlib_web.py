import mysql.connector
from plexlib import mysql_connection, generate_sig
import json
from time import time as _time, sleep as _sleep
from threading import Event
import frappe

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
    cur.execute(sql)
    rv = cur.fetchall()
    return rv