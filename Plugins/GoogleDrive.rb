$LOAD_PATH << File.join(File.dirname(__FILE__), "..", "GoogleDrive")
$LOAD_PATH << File.join(File.dirname(__FILE__), "..", "Recordlib")
$LOAD_PATH << File.join(File.dirname(__FILE__), "..")

require "session"
require 'google_drive_preference_control'
require 'sqlite3'
require 'user_control'
require 'user'
	# dir = File.join(File.dirname(__FILE__), "..","..", "client_secrets.json")
	# #puts dir
	# session = Googledrive::Session.new
	# ########
	# session.read_google_json_file_for_id_and_secret dir
	# ########
	# #also can just type in the id and secret
	# ########
	# #puts session.client_id
	# session.initialize_drive
	# #session.grant_refresh_token_for_the_first_time
	# #google_preference = Googledrive::Googledrivepreference.new
	# google_preference.test
	user_control = Googledrive::Usercontrol.new
	#puts user_control
	#puts user = Jdclouduser.new.to_json
	#user = Jdclouduser.new(:name => "jiadong", :password => "12344321", :cloudtype => 1, :key => "123456788909")
	
	#user.save!
	#puts Jdclouduser.all.where(NAME: "jiadong").to_s
	# puts users = Jdclouduser.where(name: "jiadong", password: "12344321").as_json
	# users = users.map{|x|  {x["cloudtype"] => x["key"]}}
	# puts users
	#user_control.update_account_record("katherine", "katherine", 1,  "12345543")
	#puts Jdclouduser.where(name: "jiadong", password: "12344321", cloudtype: 1).first.as_json["id"]

	#puts Jdclouduser.all.as_json
	