# Copyright (c) 2024, Borealis Systems and contributors
# For license information, please see license.txt

from plex_crud import crud_db_insert, crud_load_from_db, crud_delete, crud_get_list, crud_get_count, crud_get_stats
from frappe.model.document import Document


class plexCountry(Document):
	table = "plexCountry"
	pars = ["country_name", "time_zones", "code"]

	# type, min, max, allowed,
	validator = ["alpha,1,500", 
				 "alpha,1,50",
				 "alpha,1,2000"
				 ]


	def db_insert(self, *args, **kwargs):
		crud_db_insert(self, plexCountry, *args, **kwargs)

	def load_from_db(self):
		crud_load_from_db(self, plexCountry)

	def db_update(self):
		crud_db_update(self, plexCountry)

	def delete(self):
		crud_delete(self, plexCountry)

	@staticmethod
	def get_list(args):
		return crud_get_list(args,plexCountry)

	@staticmethod
	def get_count(args):
		return crud_get_count(args,plexCountry)

	@staticmethod
	def get_stats(args):
		crud_get_stats(args,plexCountry)
