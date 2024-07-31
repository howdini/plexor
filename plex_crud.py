import frappe
import json
import hashlib
from plexlib import mysql_connection, mysql_connection_MC, validate_document, generate_sig, create_trigger
from frappe.model.document import Document
import mysql.connector

def create_maker_checker(type, selfclass, self, pars):
    doctype = getDoctype(selfclass)
    mydb = mysql_connection()
    qry = ""
    values = ""
    first = True
    for x in self.pars:
        if (first):
            qry = "`" + x + "`"
            values =  x + " :\"" + str(self.get(x)) + "\""
            first = False
        else:
            qry = qry + ", " + "`" + x + "`"
            values = values + ",\n " + x + " :\"" + str(self.get(x)).replace('"', '\\"') + "\""
    values = "{" + values + "}"
    checkers = ""
    mycursor = mydb.cursor()
    sql = ("INSERT INTO `plexMakerChecker` (name, creation, modified, modified_by, owner, docstatus, idx,"
           + "creator, stamp, document, `trx_type`, `values`, checkers,sig)"
           + "VALUES( %s, %s, %s, %s, %s, 0, %s, %s, %s,%s, %s,%s,%s"
           + ", ''  )")
    print(sql)
    val = (self.name, self.creation, self.modified, self.modified_by, self.owner, self.idx, self.owner, self.creation, doctype, type, values, checkers)
    mycursor.execute(sql, val)
    mydb.commit()

def crud_db_insert(self, selfclass, *args, **kwargs):
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
    mycursor.execute(sql, val)
    mydb.commit()


def crud_load_from_db(self, selfclass):
    mydb = mysql_connection()
    cur = mydb.cursor(dictionary=True)
    val = (self.name)
    sql = ("SELECT * FROM `" + self.table + "` where `name`='" + str(self.name) + "' limit 1")
    cur.execute(sql)
    rv = cur.fetchone()
    super(Document, self).__init__(rv)


def crud_db_update(self, selfclass):
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
    mydb = mysql_connection()
    mycursor = mydb.cursor()
    sql = ("UPDATE `" + self.table + "` SET name = %s, modified = %s, modified_by = %s, "
           + qry_vals + ", sig='" + generate_sig(self.pars, self) + "' WHERE name = %s")
    val = (self.name, self.modified, self.modified_by, self.name)
    mycursor.execute(sql, val)
    mydb.commit()


def crud_delete(self, selfclass):
    if (str(self.sig_status) == "1"):
        frappe.throw("You cannot delete a locked document")
    mydb = mysql_connection()
    mycursor = mydb.cursor()
    sql = "DELETE FROM `" + self.table + "` WHERE name = '" + self.name + "' LIMIT 1"
    mycursor.execute(sql)
    mydb.commit()


@staticmethod
def crud_get_list(args, self):
    print("PASSES PARAMETER: "+get_filters(self))
    is_maker_checker_required(self, "INSERT")
    create_trigger(self.table, self.pars)
    mydb = mysql_connection()
    cur = mydb.cursor(dictionary=True)
    user = frappe.get_user().doc.email
    my_dest_group = json.dumps(frappe.get_roles(frappe.session.user)).replace('[', '').replace(']', '')
    if (frappe.get_user().doc.name == "Administrator"):
        cur.execute("SELECT * FROM `" + self.table + "` ORDER BY creation DESC")
    else:
        cur.execute(
            "SELECT * FROM `" + self.table + "` WHERE (`dest_user`='" + user + "' OR dest_group IN (" + my_dest_group + ")) "+get_filters(self)+" ORDER BY creation DESC")
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