from plex_crud import crud_db_insert, crud_load_from_db, crud_db_update, crud_delete, crud_get_list, crud_get_count, crud_get_stats
from frappe.model.document import Document


class Addresses(Document):
	table = "plexAddress"
	pars = ["short_name",
			"street",
			"address_line_1",
			"address_line_2",
			"address_line_3",
			"town_village",
			"county_district",
			"country",
			"postal_code",
			"geolocation"]

	# type, min, max, allowed,
	validator = ["alphanumeric,1,50",
				 "alphanumeric,1,50",
				 "alphanumeric,1,50",
				 "alphanumeric,1,50",
				 "alphanumeric,1,50",
				 "alphanumeric,1,50",
				 "alphanumeric,1,50",
				 "alphanumeric,1,50",
				 "alphanumeric,1,50",
				 "any,1,150"
				 ]


	def db_insert(self, *args, **kwargs):
		crud_db_insert(self, Addresses, *args, **kwargs)

	def load_from_db(self):
		crud_load_from_db(self, Addresses)

	def db_update(self):
		crud_db_update(self, Addresses)

	def delete(self):
		crud_delete(self, Addresses)

	@staticmethod
	def get_list(args):
		return crud_get_list(args,Addresses)

	@staticmethod
	def get_count(args):
		return crud_get_count(args,Addresses)

	@staticmethod
	def get_stats(args):
		crud_get_stats(args,Addresses)
