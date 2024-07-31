from plex_crud import crud_db_insert, crud_load_from_db, crud_db_update, crud_delete, crud_get_list, crud_get_count, crud_get_stats
from frappe.model.document import Document

class PostingRulesAccounts(Document):
	table = "plexPostingRulesAccounts"
	pars = ["postingRule",
			"type",
			"account"]

	# type, min, max, allowed,
	validator = ["alphanumericwithdash,1,150",
				 "alphanumericwithdash,1,150",
				 "alphanumericwithdash,1,150"]

	def db_insert(self, *args, **kwargs):
		crud_db_insert(self, PostingRulesAccounts, *args, **kwargs)

	def load_from_db(self):
		crud_load_from_db(self, PostingRulesAccounts)

	def db_update(self):
		crud_db_update(self, PostingRulesAccounts)

	def delete(self):
		crud_delete(self, PostingRulesAccounts)

	@staticmethod
	def get_list(args):
		return crud_get_list(args, PostingRulesAccounts)

	@staticmethod
	def get_count(args):
		return crud_get_count(args, PostingRulesAccounts)

	@staticmethod
	def get_stats(args):
		crud_get_stats(args, PostingRulesAccounts)
