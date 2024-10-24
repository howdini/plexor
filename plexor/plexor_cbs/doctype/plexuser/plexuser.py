from plex_crud import crud_db_insert, crud_load_from_db, crud_db_update, crud_delete, crud_get_list, crud_get_count, crud_get_stats
from frappe.model.document import Document

class plexUser(Document):
	table = "plexUser"
	doctypeName = "plexUser"
	pars = ["user",
			"role",
			"status"]

	# type, min, max, allowed,
	validator = ["email,1,50",
				 "alphanumeric,1,50",
				 "alphanumeric,1,15"]

	def db_insert(self, *args, **kwargs):
		crud_db_insert(self, plexUser, *args, **kwargs)

	def load_from_db(self):
		crud_load_from_db(self, plexUser)

	def db_update(self):
		crud_db_update(self, plexUser)

	def delete(self):
		crud_delete(self, plexUser)

	@staticmethod
	def get_list(args):
		query = "SELECT * FROM `" + plexUser.table + "` ORDER BY creation DESC"
		return crud_get_list(args,plexUser, query)

	@staticmethod
	def get_count(args):
		return crud_get_count(args,plexUser)

	@staticmethod
	def get_stats(args):
		crud_get_stats(args,plexUser)
