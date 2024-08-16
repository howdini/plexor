from plex_crud import crud_db_insert, crud_load_from_db, crud_db_update, crud_delete, crud_get_list, crud_get_count, crud_get_stats
from frappe.model.document import Document

class Permissions(Document):
	table = "plexPermissions"
	pars = ["title",
			"description"]

	# type, min, max, allowed,
	validator = ["alphanumericwithdash,1,150",
				 "alphanumericwithdash,1,150"]

	def db_insert(self, *args, **kwargs):
		crud_db_insert(self, Permissions, *args, **kwargs)

	def load_from_db(self):
		crud_load_from_db(self, Permissions)

	def db_update(self):
		crud_db_update(self, Permissions)

	def delete(self):
		crud_delete(self, Permissions)

	@staticmethod
	def get_list(args):
		return crud_get_list(args, Permissions)

	@staticmethod
	def get_count(args):
		return crud_get_count(args, Permissions)

	@staticmethod
	def get_stats(args):
		crud_get_stats(args, Permissions)
