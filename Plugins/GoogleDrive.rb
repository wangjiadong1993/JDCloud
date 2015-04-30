$LOAD_PATH << File.join(File.dirname(__FILE__), "..", "GoogleDrive")

require "session"
	dir = File.join(File.dirname(__FILE__), "..","..", "client_secrets.json")
	#puts dir
	session = Googledrive::Session.new
	########
	session.read_google_json_file_for_id_and_secret dir
	########
	#also can just type in the id and secret
	########
	#puts session.client_id
