require "sqlite3"
require 'pathname'

class Recorder
	@db_pn
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

	end
	def close_database
		@db.close
	end
end

##########class test
$LOAD_PATH << File.join(File.dirname(__FILE__), "..")
require 'preference'
recorder = Recorder.new
recorder.check_existance_of_the_given_dir_in_preference_and_return_handler




