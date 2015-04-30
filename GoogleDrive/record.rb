#we need quite a lot of files to read 
#including the google json

require 'pathname'
require 'json'

module Googledrive
	class Record
		attr_reader :google_file_dir
		attr_reader :google_id
		attr_reader :google_secret
		
		def initialize	
			@@google_file_dir =nil
			@@google_id =nil
			@@google_secret =nil
		end



		def retrieve_id_and_secret_from_dir dir
			check_dir_and_convert_absolute dir
			if @@google_file_dir.nil?
				return nil
			else
				read_the_google_secret_file
			end

		end

private
		def check_dir_and_convert_absolute dir

			if dir.nil?
				#return nil
			else
				pn = Pathname.new(dir)
				if !pn.exist? || !pn.file?
					#return nil
				else 
					@@google_file_dir = pn.realpath.to_s
				end
			end
		end

		def read_the_google_secret_file
			file = File.read @@google_file_dir
		end

	end
end