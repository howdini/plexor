import frappe
import json
import hashlib
from plexlib import mysql_connection, mysql_connection_MC, validate_document, generate_sig, generate_sig2, create_trigger, check_permissions, create_message, json_format_correction, get_current_datetime
from frappe.model.document import Document
import mysql.connector
from typing import overload
from datetime import datetime
from frappe.modules import load_doctype_module



def create_maker_checker_child(type, doctype,  self, pars, c_pars, checkers, child_trx_type="INSERT", parent_id="", child_mc_id=""):
    jself = self #json.loads(self)
    print("SHOWING JSELF VALUES:")
    print(jself)
    print("SHOWING PARENT VALUES:")
    print(parent_id)
    print("SHOWING CHILD VALUES:")
    if(child_trx_type=="UPDATE"):
        child_mc_id = jself["name"]
    elif(child_trx_type=="DELETE"):
        child_mc_id = jself["child"]["child_id"]
    print("CHILD ID::: "+str(child_mc_id))
    #checkers = str(jself["checkers"]).replace(",", ": pending,\n")
    #print("CHECKERS FOR INSERT  "+checkers)
    mydb = mysql_connection()
    qry = ""
    values = ""

    recepients = checkers.split(",")
    if(child_trx_type=="INSERT"):
        first = True
        for x in c_pars:
            if (first):
                qry = "`" + x + "`"
                values = "\\\"" + x + "\\\" :\\\"" + str(jself[x]) + "\\\""
                first = False
            else:
                qry = qry + ", " + "`" + x + "`"
                values = values + ", \\\"" + x + "\\\" :\\\"" + str(jself[x]).replace('"', '\\"') + "\\\""
        values = "{\\\"child\\\":{" + values + "}}"
    else:
        if(pars is None):
            values = "{\\\"parent\\\":{}"
        else:
            first = True
            for x in pars:
                if (first):
                    qry = "`" + x + "`"
                    values = "\\\"" + x + "\\\" :\\\"" + str(jself[x]) + "\\\""
                    first = False
                else:
                    qry = qry + ", " + "`" + x + "`"
                    values = values + ", \\\"" + x + "\\\" :\\\"" + str(jself[x]).replace('"', '\\"') + "\\\""
            values = "{\\\"parent\\\":{" + values + "}"
        values2 = ""
        first = True
        for x in c_pars:
            if (first):
                values2 = values2 + "\\\"" + x + "\\\" :\\\"" + str(jself["child"][x]) + "\\\""
                first = False
            else:
                values2 = values2 + ", \\\"" + x + "\\\" :\\\"" + str(jself["child"][x]).replace('"', '\\"') + "\\\""
        values = values + ", \\\"child\\\":{" + values2 + "}}"

    print(values)
    if (parent_id == ""):
        print("JSELF CONTENT")
        print(jself)
        if(child_mc_id==""):
            child_id = jself["child"]["name"]
        else:
            child_id = child_mc_id
        parent_id = jself["name"]
    else:
        child_id = child_mc_id
    if(checkers==""):  #Condition for parent that hasnt been approved yet
            checkers = "(select checkers from (select `checkers` from plexMakerChecker where `document_id`='" + parent_id + "' order by creation desc limit 1) as s)"
            json_string = get_checkers(parent_id)
            checkers = json_string
            json_string = json_string.replace("{","{\"").replace(":","\":").replace(": ",": \"").replace(",","\",").replace("pending, }","pending\"}").replace(", }","}").replace(", ",", \"")
            print("CORRECTED::: "+json_string)
            data = json.loads(json_string)
            recepients = data.keys()
    else:
        checkers = "{" + checkers + "}"
    mycursor = mydb.cursor()
    mc_id = generate_key()
    nowtime = get_current_datetime()
    mc_doctype = create_class("MakerChecker")
    json_string = ("{\"creation\": \"" + str(nowtime) + "\",\"modified\": \""
                  "" + str(nowtime) + "\",\"modified_by\": \"" + frappe.get_user().doc.name + "\",\"owner\": \"" + frappe.get_user().doc.name + ""
                  "\",\"creator\": \"" + frappe.get_user().doc.name + "\", \"stamp\": \"" + str(nowtime) + "\", \"document\": \"" + doctype + "\", \"document_id\": \"" + str(child_id) + "\", \"trx_type\": \"" + type + "\", \"child_trx_type\": \"" + child_trx_type + ""
                  "\",\"values\": \"" + values + "\", \"checkers\": \"" + checkers + "\", \"parent\": \"" + str(parent_id) + "\", \"check_status\": \"0\", \"checker_comments\": \"\", \"posted_result\": \"0\"}")
    print(json_string)
    print("PARS:::")
    print(mc_doctype.pars)
    sig = generate_sig2(mc_doctype.pars, json.loads(json_string))
    sql = ("INSERT INTO `plexMakerChecker` (name, creation, modified, modified_by, owner, docstatus, idx,"
           + "creator, stamp, document, document_id, `trx_type`, `values`, checkers, parent, `check_status`, sig, child_trx_type)"
           + "VALUES( '"+str(mc_id)+"', '"+str(nowtime)+"', '"+str(nowtime)+"', '"+frappe.get_user().doc.name+"', '"+frappe.get_user().doc.name+"',  0, 1,"
           + "'"+frappe.get_user().doc.name+"', '"+str(nowtime)+"', '"+doctype+"', '"+str(child_id)+"', '"+type+"', '"+values+"', '"+checkers+"', '"+str(parent_id)+"', 0, '"+sig+"', '"+child_trx_type+"' )")
    print(sql)
    try:
        mycursor.execute(sql)
        mydb.commit()
        create_message(frappe.get_user().doc.name, "", recepients,
                       "A record has been created/modified and your approval is required before it can be posted.<br><a target=_blank href=/app/maker-checker/" + mc_id + ">View change  </a>",
                       1, 6)
    except mysql.connector.Error as e:
        if ("Duplicate" in str(e)):
            frappe.throw("An update request on this document is still pending. Cannot proceed.")
        elif( "'checkers' cannot be null" in str(e)):
            frappe.throw("Error. No checkers were selected.")
        else:
            frappe.throw(e)

def get_checkers(parent_id):
    sql = "select `checkers` from plexMakerChecker where `document_id`='" + parent_id + "' order by creation desc limit 1"
    print(sql)
    mydb = mysql_connection()
    cur = mydb.cursor(dictionary=True)
    cur.execute(sql)
    rv = cur.fetchone()
    return rv["checkers"]

def create_maker_checker(type, selfclass, self, pars, doctype=""):
    had_doctype = False
    mc_doctype = create_class("MakerChecker")
    if(len(doctype) < 1):
        doctype = getDoctype(selfclass)
        checkers = str(self.get("checkers")).replace(",", ": pending, ")
        recepients = checkers.split(",")
    else:
        had_doctype = True
        doctype = doctype.replace(" ","").replace("-","").replace("_","")
        print(self)
        data = json.loads(self)
        try:
            checkers_raw = data["checkers"]
        except KeyError:
            frappe.throw("No checkers were selected.")
        recepients = checkers_raw.split(",")
        print(recepients)
        checkers = str(checkers_raw).replace(",", ": pending, ")
    mydb = mysql_connection()
    #qry = ""
    values = ""
    if(type=="DELETE"):
        values = "{\\\"children_tables\\\" : \\\""+data["children"] +"\\\", \\\"children_fields\\\" : \\\"" + data["children_fields"] + "\\\"}"
    else:
        first = True
        for x in pars:
            if (first):
                #qry = "`" + x + "`"
                if (had_doctype == False):
                    values = "\\\"" + x + "\\\" :\\\"" + str(self.get(x)) + "\\\""
                else:
                    values = "\\\"" + x + "\\\" :\\\"" + str(data[x]) + "\\\""
                first = False
            else:
                #qry = qry + ", " + "`" + x + "`"
                if (had_doctype == False):
                    values = values + ", \\\"" + x + "\\\" :\\\"" + str(self.get(x)).replace('"', '\\"') + "\\\""
                else:
                    values = values + ", \\\"" + x + "\\\" :\\\"" + str(data[x]).replace('"', '\\"') + "\\\""
        values = "{" + values + "}"

    checkers = "{" + checkers + "}"
    mycursor = mydb.cursor()
    sql = "" # ("INSERT INTO `plexMakerChecker` (name, creation, modified, modified_by, owner, docstatus, idx,"
         #  + "creator, stamp, document, document_id, `trx_type`, `values`, checkers, `check_status`, sig)"
         #  + "VALUES( %s, '"+self.creation+"', "+self.creation+"', %s, %s, 0, 0, %s, %s, %s,%s, %s,%s,%s, 0, %s  )")
    #print(sql)
    mc_id = generate_key()
    if (had_doctype == False):
        json_string = ("{\"creation\": \"" + str(self.creation) + "\",\"modified\": \""
        ""+str(self.creation) + "\",\"modified_by\": \"" + self.owner + "\",\"owner\": \"" + self.owner + ""
        "\",\"creator\": \"" + self.owner + "\", \"stamp\": \"" + str(self.creation) + "\", \"document\": \"" + doctype + "\", \"document_id\": \"\", \"trx_type\": \"" + type + "\", \"child_trx_type\": \""
        "\",\"values\": \"" + values + "\", \"checkers\": \"" + checkers + "\", \"parent\": \"\", \"check_status\": \"0\", \"checker_comments\": \"\", \"posted_result\": \"0\"}")

        print(json_string)
        print("PARS:::")
        print(mc_doctype.pars)
        sig = generate_sig2(mc_doctype.pars, json.loads(json_string))
        #val = (mc_id, self.modified_by, self.owner, self.owner, self.creation, doctype, self.name, type, values, checkers, sig)

        sql = ("INSERT INTO `plexMakerChecker` (name, creation, modified, modified_by, owner, docstatus, idx,"
               + "creator, stamp, document, document_id, `trx_type`, `values`, checkers, checker_comments, parent, child_trx_type, `check_status`, sig)"
               + "VALUES( '" + mc_id + "', '" + self.creation + "', '" + self.modified + "', '" + self.modified_by + "', '" + self.owner + "', 0, 0, '"
               + self.owner + "', '" + self.creation + "','" + doctype + "', '" + self.name + "', '" + type + "', '" + values + "', '" + checkers
               + "', '', '', '', 0, '" + sig + "'  )")
        print(sql)
    else:
        nowtime = get_current_datetime()
        data["creation"] = nowtime
        data["modified"] = nowtime
        data["modified_by"] = data["owner"]
        data["owner"] = data["owner"]

        data["creator"] = data["owner"]
        data["stamp"] = nowtime
        data["document"] = doctype
        data["document_id"] = data["name"]
        data["trx_type"] = type

        data["checkers"] = checkers
        data["values"] = values
        data["check_status"] = "0"
        data["type"] = type
        data["parent"] = ""
        data["child_trx_type"] = ""
        data["checker_comments"] = ""
        data["posted_result"] = ""
        sig = generate_sig2(mc_doctype.pars, data)
        sql = ("INSERT INTO `plexMakerChecker` (name, creation, modified, modified_by, owner, docstatus, idx,"
               + "creator, stamp, document, document_id, `trx_type`, `values`, checkers, checker_comments, parent, child_trx_type, `check_status`, `posted_result`, sig)"
               + "VALUES( '" + mc_id + "', '" + data["creation"] + "', '" + data["modified"] + "', '" + data["modified_by"] + "', '" + data["owner"] + "', 0, 0, '" + data["owner"] + "', '"
               + data["creation"] + "','" + doctype + "', '" + data["name"] + "', '" + type + "', '" + values + "', '" + checkers + "', '', '', '', 0, '', '" + sig + "'  )")
        #val = (mc_id, data["modified_by"], data["owner"], data["owner"], data["creation"], doctype, data["name"], type, values, checkers, sig)

    try:
        mycursor.execute(sql)
        mydb.commit()
        if (had_doctype == False):
                owner = self.owner
        else:
                owner = data["owner"]
        create_message(owner, "", recepients, "A record has been created/modified and your approval is required before it can be posted.<br><a target=_blank href=/app/maker-checker/"+mc_id+">View change </a>", 1, 6)
    except mysql.connector.Error as e:
        if( "Duplicate" in str(e)):
            if (is_maker_checker(self.table, self.name)==True):
                type="INSERT"
            mycursor.execute("delete from plexMakerChecker where document_id='"+self.name+"'")
            mydb.commit()
            #frappe.throw("An update request on this document is still pending. Cannot proceed.")

            print(sql)
            if (had_doctype == False):
                json_string = ("{\"creation\": \"" + str(self.creation) + "\",\"modified\": \"""" + str(
                    self.creation) + "\",\"modified_by\": \"" + self.owner + "\",\"owner\": \"" + self.owner + ""
                    "\",\"creator\": \"" + self.owner + "\", \"stamp\": \"" + str(
                    self.creation) + "\", \"document\": \"" + doctype + "\", \"document_id\": \"\", \"trx_type\": \"" + type + "\", \"child_trx_type\": \""
                    "\",\"values\": \"" + values + "\", \"checkers\": \"" + checkers + "\", \"parent\": \"\", \"check_status\": \"0\", \"checker_comments\": \"\", \"posted_result\": \"0\"}")

                print(json_string)
                print("PARS:::")
                print(mc_doctype.pars)
                sig = generate_sig2(mc_doctype.pars, json.loads(json_string))
                # val = (mc_id, self.modified_by, self.owner, self.owner, self.creation, doctype, self.name, type, values, checkers, sig)

                sql = ("INSERT INTO `plexMakerChecker` (name, creation, modified, modified_by, owner, docstatus, idx,"
                       + "creator, stamp, document, document_id, `trx_type`, `values`, checkers, checker_comments, parent, child_trx_type, `check_status`, sig)"
                       + "VALUES( '" + mc_id + "', '" + self.creation + "', '" + self.modified + "', '" + self.modified_by + "', '" + self.owner + "', 0, 0, '"
                       + self.owner + "', '" + self.creation + "','" + doctype + "', '" + self.name + "', '" + type + "', '" + values + "', '" + checkers
                       + "', '', '', '', 0, '" + sig + "'  )")
                print(sql)
            else:
                nowtime = get_current_datetime()
                data["creation"] = nowtime
                data["modified"] = nowtime
                data["modified_by"] = data["owner"]
                data["owner"] = data["owner"]

                data["creator"] = data["owner"]
                data["stamp"] = nowtime
                data["document"] = doctype
                data["document_id"] = data["name"]
                data["trx_type"] = type

                data["checkers"] = checkers
                data["values"] = values
                data["check_status"] = "0"
                data["type"] = type
                data["parent"] = ""
                data["child_trx_type"] = ""
                data["checker_comments"] = ""
                data["posted_result"] = ""
                sig = generate_sig2(mc_doctype.pars, data)
                sql = ("INSERT INTO `plexMakerChecker` (name, creation, modified, modified_by, owner, docstatus, idx,"
                       + "creator, stamp, document, document_id, `trx_type`, `values`, checkers, checker_comments, parent, child_trx_type, `check_status`, `posted_result`, sig)"
                       + "VALUES( '" + mc_id + "', '" + data["creation"] + "', '" + data["modified"] + "', '" + data[
                           "modified_by"] + "', '" + data["owner"] + "', 0, 0, '" + data["owner"] + "', '"
                       + data["creation"] + "','" + doctype + "', '" + data[
                           "name"] + "', '" + type + "', '" + values + "', '" + checkers + "', '', '', '', 0, '', '" + sig + "'  )")
                print(sql)
            mycursor.execute(sql)
            mydb.commit()
            create_message(self.owner, "", recepients,
                           "A record has been created/modified and your approval is required before it can be posted.<br><a target=_blank href=/app/maker-checker/" + mc_id + ">View change </a>",
                           1, 6)
        elif( "'checkers' cannot be null" in str(e)):
            frappe.throw("Error. No checkers were selected.")
        else:
            frappe.throw(e)

def generate_key():
    current_day = datetime.now()
    #date_time = datetime.fromtimestamp(current_day)
    d = current_day.strftime("%d%m%d%Y%H%M%S%f")
    return d

def crud_get_record(table, rec_id, is_mc=False):
    if is_mc==True:
        print("DETECTED maker checker")
        mydb = mysql_connection_MC()
    else:
        mydb = mysql_connection()
    cur = mydb.cursor(dictionary=True)
    sql = ("SELECT * FROM `" + table + "` where `name`='" + rec_id + "' limit 1")
    print("SQL::   "+sql)
    cur.execute(sql)
    #row_headers = [x[0] for x in cur.description]
    rv = cur.fetchone()
    json_data = json.dumps(rv, indent=4, sort_keys=True, default=str)
    return json.loads(json_data)
    #print("FOUND RECORDS:  " + str(cur.rowcount))
    #json_data = []
    #for result in rv:
    #    json_data.append(dict(zip(row_headers, result)))
    #return json.dumps(json_data)


def crud_db_insert(self, selfclass, *args, **kwargs):
    check_permissions(selfclass.doctypeName, "Add")
    print("LOOOOOKING  "+str(self.get("checkers")))
    validate_document(self, self.pars, self.validator)
    if(is_maker_checker_required(selfclass, "INSERT")):
        create_maker_checker("INSERT", selfclass, self, self.pars)
        mydb = mysql_connection_MC()
    else:
        mydb = mysql_connection()
    qry = ""
    qry_vals = ""
    first = True
    for x in self.pars:
        if (first):
            qry = "`" + x + "`"
            qry_vals = " '" + str(self.get(x)) + "'"
            first = False
        else:
            qry = qry + ", " + "`" + x + "`"
            qry_vals = qry_vals + ", \"" + ("" if (str(self.get(x))=="None") else str(self.get(x)).replace('"', '\\"')) + "\""

    mycursor = mydb.cursor()
    sql = ("INSERT INTO `" + str(self.table )+ "` (name, creation, modified, modified_by, owner, docstatus, idx,"
           + qry + ",sig)"
           + "VALUES( '" + str(self.name) + "', '" + str(self.creation) + "', '" + str(self.modified) + "', '" + str(self.modified_by) + "', '" + str(self.owner) + "', 0, '"+str(self.idx)+"', "
           + qry_vals + ", '" + generate_sig(self.pars, self) + "'  )")
    print(sql)
    mycursor.execute(sql)

    mydb.commit()


def crud_load_from_db(self, selfclass, mappers=""):
    check_permissions(selfclass.doctypeName, "View")
    selfname = str(self.name)
    if(selfname.startswith("new-")):
        return
    if is_maker_checker(self.table, selfname):
        print("DETECTED maker checker")
        mydb = mysql_connection_MC()
    else:
        mydb = mysql_connection()
    cur = mydb.cursor(dictionary=True)
    val = (self.name)
    sql = ("SELECT *"+mappers+" FROM `" + self.table + "` where `name`='" + selfname + "' limit 1")
    print("SQL::   "+sql)
    cur.execute(sql)
    rv = cur.fetchone()
    print("FOUND RECORDS:  " + str(cur.rowcount))
    super(Document, self).__init__(rv)


def crud_db_update(self, selfclass):
    check_permissions(selfclass.doctypeName, "Edit")
    if (str(self.sig_status) == "1"):
        frappe.throw("You cannot update a locked document")
    validate_document(self, self.pars, self.validator)
    qry_vals = ""
    first = True
    for x in self.pars:
        if (first):
            qry_vals = x + "= '" + str(self.get(x)) + "'"
            first = False
        else:
            qry_vals = qry_vals + ", `" + x + "`=\"" + ("" if (str(self.get(x))=="None") else str(self.get(x)).replace('"', '\\"'))+ "\""

    selfname = str(self.name)
    if is_maker_checker(self.table, selfname) or is_maker_checker_required(selfclass, "UPDATE"):
        print("DETECTED maker checker")
        create_maker_checker("UPDATE", selfclass, self, self.pars)
        #return #No update to be committed to table if maker checker enabled
        #mydb = mysql_connection_MC()
    else:
        mydb = mysql_connection()
        mycursor = mydb.cursor()
        sql = ("UPDATE `" + self.table + "` SET name = %s, modified = %s, modified_by = %s, "
               + qry_vals + ", sig='" + generate_sig(self.pars, self) + "' WHERE name = %s")
        val = (self.name, self.modified, self.modified_by, self.name)
        print("SQL::   " + sql)
        mycursor.execute(sql, val)
        mydb.commit()


def crud_delete(self, selfclass):
    check_permissions(selfclass.doctypeName, "Delete")
    if (str(self.sig_status) == "1"):
        frappe.throw("You cannot delete a locked document")

    selfname = str(self.name)
    if is_maker_checker(self.table, selfname) or is_maker_checker_required(selfclass, "DELETE"):
        print("DETECTED maker checker")
        ("DELETE", selfclass, self, self.pars)
        return  # No update to be committed to table if maker checker enabled
    else:
        mydb = mysql_connection()
    mycursor = mydb.cursor()
    sql = "DELETE FROM `" + self.table + "` WHERE name = '" + self.name + "' LIMIT 1"
    print("SQL::   " + sql)
    mycursor.execute(sql)
    mydb.commit()


@staticmethod
def crud_get_list(args, self, query):
    check_permissions(self.doctypeName, "View")
    print("PASSES PARAMETER: "+get_filters(self))
    #is_maker_checker_required(self, "INSERT")
    #create_trigger(self.table, self.pars)
    mydb = mysql_connection()
    cur = mydb.cursor(dictionary=True)
    user = frappe.get_user().doc.email
    #my_dest_group = json.dumps(frappe.get_roles(frappe.session.user)).replace('[', '').replace(']', '')
    cur.execute(query)
    rv = cur.fetchall()
    return rv

def get_filters(self):
    filter_str = ""
    try:
        # Parse filters to JSON string to array
        data = json.loads(json.dumps(frappe.local.form_dict))
        # Access the filters field and parse it as JSON
        filters_json = json.loads(data['filters'])

        isFirst = True
        for filter_item in filters_json:
            if filter_item[1] in self.pars:
                filter_str = filter_str + " AND `"+filter_item[1]+"` "+filter_item[2]+" '"+filter_item[3]+"' "
    except:
        return ""
    return filter_str

@staticmethod
def crud_get_count(args, self):
    mydb = mysql_connection()
    cur = mydb.cursor(dictionary=True)
    cur.execute("SELECT name FROM `" + self.table + "`")
    return cur.rowcount


@staticmethod
def crud_get_stats(args, self):
    pass

def getDoctype(self):
    doctype = self.__name__
    print("DOCTYPE [[ "+doctype+" ]]")
    return doctype

def get_doctype2(doctype_name):
    mappings = frappe.cache.get_value("TableMapping")
    print(mappings)
    # Parse the JSON string into a Python dictionary
    try:
        data = json.loads(mappings)
    except TypeError:
        frappe.throw("Your session data has expired. Please logout and login again.")


    # Extract the username value for sammy
    doctype = data[doctype_name.replace(" ", "")]["doctype"]
    print("FOUND doctype::: " + doctype)
    return doctype

def create_class(doctype_name):
    doctype = get_doctype2(doctype_name)
    module_name = "Plexor CBS"
    module = load_doctype_module(doctype, module_name)
    classname = doctype.replace(" ", "").replace("-", "")
    class_ = getattr(module, classname, None)
    return class_

def is_maker_checker_required(self, function):
    doctype = getDoctype(self)
    sql = "SELECT * FROM `plexSetting` WHERE `type`='MCHECKER' AND `codename`=UPPER(CONCAT('"+doctype+"','_"+function+"')) and `value`='yes' and `status`=1"
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