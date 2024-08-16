# Copyright (c) 2024, Borealis Systems and contributors
from plex_crud import crud_db_insert, crud_load_from_db, crud_db_update, crud_delete, crud_get_list, crud_get_count, crud_get_stats
from frappe.model.document import Document

class Settings(Document):
	doctypeName = "Settings"
	table = "plexSettingType"
	pars = ["title",
			"general",
			"security",
			"savings",
			"loans",
			"maker_checker"]

	# type, min, max, allowed,
	validator = ["alphanumericwithdash,1,150",
				 "alphanumericwithdash,1,150",
				 "alphanumericwithdash,1,150",
				 "alphanumericwithdash,1,150",
				 "alphanumericwithdash,1,150",
				 "alphanumericwithdash,1,150"
				 ]

	def db_insert(self, *args, **kwargs):
		crud_db_insert(self, Settings, *args, **kwargs)

	def load_from_db(self):
		crud_load_from_db(self, Settings)

	def db_update(self):
		crud_db_update(self, Settings)

	def delete(self):
		crud_delete(self, Settings)

	@staticmethod
	def get_list(args):
		query = "SELECT * FROM `" + Settings.table + "` ORDER BY creation DESC"
		return crud_get_list(args, Settings, query)

	@staticmethod
	def get_count(args):
		return crud_get_count(args, Settings)

	@staticmethod
	def get_stats(args):
		crud_get_stats(args, Settings)
