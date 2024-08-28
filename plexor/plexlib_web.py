import mysql.connector
from plexlib import mysql_connection, mysql_connection_MC, generate_sig
from plex_crud import create_maker_checker, create_maker_checker_child
import json
from time import time as _time, sleep as _sleep
from threading import Event
import frappe
import re

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
    print("LOADING ....")
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
def get_checkers():
    print("GETTING USERS :"+json.dumps(frappe.local.form_dict))
    mydb = mysql_connection()
    cur = mydb.cursor()
    sql = "SELECT `name` FROM `plexUser` where `name` != '"+frappe.session.user+"' ORDER BY `name`"
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
def check_parent_makerchecker_status(form,  type):
    #print("LOGGED")
    data = json.loads(form)
    doctype = data["doctype"]
    parent =  data["name"]
    #print(doctype)
    table = get_current_table(doctype)
    is_mc = is_maker_checker(table, parent)
    is_mc_req = is_maker_checker_required(doctype, type)
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

def get_current_table(doctype):
    mappings = frappe.cache.get_value("TableMapping")
    print(mappings)
    # Parse the JSON string into a Python dictionary
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
        if(rv["parent"] is None):
            print("PARENT update detected")
            post_mc_transaction_update(document_id, table_name, str(rv["values"]))
        else:
            if(rv["child_trx_type"] == "INSERT"):
                print("CHILD Insert detected")
                table_name = get_tablename(rv["document"])
                post_table_data(table_name, rv["document_id"], str(rv["values"]))
            elif (rv["child_trx_type"] == "DELETE"):
                print("CHILD Delete detected")
                table_name = get_tablename(rv["document"])
                #json_String = json_format_correction(rv["values"])
                #data = json.loads(json_String)
                #parent_field = data["parent_field"]
                #child_field = data["child_field"]
                #qry = "DELETE FROM plexorCBS.`" + table_name + "` WHERE `" + parent_field + "` = '" + rv["parent"] + "' and `" + child_field + "` = '" + rv["document"] + "'"
                qry = "DELETE FROM plexorCBS.`" + table_name + "` WHERE `name` = '" + rv["document_id"] + "' "
                print(qry)
                cur.execute(qry)
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
def post_mc_transaction_update(document_id, table_name, vals):
    # Replace single quotes with double quotes and ensure that the property names are quoted
    #corrected_json_string = re.sub(r"(\w+)\s*:", r'"\1":', vals)
    #corrected_json_string = corrected_json_string.replace("'", '"')
    # Ensure the JSON string starts and ends with curly braces
    #corrected_json_string = f'{{{corrected_json_string.strip("{}")}}}'
    #vals = corrected_json_string
    #print("GETTING VALUES :: " + vals)
    vals = json_format_correction(vals)

    qry = "UPDATE plexorCBS.`" + table_name + "` SET " + vals + "` where `name` = '" + document_id + "')"
    print(qry)
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


def post_table_data(table_name, document_id, vals):
    # docl_ist = ['creation', 'modified', 'modified_by', 'owner', 'docstatus', 'idx']
    # Fix the JSON string format
    # Replace single quotes with double quotes and ensure that the property names are quoted
    corrected_json_string = re.sub(r"(\w+)\s*:", r'"\1":', vals)
    corrected_json_string = corrected_json_string.replace("'", '"')
    # Ensure the JSON string starts and ends with curly braces
    corrected_json_string = f'{{{corrected_json_string.strip("{}")}}}'
    vals = corrected_json_string
    print("GETTING VALUES :: " + vals)
    data = json.loads(vals)
    keys = data.keys()
    keys_list = list(keys)
    qry = "INSERT INTO plexorCBS.`" + table_name + "` (select NULL, `creation`, `modified`, `modified_by`, `owner`, `docstatus`, `idx`"
    for key in keys_list:
        qry = qry + ", `" + key + "`"
        # docl_ist.append(key)
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
        return #No update to be committed to table if maker checker enabled

    #DELETE ChILDREN FIRST
    child_tables = children.split(",")
    child_tables_fields = children_fields.split(",")
    x = 0
    for table_doctype in child_tables:
        delete_children(table_doctype, child_tables_fields[x], parent)
        x = x + 1

    #DELETE PARENT
    mydb = mysql_connection()
    mycursor = mydb.cursor()
    sql = "DELETE FROM `" + get_doctypes_table(doctype) + "` WHERE name = '" + parent + "'"
    print("SQL::   " + sql)
    mycursor.execute(sql)
    mydb.commit()

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
def save_child_row(doctype, parent_id, row, checkers):
    print(row)
    #frappe.throw(row)
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
    for x in pars:
        if (first):
            qry = "`" + x + "`"
            qry_vals = " '" + str(jdoc[x]) + "'"
            first = False
        else:
            qry = qry + ", " + "`" + x + "`"
            qry_vals = qry_vals + ", \"" + str(jdoc[x]).replace('"', '\\"') + "\""
            
    cur = mydb.cursor()
    sql = "insert into "+child_table+"(name, "+qry+") values(NULL, " + qry_vals +") "
    print(sql)
    try:
        cur.execute(sql)
        child_id = cur.lastrowid
        #child_id = mydb.insert_id()
        mydb.commit()
        if(maker_check == True):
            create_maker_checker_child("UPDATE", doctype, jdoc, parent_class.pars, child_class.pars, checkers, child_trx_type="INSERT", parent_id=parent_id)
    except mysql.connector.Error as err:
        frappe.msgprint(err.msg)
        return "failed"
    return "success"

@frappe.whitelist()
def OLD_save_posting_rule(doc, postingRule, type, account, checkers):
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
def delete_child_row(checkers, form):
    #print("Deleting child table row :" + child_value + "   Checkers: "+checkers)
    jdoc = json.loads(form)
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
        return  #Cannot proceed until approved
    elif(is_maker_checker(parent_table, jdoc["name"])):
        #Allow updates on yet approved document
        print("Allow updates on yet approved document")
        mydb = mysql_connection_MC()
    else:
        #No approval required, so just update
        print("No approval required, so just update")
        mydb = mysql_connection()
    cur = mydb.cursor()
    sql = "delete from "+child_table+" where name='" + jdoc["child"]["child_id"] +"' limit 1"
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