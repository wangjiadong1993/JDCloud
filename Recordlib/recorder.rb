require "sqlite3"
require 'pathname'
require 'active_record'
class Recorder
	attr_reader :db_pn
	attr_reader :db

	def initialization
		@db_pn = nil
		@db = nil
	end

	def check_existance_of_the_given_dir_in_preference_and_return_handler
		dir = Preference::Global_db_name
		pn = Pathname.new(dir)

		if pn.exist?
			#puts "existing"
		else
			create_dir pn.parent
			create_file pn.parent, pn.basename.to_s
		end

		if !pn.exist?
			raise "ooops, something is wrong, we raise error here it seems failed to create the database file you want"
		end

		@db_pn = pn
		open_database

		create_table_for_users_if_not_exist
	end

	def get_absolute_dir_to_database
		@db_pn.realpath.to_s
	end

	def create_dir pn
		if pn.exist?
			return
		else
			pp =  pn.parent
			if pp.exist?
				Dir.mkdir pn
			else
				create_dir pp
			end
		end
	end

	def create_file path_parent, file_name
		file_dir = File.join(path_parent.realpath.to_s , file_name)
		#puts file_dir
		db  = SQLite3::Database.new file_dir
		db.close
	end

	def open_database
		@db = SQLite3::Database.open @db_pn.realpath.to_s
	end

	def create_connection
			ActiveRecord::Base.establish_connection(
  				adapter:  "sqlite3",
  				database: @db_pn.realpath.to_s
			)
	end
	def close_database
		@db.close
	end

	def create_table_for_users_if_not_exist
		db.execute("CREATE TABLE IF NOT EXISTS JDCLOUDUSERS (	id          INTEGER PRIMARY KEY,
																name 		VARCHAR(100), 
																password 	VARCHAR(100),
																cloudtype 	INTEGER, 
																key 		VARCHAR(100) ) ")
	end
end

##########class test
# $LOAD_PATH << File.join(File.dirname(__FILE__), "..")
# require 'preference'
# recorder = Recorder.new
# recorder.check_existance_of_the_given_dir_in_preference_and_return_handler




