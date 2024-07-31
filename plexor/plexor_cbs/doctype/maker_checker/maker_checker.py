from plex_crud import crud_db_insert, crud_load_from_db, crud_db_update, crud_delete, crud_get_list, crud_get_count, crud_get_stats
from frappe.model.document import Document

class MakerChecker(Document):
	table = "plexMakerChecker"
	pars = [
			"creator",
			"stamp",
			"document",
			"trx_type",
			"values",
			"checkers",
			"check_status",
			"checker_comments",
			"action_result"]

	# type, min, max, allowed,
	validator = [
				 "alphanumericwithdash,1,50",
				 "alphanumericwithdash,1,150",
				 "alphanumericwithdash,1,150",
				 "alphanumericwithdash,1,150",
				 "alphanumericwithdash,1,150",
				 "alphanumericwithdash,1,150",
				 "alphanumericwithdash,1,150",
				 "alphanumericwithdash,1,150",
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
		return crud_get_list(args, MakerChecker)

	@staticmethod
	def get_count(args):
		return crud_get_count(args, MakerChecker)

	@staticmethod
	def get_stats(args):
		crud_get_stats(args, MakerChecker)