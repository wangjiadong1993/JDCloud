require 'rubygems'
require 'google/api_client'
require 'record'
require 'preference'
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

			@client = Google::APIClient.new
			@drive = @client.discovered_api('drive', 'v2')

		end


	#record reading
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
	#authentication
		def initialize_drive

			@client.authorization.client_id = @client_id
			@client.authorization.client_secret = @client_secret
			@client.authorization.scope = OAUTH_SCOPE
			@client.authorization.redirect_uri = REDIRECT_DIR
		end

		def exchange_refresh_token refresh_token_param
			@client.authorization.refresh_token = refresh_token_param
			puts @@client.authorization.fetch_access_token!
		end

		def grant_refresh_token_for_the_first_time
			uri = @client.authorization.authorization_uri
			puts uri
			@client.authorization.code = gets.chomp
			@client.authorization.fetch_access_token!
			@client.authorization.refresh_token
		end
	#record saving for multi-user system
		def update_refresh_token_under_an_account user_control_instance, name, password
			if Preference::Global_default_user == true
				name = Preference::Global_user_name.to_s
				password = Preference::Global_user_password.to_s
				if name.nil? || name == "" || password.nil? || password == ""
					raise "please set your user name and password"
				end
			begin
				#user_control_instance.update_account_record name, password, Preference::Google_drive_cloudtype, @refresh_token
			rescue
			end

			else
				raise "have not finished yet, please wait"
			end
		end

		# def update_refresh_token_under_an_account name, password, cloudtype, key

		# end

		def create_account name, password

		end

		# def authenticate_local_account

		# end

		#not implement yet
private
		def customise_the_redirect_dir

		end


	end
end