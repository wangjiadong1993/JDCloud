class Preference
	#Global	
	Global_log = "false"	#{"false","true"} default false
	Global_print = "true" 	#{"false","true"} default true
	Global_logdir = "global_logger.log" #{any relative or absolute directory or nil} default
	Global_db_name = "users.db"
	Global_default_user = true
	Global_user_name = "wangjiadong"
	Global_user_password = "12345678"


	#Google drive
	Googledrive_Session_Refreshkeystore = "sqlite" 	#{"sqlite","txt","none"}
	Googledrive_log = "false"
	Googledrive_print = "false"
	Googledrive_logdir = "googledrive_logger.log"

	#the google drive id and secret, or the dir to the json file
	Googledrive_secrect = nil
	Googledrive_id = nil
	Googledrive_dir = nil



	#mapping tables:
	#cloud type:
	###type 0 forbidden##################
	Google_drive_cloudtype 		= 		1
	Amazon_Clouddrive_cloudtype = 		2
	Dropbox_cloudtype 			= 		3
	Onedrive_cloudtype 			= 		4

	### it is the cloud type allowed in this application, it is used to check the cloud type 
	###before writing to the database
	Cloud_Type_Count 			=		10
end