require 'rubygems'
require 'google/api_client'

module Googledrive
	
	class Session
		attr_accessor	:client_id
		attr_accessor	:client_secret
		@oauth_scope = 'https://www.googleapis.com/auth/drive'
		@redirect_dir = 'urn:ietf:wg:oauth:2.0:oob'

		def initialize	dir=nil, client_id=nil, client_secret=nil
			if !dir.nil?
				puts "dir not empty"
			elsif (!client_id.nil? && !client_secret.nil?)
				puts "id and secret not empty"
			else
				puts "error, no record found"
			end

		end

		def exchange_refresh_token

		end

		def grant_refresh_token_for_the_first_time

		end

	end
end