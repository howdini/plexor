from plex_crud import crud_db_insert, crud_load_from_db, crud_db_update, crud_delete, crud_get_list, crud_get_count, crud_get_stats
from frappe.model.document import Document


class Teller(Document):
	
	table = "plexTeller"
	pars = ["user",
			"branch",
			"debit_account",
			"credit_account",
			"description",
			"valid_from",
			"valid_to",
			"state"]

	# type, min, max, allowed,
	validator = ["any,1,140",
				 "alphanumericwithdash,1,150",
				 "alphanumericwithdash,1,150",
				 "alphanumericwithdash,1,150",
				 "alphanumericwithdash,1,100",
				 "mysqldatetime,1,50",
				 "mysqldatetime,1,50",
				 "alpha,1,50"]


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
		return crud_get_list(args,Teller)

	@staticmethod
	def get_count(args):
		return crud_get_count(args,Teller)

	@staticmethod
	def get_stats(args):
		crud_get_stats(args,Teller)
