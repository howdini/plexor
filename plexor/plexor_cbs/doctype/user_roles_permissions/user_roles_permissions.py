from plex_crud import crud_db_insert, crud_load_from_db, crud_db_update, crud_delete, crud_get_list, crud_get_count, crud_get_stats
from frappe.model.document import Document

class UserRolesPermissions(Document):
	table = "plexRolesPermissions"
	pars = ["role",
			"permission"]

	# type, min, max, allowed,
	validator = ["alphanumericwithdash,1,150",
				 "alphanumericwithdash,1,150"]

	def db_insert(self, *args, **kwargs):
		crud_db_insert(self, UserRolesPermissions, *args, **kwargs)

	def load_from_db(self):
		crud_load_from_db(self, UserRolesPermissions)

	def db_update(self):
		crud_db_update(self, UserRolesPermissions)

	def delete(self):
		crud_delete(self, UserRolesPermissions)

	@staticmethod
	def get_list(args):
		query = "SELECT * FROM `" + UserRolesPermissions.table + "` ORDER BY creation DESC"
		return crud_get_list(args, UserRolesPermissions, query)

	@staticmethod
	def get_count(args):
		return crud_get_count(args, UserRolesPermissions)

	@staticmethod
	def get_stats(args):
		crud_get_stats(args, UserRolesPermissions)

