import mysql.connector
import re
import hashlib
import frappe
from frappe.website.path_resolver import resolve_path as original_resolve_path


def website_path(path):
    print("Here: "+path)
    return original_resolve_path(path)