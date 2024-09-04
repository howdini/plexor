import frappe
import json
import hashlib
from plexlib import mysql_connection, mysql_connection_MC, validate_document, generate_sig, create_trigger, check_permissions
from frappe.model.document import Document
import mysql.connector
from typing import overload
from datetime import datetime



def create_maker_checker_child(type, doctype,  self, pars, c_pars, checkers, child_trx_type="INSERT", parent_id="", child_mc_id=""):
    jself = self #json.loads(self)
    #checkers = str(jself["checkers"]).replace(",", ": pending,\n")
    #print("CHECKERS FOR INSERT  "+checkers)
    mydb = mysql_connection()
    qry = ""
    values = ""

    if(child_trx_type=="INSERT"):
        first = True
        for x in c_pars:
            if (first):
                qry = "`" + x + "`"
                values = x + " :\"" + str(jself[x]) + "\""
                first = False
            else:
                qry = qry + ", " + "`" + x + "`"
                values = values + ",\n " + x + " :\"" + str(jself[x]).replace('"', '\\"') + "\""
        values = "{\"child\":{" + values + "}}"
    else:
        first = True
        for x in pars:
            if (first):
                qry = "`" + x + "`"
                values = x + " :\"" + str(jself[x]) + "\""
                first = False
            else:
                qry = qry + ", " + "`" + x + "`"
                values = values + ",\n " + x + " :\"" + str(jself[x]).replace('"', '\\"') + "\""
        values = "{\"parent\":{" + values + "}"
        values2 = ""
        first = True
        for x in c_pars:
            if (first):
                values2 = values2 + x + " :\"" + str(jself["child"][x]) + "\""
                first = False
            else:
                values2 = values2 + ",\n " + x + " :\"" + str(jself["child"][x]).replace('"', '\\"') + "\""
        values = values + ", \"child\":{" + values2 + "}}"



    #values = values + ",\n parent_value :\"" + str(jself["parent_value"]).replace('"', '\\"') + "\""
    #values = values + ",\n child_value :\"" + str(jself["child_value"]).replace('"', '\\"') + "\""
    print(values)
    if (parent_id == ""):
        print("JSELF CONTENT")
        print(jself)
        child_id = jself["child"]["child_id"]
        parent_id = jself["name"]
    else:
        child_id = child_mc_id
    if(checkers==""):  #Condition for parent that hasnt been approved yet
            checkers = "(select checkers from (select `checkers` from plexMakerChecker where `document_id`='" + parent_id + "' order by creation desc limit 1) as s)"
    else:
        checkers = "'{" + checkers + "}'"
    mycursor = mydb.cursor()
    sql = ("INSERT INTO `plexMakerChecker` (name, creation, modified, modified_by, owner, docstatus, idx,"
           + "creator, stamp, document, document_id, `trx_type`, `values`, checkers, parent, `check_status`, sig, child_trx_type)"
           + "VALUES( %s, now(), now(), '"+frappe.get_user().doc.name+"', '"+frappe.get_user().doc.name+"',  0, 1,"
           + "'"+frappe.get_user().doc.name+"', now(),%s,%s,%s,%s,"+checkers+",%s, 0,'', '"+child_trx_type+"' )")
    print(sql)
    val = (generate_key(), doctype, child_id, type, values, parent_id)
    try:
        mycursor.execute(sql, val)
        mydb.commit()
    except mysql.connector.Error as e:
        if ("Duplicate" in str(e)):
            frappe.throw("An update request on this document is still pending. Cannot proceed.")
        elif( "'checkers' cannot be null" in str(e)):
            frappe.throw("Error. No checkers were selected.")
        else:
            frappe.throw(e)


def create_maker_checker(type, selfclass, self, pars, doctype=""):
    had_doctype = False
    if(len(doctype) < 1):
        doctype = getDoctype(selfclass)
        checkers = str(self.get("checkers")).replace(",", ": pending,\n")
    else:
        had_doctype = True
        doctype = doctype.replace(" ","").replace("-","").replace("_","")
        print(self)
        data = json.loads(self)
        try:
            checkers_raw = data["checkers"]
        except KeyError:
            frappe.throw("No checkers were selected.")
        checkers = str(checkers_raw).replace(",", ": pending,\n")
    mydb = mysql_connection()
    #qry = ""
    values = ""
    if(type=="DELETE"):
        values = "{\"children_tables\" : \""+data["children"] +"\", \"children_fields\" : \"" + data["children_fields"] + "\"}"
    else:
        first = True
        for x in pars:
            if (first):
                #qry = "`" + x + "`"
                if (had_doctype == False):
                    values = x + " :\"" + str(self.get(x)) + "\""
                else:
                    values = x + " :\"" + str(data[x]) + "\""
                first = False
            else:
                #qry = qry + ", " + "`" + x + "`"
                if (had_doctype == False):
                    values = values + ",\n " + x + " :\"" + str(self.get(x)).replace('"', '\\"') + "\""
                else:
                    values = values + ",\n " + x + " :\"" + str(data[x]).replace('"', '\\"') + "\""
        values = "{" + values + "}"

    checkers = "{" + checkers + "}"
    mycursor = mydb.cursor()
    sql = ("INSERT INTO `plexMakerChecker` (name, creation, modified, modified_by, owner, docstatus, idx,"
           + "creator, stamp, document, document_id, `trx_type`, `values`, checkers, `check_status`, sig)"
           + "VALUES( %s, now(), now(), %s, %s, 0, 0, %s, %s, %s,%s, %s,%s,%s"
           + ", 0, ''  )")
    print(sql)
    if (had_doctype == False):
        val = (generate_key(), self.modified_by, self.owner, self.owner, self.creation, doctype, self.name, type, values, checkers)
    else:
        val = (generate_key(), data["modified_by"], data["owner"], data["owner"], data["creation"], doctype, data["name"], type, values, checkers)
    try:
        mycursor.execute(sql, val)
        mydb.commit()
    except mysql.connector.Error as e:
        if( "Duplicate" in str(e)):
            if (is_maker_checker(self.table, self.name)==True):
                type="INSERT"
            mycursor.execute("delete from plexMakerChecker where document_id='"+self.name+"'")
            mydb.commit()
            #frappe.throw("An update request on this document is still pending. Cannot proceed.")
            sql = ("INSERT INTO `plexMakerChecker` (name, creation, modified, modified_by, owner, docstatus, idx,"
                   + "creator, stamp, document, document_id, `trx_type`, `values`, checkers, `check_status`, sig)"
                   + "VALUES( now(), now(), %s, %s, %s, 0, 0, %s, %s, %s,%s, %s,%s,%s"
                   + ", 0, ''  )")
            print(sql)
            if (len(doctype) < 1):
                val = (generate_key(),  self.modified_by, self.owner, self.owner, self.creation, doctype, self.name, type, values, checkers)
            else:
                val = (generate_key(), data["modified_by"], data["owner"], data["owner"], data["creation"], doctype, data["name"], data, values, checkers)
            mycursor.execute(sql, val)
            mydb.commit()
        elif( "'checkers' cannot be null" in str(e)):
            frappe.throw("Error. No checkers were selected.")
        else:
            frappe.throw(e)

def generate_key():
    current_day = datetime.now()
    #date_time = datetime.fromtimestamp(current_day)
    d = current_day.strftime("%d%m%d%Y%H%M%S%f")
    return d

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
            qry_vals = qry_vals + ", \"" + str(self.get(x)).replace('"', '\\"') + "\""


    mycursor = mydb.cursor()
    sql = ("INSERT INTO `" + self.table + "` (name, creation, modified, modified_by, owner, docstatus, idx,"
           + qry + ",sig)"
           + "VALUES( %s, %s, %s, %s, %s, 0, %s, "
           + qry_vals + ", '" + generate_sig(self.pars, self) + "'  )")
    val = (self.name, self.creation, self.modified, self.modified_by, self.owner, self.idx)
    mycursor.execute(sql, val)#

    mydb.commit()


def crud_load_from_db(self, selfclass, mappers=""):
    check_permissions(selfclass.doctypeName, "View")
    selfname = str(self.name)
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
            qry_vals = qry_vals + ", `" + x + "`=\"" + str(self.get(x)).replace('"', '\\"') + "\""

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
    create_trigger(self.table, self.pars)
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