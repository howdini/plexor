
from plex_crud import crud_db_insert, crud_load_from_db, crud_delete, crud_get_list, crud_get_count, crud_get_stats
from frappe.model.document import Document


class plexNotification(Document):
	
	table = "notify_messages"
	pars = ["dest_group", "dest_user", "message", "msg_type", "error_level", "read"]

	# type, min, max, allowed,
	validator = ["alpha,1,500", # dest_group
				 "email,1,50", # dest_user
				 "alpha,1,2000", # message
				 "numericvalue,1,3", # msg_type
				 "numericvalue,0,5", # error_level
				 "numericvalue,0,2" # read
				 ]


	def db_insert(self, *args, **kwargs):
		crud_db_insert(self, *args, **kwargs)

	def load_from_db(self):
		crud_load_from_db(self)

	def db_update(self):
		crud_db_update(self)

	def delete(self):
		crud_delete(self)

	@staticmethod
	def get_list(args):
		return crud_get_list(args,plexNotification)

	@staticmethod
	def get_count(args):
		return crud_get_count(args,plexNotification)

	@staticmethod
	def get_stats(args):
		crud_get_stats(args,plexNotification)
