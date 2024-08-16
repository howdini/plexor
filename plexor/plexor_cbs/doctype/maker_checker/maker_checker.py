from plex_crud import crud_db_insert, crud_load_from_db, crud_db_update, crud_delete, crud_get_list, crud_get_count, crud_get_stats
from frappe.model.document import Document
import frappe

class MakerChecker(Document):
	table = "plexMakerChecker"
	doctypeName = "Maker-Checker"
	pars = [
			"creator",
			"stamp",
			"document",
			"trx_type",
			"values",
			"checkers",
			"check_status",
			"checker_comments",
			"posted_result"]

	# type, min, max, allowed,
	validator = [
				 "any,1,50",
				 "any,1,150",
				 "alphanumericwithdash,1,150",
				 "alphanumericwithdash,1,150",
				 "any,1,150",
				 "any,1,150",
				 "alphanumericwithdash,1,150",
				 "any,1,1500",
				 "alphanumericwithdash,1,150"
				 ]

	def db_insert(self, *args, **kwargs):
		crud_db_insert(self, MakerChecker, *args, **kwargs)

	def load_from_db(self):
		crud_load_from_db(self, MakerChecker)

	def db_update(self):
		crud_db_update(self, MakerChecker)

	def delete(self):
		crud_delete(self, MakerChecker)

	@staticmethod
	def get_list(args):
		#user = frappe.get_user().doc.email
		#my_dest_group = json.dumps(frappe.get_roles(frappe.session.user)).replace('[', '').replace(']', '')
		filter = ""
		if (frappe.get_user().doc.name == "Administrator"):
			query = "SELECT * FROM `" + MakerChecker.table + "` as a WHERE posted_status = 0 AND parent IS NULL OR ((SELECT b.posted_status FROM plexMakerChecker AS b WHERE b.document_id=a.parent) = 1 AND posted_status=0) OR (SELECT b.document_id FROM plexMakerChecker AS b WHERE b.document_id=a.parent) IS NULL ORDER BY creation ASC"
		else:
			query = "SELECT * FROM `" + MakerChecker.table + "` as a WHERE posted_status = 0 AND parent IS NULL OR ((SELECT b.posted_status FROM plexMakerChecker AS b WHERE b.document_id=a.parent) = 1 AND posted_status=0) OR (SELECT b.document_id FROM plexMakerChecker AS b WHERE b.document_id=a.parent) IS NULL ORDER BY creation ASC"
		print(query)
		return crud_get_list(args, MakerChecker, query)

	@staticmethod
	def get_count(args):
		return crud_get_count(args, MakerChecker)

	@staticmethod
	def get_stats(args):
		crud_get_stats(args, MakerChecker)