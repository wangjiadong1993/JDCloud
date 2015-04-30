#$LOAD_PATH << File.join(File.dirname(__FILE__),"preference.rb")
require 'preference'
module Googledrive
	class Googledrivepreference
		def initialize

		end

		def test
			begin
				puts Preference::Global_log
			rescue Exception => e

			end
		end

		def self.log

		end

		def output

		end
		
		def refresh_key_store
			
		end
	end
end