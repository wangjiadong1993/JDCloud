$LOAD_PATH << File.join(File.dirname(__FILE__), "..", "GoogleDrive")

require "session"

	session = Googledrive::Session.new "client_secrets.json",nil, nil
	
