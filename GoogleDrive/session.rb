require 'rubygems'
require 'google/api_client'

module Googledrive
	
	class Session
		attr_accessor	:client_id
		attr_accessor	:client_secret
		@oauth_scope = 'https://www.googleapis.com/auth/drive'
		@redirect_dir = 'urn:ietf:wg:oauth:2.0:oob'

		def initialize	
			if !dir.nil?
				puts "dir not empty"

			elsif (!client_id.nil? && !client_secret.nil?)
				puts "id and secret not empty"
			else
				puts "error, no record found"
			end

		end

		def get_id_and_secret_directly id=nil, secret=nil
			if id.nil? || secret.nil?
				
			else

			end

		end

		def read_google_json_file_for_id_and_secret dir

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