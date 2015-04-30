require 'rubygems'
require 'google/api_client'
require 'record'

module Googledrive
	
	class Session
		attr_accessor	:client_id
		attr_accessor	:client_secret

		attr_reader	:refresh_token
		attr_reader :client
		attr_reader :drive
		@record

		OAUTH_SCOPE = 'https://www.googleapis.com/auth/drive'
		REDIRECT_DIR = 'urn:ietf:wg:oauth:2.0:oob'



		def initialize	
			@client_secret = nil
			@client_id = nil
			@record = nil
		end

		def get_id_and_secret_directly id=nil, secret=nil
			if id.nil? || secret.nil?
				@client_id = @client_secret = nil
			else
				@client_id = id.to_s
				@client_secret = secret.to_s
			end
		end

		def read_google_json_file_for_id_and_secret dir
			begin
				dir = dir.to_s
			rescue
				dir = nil
			end

			if dir.nil? || dir == ""
				puts "dir nil"
				return
			end

			@record = Googledrive::Record.new
			@record.retrieve_id_and_secret_from_dir dir

			if (@record.google_id.nil? || @record.google_secret.nil?)
				@client_id = nil
				@client_secret = nil
			else
				@client_secret = @record.google_secret
				@client_id = @record.google_id
			end
		end



		def exchange_refresh_token

		end

		def grant_refresh_token_for_the_first_time

		end



		#not implement yet

		def customise_the_redirect_dir

		end

	end
end