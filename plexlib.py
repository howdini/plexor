
import mysql.connector
import re
import hashlib
import frappe
import json
from datetime import datetime

#update
@frappe.whitelist()
def mysql_connection():
    return mysql.connector.connect(
      host="localhost",
      user="root",
      password="mvpnaz",
	  database="plexorCBS"
    )

def mysql_connection_MC():
    return mysql.connector.connect(
      host="localhost",
      user="root",
      password="mvpnaz",
	  database="plexorCBS_MC"
    )
def get_current_datetime():
    now = datetime.now()
    formatted_date = now.strftime('%Y-%m-%d %H:%M:%S')
    return formatted_date


@frappe.whitelist()
def create_message(creator, to_group, recepients, message, msgtype, errortype):
    mydb = mysql_connection()
    cur = mydb.cursor(dictionary=True)
    #creator = frappe.get_user().doc.name
    nowtime = get_current_datetime()
    for to_user in recepients:
        if(len(to_user)<5):
            continue
        sig = generate_sig2(["dest_group", "dest_user", "message", "msg_type", "error_level"], json.loads("{\"creation\": \""+str(nowtime)+"\",\"modified\": \""+str(nowtime)+"\",\"modified_by\": \""+creator+"\",\"owner\": \""+creator+"\",\"dest_group\": \""+to_group+"\", \"dest_user\": \""+to_user+"\", \"message\": \""+message+"\", \"msg_type\": \""+str(msgtype)+"\", \"error_level\": \""+str(errortype)+"\"}") )
        sql = "INSERT INTO `notify_messages` ("
        sql = sql + "`name`, `creation`, `modified`, `modified_by`, `owner`, `docstatus`, `idx`, "
        sql = sql + "`dest_group`, `dest_user`, `message`, `msg_type`, `error_level`, `read`, "
        sql = sql + "`sig`, `sig_status` "
        sql = sql + ") VALUES ("
        sql = sql + "NULL, '"+str(nowtime)+"', '"+str(nowtime)+"', '"+str(creator)+"','"+str(creator)+"','0','0', "
        sql = sql + "'"+to_group+"','"+to_user+"','"+message+"','"+str(msgtype)+"','"+str(errortype)+"','0','"+sig+"','0' "
        sql = sql + ");"
        print(sql)
        cur.execute(sql)
    mydb.commit()

def add_tags(msg):
    return msg.replace("'","\'").replace('"','\"').replace('\\','\\\\')

def json_format_correction(json_String):
    # Replace single quotes with double quotes and ensure that the property names are quoted
    corrected_json_string = re.sub(r"(\w+)\s*:", r'"\1":', json_String)
    corrected_json_string = corrected_json_string.replace("'", '"')
    # Ensure the JSON string starts and ends with curly braces
    corrected_json_string = f'{{{corrected_json_string.strip("{}")}}}'
    vals = corrected_json_string
    print("json_format_correction :: " + vals)
    return vals

def check_permissions(doctypeName, type):
    if(frappe.session.user=="Administrator"):
        return

    try:
        permissions = frappe.cache.get_value("setperms|"+frappe.session.user)
    except:
        frappe.throw("Your session has expired. Please log out and login again.")
        return
    print(f"Searching permissions for {doctypeName}:{type}")
    print(permissions)
    perm = doctypeName+" - "+type
    try:
        if(perm in permissions):
            #frappe.msgprint("Permission granted")
            pass
        else:
            frappe.throw("Access not granted for this action.")
    except TypeError:
        frappe.throw("Your session data has expired. Please logout and login again.")



def create_trigger(table, pars):
    frappe.utils.logger.set_log_level("DEBUG")
    logger = frappe.logger("frappe.web", allow_site=True, file_count=50)
    old_pars = ""
    isFirst = True
    for x in pars:
        if isFirst == True:
            isFirst = False
            old_pars = "OLD." + str(x)
        else:
            old_pars = old_pars + ",OLD." + str(x)
    old_pars = old_pars + ",OLD.creation,OLD.modified,OLD.modified_by,OLD.owner"

    isFirst = True
    new_pars = ""
    for x in pars:
        if isFirst == True:
            isFirst = False
            new_pars = "NEW." + str(x)
        else:
            new_pars = new_pars + ",NEW." + str(x)
    new_pars = new_pars + ",NEW.creation,NEW.modified,NEW.modified_by,NEW.owner"

    trigger = f"""
    DROP TRIGGER IF EXISTS {table}_insert_trigger;
    
    DELIMITER $$
    
        CREATE TRIGGER {table}_insert_trigger BEFORE INSERT ON {table} FOR EACH ROW BEGIN
          INSERT INTO audit_trailLogs VALUES(NULL, NOW(), NOW(), NEW.modified_by, NEW.owner, 0, 0, "{table}", 0,NEW.name,
            "",
            CONCAT({new_pars}),
             SHA2(CONVERT(CONCAT(
                "",
                CONCAT({new_pars}),
                NEW.creation,NEW.modified,NEW.modified_by,NEW.owner)USING utf8), 256), 0 );
        END$$
    
    DELIMITER ;
    
    
    DROP TRIGGER IF EXISTS {table}_update_trigger;
    
    DELIMITER $$
    
        CREATE TRIGGER {table}_update_trigger BEFORE UPDATE ON {table} FOR EACH ROW BEGIN
          INSERT INTO audit_trailLogs VALUES(NULL, NOW(), NOW(), old.modified_by, old.owner, 0, 0, "{table}", 1,OLD.name,
            CONCAT({old_pars}),
            CONCAT({new_pars}),
             SHA2(CONVERT(CONCAT(
                CONCAT({old_pars}),
                CONCAT({new_pars}),
                creation,modified,modified_by,owner)USING utf8), 256), 0 );
          IF (NEW.sig != SHA2(CONVERT(CONCAT({new_pars},NEW.creation,NEW.modified,NEW.modified_by,NEW.owner)USING utf8), 256)) 
          THEN
                INSERT INTO sig_failures VALUES(NULL, NOW(), "{table}",  old.name,
                                            CONCAT({old_pars}),
                                            CONCAT({new_pars}) );
                                            SET NEW.sig_status=1;
          END IF;
        END$$
    
    DELIMITER ;
    
    
    DROP TRIGGER IF EXISTS {table}_delete_trigger;
    
    DELIMITER $$
    
        CREATE TRIGGER {table}_delete_trigger BEFORE DELETE ON {table} FOR EACH ROW BEGIN
          INSERT INTO audit_trailLogs VALUES(NULL, NOW(), NOW(), OLD.modified_by, OLD.owner, 0, 0, "{table}", 2,OLD.name,
            CONCAT({old_pars}),
            "",
             SHA2(CONVERT(CONCAT(
                CONCAT({old_pars}),
                "",
                OLD.creation,OLD.modified,OLD.modified_by,OLD.`owner`)USING utf8), 256), 0 );
        END$$
    
    DELIMITER ;
    """
    #logger.debug(f"{trigger}")
    #print(trigger)
    #mydb = mysql_connection()
    #cur = mydb.cursor()
    #cur.execute(trigger, params=None, multi=True)
    #mydb.commit()
    return trigger

def generate_sig(pars, self):
    raw = ""
    for x in pars:
            raw = raw + str(self.get(x))
    raw = raw + str(self.creation) + str(self.modified) + str(self.modified_by) + str(self.owner)
    hash = hashlib.sha256(raw.encode("utf-8")).hexdigest()
    #frappe.msgprint(raw+"<br>"+hash)
    return hash 
#SELECT sig,  SHA2(CONVERT(CONCAT(full_name,first_name,last_name,id_number,creation,modified,modified_by,`owner`)USING utf8), 256) FROM tabMember ;

def generate_sig2(pars, self):
    raw = ""
    for x in pars:
            print("SINGTURE FOR KEY: "+str(x)+" =   VALUE: "+ str(self[x]))
            raw = raw + str(self[x])
    raw = raw + self["creation"] + self["modified"] + self["modified_by"] + self["owner"]
    hash = hashlib.sha256(raw.encode("utf-8")).hexdigest()
    #frappe.msgprint(raw+"<br>"+hash)
    return hash

@frappe.whitelist()
def validate_document(document, var_list, validator):
    pos = 0
    #frappe.throw(str(document))
    for field in var_list:
        #if(field=="dest_group"):
        #    frappe.throw("Validating " + field + " : " + str(document.get(field)))
        if(str(document.get(field))=="None" or str(document.get(field))==""):
            pos = pos + 1
            continue
        print("Validating "+field+" : "+str(document.get(field)))
        validators = validator[pos].split(",")
        #test type
        validate_type(document.get(field), field, validators[0])
        #test min
        validate_minimum(document.get(field), field, validators[0], int(validators[1]))
        #test max
        validate_maximum(document.get(field), field, validators[0], int(validators[2]))
        pos = pos + 1

def validate_minimum(val, field, type, minimum):
    valid = True
    if(type=="numericvalue" or type=="numeric"):
        if float(val)<minimum:
            valid = False
    else:
        if len(val) < minimum:
            valid = False

    if valid:
        valid = True
        #frappe.msgprint(f"'{field}={val}' has OK minimum")
    else:
        frappe.throw(f"Field '{field}' value \"{val}\" length/value NOT valid. <b>Minimum {minimum}</b> value")

def validate_maximum(val, field, type, maximum):
    valid = True
    if(type=="numericvalue" or type=="numeric"):
        if float(val)>maximum:
            valid = False
    else:
        if len(val) > maximum:
            valid = False

    if valid:
        valid = True
        #frappe.msgprint(f"'{field}={val}' has OK maximum")
    else:
        frappe.throw(f"Field '{field}' value \"{val}\" length/value NOT valid. <b>Maximum {maximum}</b> value")

def validate_type(val, field, type):
    if(type=="any"):
        return
    valid = False
    #Default match
    pat = re.compile(r"[A-Za-z0-9!£$%^&*()_+=]+")
    translate = "ANY"
    if(type=="alphanumeric"):
        # compiling the pattern for alphanumeric string
        pat = re.compile(r"[A-Za-z0-9 ]+")
        translate = "alphanumeric"
    elif(type=="alpha"):
        # compiling the pattern for alpha string
        pat = re.compile(r"[A-Za-z ]+")
        translate = "alphabet only"
    elif(type=="numeric"):
        # compiling the pattern for numeric string
        pat = re.compile(r"[0-9]+")
        translate = "numbers only"
    elif(type=="email"):
        # compiling the pattern for email string
        pat = re.compile(r"[^\s@]+@[^\s@]+\.[^\s@]+$")
        translate = "email"
    elif(type=="mobile"):
        # compiling the pattern for mobile string
        pat = re.compile(r"^\+?([0-9]{,3})(7(?:(?:[129][0-9])|(?:0[0-8])|(4[0-1]))[0-9]{6})$")
        translate = "mobile number"
    elif(type=="alphanumericwithdash"):
        # compiling the pattern for alphanumericwithdash string
        pat = re.compile(r"[A-Za-z0-9_\- ]+")
        translate = "alphanumeric"
    elif(type=="numericvalue"):
        # compiling the pattern for numericvalue string
        pat = re.compile(r"^-?(?:0|[1-9]\d{0,2}(?:,?\d{3})*)(?:\.\d+)?$")
        translate = "numeric value"
    elif(type=="dateslashed"):
        # compiling the pattern for date dd/mm/yyyy string
        pat = re.compile(r"(0[1-9]|[12][0-9]|3[01])\/(0[1-9]|1[0,1,2])\/(19|20)\d{2}")
        translate = "date (dd/mm/yyyy)"
    elif(type=="mysqldatetime"):
        # compiling the pattern for mysql date or datetime Y-M-D H:M:S string
        pat = re.compile(r"^([0-9]{2,4})-([0-1][0-9])-([0-3][0-9])(?:( [0-2][0-9]):([0-5][0-9]):([0-5][0-9]))?$")
        translate = "datetime (Y-M-D H:M:S)"
    elif(type=="mysqltime"):
        # compiling the pattern for mysql time H:M:S string
        pat = re.compile(r"^([0-2][0-9]):([0-5][0-9]):([0-5][0-9])?$")
        translate = "time (H:M:S)"

    if re.fullmatch(pat, str(val)):
        valid = True
        #frappe.msgprint(f"'{field}={val}' is of type {type}")
    else:
        valid = False
        frappe.throw(f"Field '{field}' value \"{val}\" is not a valid <b>{translate}</b> value")

