from plex_crud import crud_db_insert, crud_load_from_db, crud_db_update, crud_delete, crud_get_list, crud_get_count, crud_get_stats
from frappe.model.document import Document


class Branches(Document):
	table = "plexBranch"
	pars = ["fullname",
			"external_id",
			"status",
			"mobile_no",
			"email_address",
			"open_date",
			"address"]

	# type, min, max, allowed,
	validator = ["alphanumeric,1,50",
				 "alphanumericwithdash,1,50",
				 "numeric,0,1",
				 "mobile,1,50",
				 "email,1,50",
				 "mysqldatetime,1,50",
				 "alphanumeric,1,50"
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
		return crud_get_list(args,Branches)

	@staticmethod
	def get_count(args):
		return crud_get_count(args,Branches)

	@staticmethod
	def get_stats(args):
		crud_get_stats(args,Branches)
