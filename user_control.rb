require 'recorder'
require 'active_record'
require 'user'
require 'preference'
module Googledrive
	class Usercontrol
		@db_recorder
		def initialize
			@db_recorder = Recorder.new
			@db_recorder.check_existance_of_the_given_dir_in_preference_and_return_handler
			@db_recorder.create_connection unless @db_recorder.connected?
		end


		def update_account_record name, password, cloudtype, key 
			if name.nil? || password.nil? || cloudtype.nil? || key.nil?
				return nil
			end
			
			begin
				if name.to_s.length <= 5 || password.to_s.length <=5 || cloudtype > Preference::Cloud_Type_Count || cloudtype<=0
					return nil
				end
			rescue Exception => e
				return nil
			end

			records  = retrieve_refresh_tokens_for_someone name, password, cloudtype
			if records.as_json.length != 0 && !records.nil?
				#there is a record, just overwrite it
				if records.as_json.length > 1
					raise "there are duplicated records in the database now"
				end
				id = records.first.as_json["id"] #just use the first, normally, there should be only one

			else
				#there is no record, write
				user = Jdclouduser.new(name: name, password: password, cloudtype: cloudtype, key: key)
				user.save!
				user
			end
		end



		def retrieve_refresh_tokens_for_someone name, password, cloudtype
			accounts =  Jdclouduser.where(name: name, password: password, cloudtype: cloudtype)
		end

		def check_name_password_match name, password
			accounts =  Jdclouduser.where(name: name, password: password)
		end
private
		def add_user_account_json hash_obj

		end

	end
end