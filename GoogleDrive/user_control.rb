require 'recorder'
require 'active_record'
module Googledrive
	class Usercontrol
		@db_recorder
		def initialize
			@db_recorder = Recorder.new
			@db_recorder.check_existance_of_the_given_dir_in_preference_and_return_handler
			@db_recorder.create_connection
		end
		


	end
end