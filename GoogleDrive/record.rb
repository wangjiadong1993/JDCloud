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
			@google_file_dir =nil
			@google_id =nil
			@google_secret =nil
		end



		def retrieve_id_and_secret_from_dir dir
			check_dir_and_convert_absolute dir
			if @google_file_dir.nil?
				return nil
			else
				read_the_google_secret_file
			end

		end

		def test
			puts "Googledrive::Record test"
		end

private
		def check_dir_and_convert_absolute dir

			if dir.nil?
				#puts "no  dir"
				#return nil
			else
				pn = Pathname.new(dir)
				if !pn.exist? || !pn.file?
					#puts "no such dir"
					#return nil
				else 
					#puts "get it"
					@google_file_dir = pn.realpath.to_s
					#puts @google_file_dir
				end
			end
		end

		def read_the_google_secret_file
			file = File.read @google_file_dir
			begin
				#file = File.read File.dirname(__FILE__)
				json = JSON.parse(file)
				installed = json["installed"]
				id_installed = installed["client_id"]
				secrect_installed = installed["client_secret"]
				#puts installed
			rescue Exception => e
				#puts "exception occurs"
				#json = {}
				id_installed = nil
				secrect_installed = nil
			end
			@google_id = id_installed
			@google_secret = secrect_installed
			#puts json

		end

	end
end