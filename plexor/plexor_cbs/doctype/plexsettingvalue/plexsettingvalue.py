from plex_crud import crud_db_insert, crud_load_from_db, crud_db_update, crud_delete, crud_get_list, crud_get_count, crud_get_stats
from frappe.model.document import Document

class plexSettingValue(Document):
	table = "plexSetting"
	doctypeName = "Settings"
	pars = ["type",
			"setting",
			"codename",
			"value",
			"value2",
			"value3",
			"status"]

	# type, min, max, allowed,
	validator = ["alphanumericwithdash,1,150",
				 "alphanumericwithdash,1,150",
				 "alphanumericwithdash,1,150",
				 "alphanumericwithdash,1,150",
				 "alphanumericwithdash,1,150",
				 "alphanumericwithdash,1,150",
				 "alphanumericwithdash,1,150"]

	def db_insert(self, *args, **kwargs):
		crud_db_insert(self, plexSettingValue, *args, **kwargs)

	def load_from_db(self):
		crud_load_from_db(self, plexSettingValue)

	def db_update(self):
		crud_db_update(self, plexSettingValue)

	def delete(self):
		crud_delete(self, plexSettingValue)

	@staticmethod
	def get_list(args):
		return crud_get_list(args, plexSettingValue)

	@staticmethod
	def get_count(args):
		return crud_get_count(args, plexSettingValue)

	@staticmethod
	def get_stats(args):
		crud_get_stats(args, plexSettingValue)