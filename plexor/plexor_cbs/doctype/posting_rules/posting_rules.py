from plex_crud import crud_db_insert, crud_load_from_db, crud_db_update, crud_delete, crud_get_list, crud_get_count, crud_get_stats
from frappe.model.document import Document

class PostingRules(Document):
	table = "plexPostingRules"
	pars = [
			"title",
			"description"]

	# type, min, max, allowed,
	validator = [
				 "alphanumericwithdash,1,50",
				 "alphanumericwithdash,1,150"
				 ]

	def db_insert(self, *args, **kwargs):
		crud_db_insert(self, PostingRules, *args, **kwargs)

	def load_from_db(self):
		crud_load_from_db(self, PostingRules)

	def db_update(self):
		crud_db_update(self, PostingRules)

	def delete(self):
		crud_delete(self, PostingRules)

	@staticmethod
	def get_list(args):
		return crud_get_list(args, PostingRules)

	@staticmethod
	def get_count(args):
		return crud_get_count(args, PostingRules)

	@staticmethod
	def get_stats(args):
		crud_get_stats(args, PostingRules)
