$LOAD_PATH << File.join(File.dirname(__FILE__), "..", "GoogleDrive")
$LOAD_PATH << File.join(File.dirname(__FILE__), "..")

require "session"
require 'google_drive_preference_control'
	dir = File.join(File.dirname(__FILE__), "..","..", "client_secrets.json")
	#puts dir
	session = Googledrive::Session.new
	########
	session.read_google_json_file_for_id_and_secret dir
	########
	#also can just type in the id and secret
	########
	#puts session.client_id
	session.initialize_drive
	#session.grant_refresh_token_for_the_first_time
	google_preference = Googledrive::Googledrivepreference.new
	google_preference.test
