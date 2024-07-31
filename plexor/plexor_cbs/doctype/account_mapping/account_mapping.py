from plex_crud import crud_db_insert, crud_load_from_db, crud_db_update, crud_delete, crud_get_list, crud_get_count, crud_get_stats
from frappe.model.document import Document


class AccountMapping(Document):
	table = "plexAccountMapping"
	pars = ["mapper_name",
			"account",
			"description"]

	# type, min, max, allowed,
	validator = ["alphanumericwithdash,1,50",
				 "alphanumericwithdash,1,50",
				 "alphanumericwithdash,1,100"]


	def db_insert(self, *args, **kwargs):
		crud_db_insert(self, AccountMapping, *args, **kwargs)

	def load_from_db(self):
		crud_load_from_db(self, AccountMapping)

	def db_update(self):
		crud_db_update(self, AccountMapping)

	def delete(self):
		crud_delete(self, AccountMapping)

	@staticmethod
	def get_list(args):
		return crud_get_list(args,AccountMapping)

	@staticmethod
	def get_count(args):
		return crud_get_count(args,AccountMapping)

	@staticmethod
	def get_stats(args):
		crud_get_stats(args,AccountMapping)
