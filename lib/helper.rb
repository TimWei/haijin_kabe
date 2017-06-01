class Helper
	def self.clear_old_img
		if internet_available?
			files = Dir[File.dirname(__FILE__)+'/../img/*']
			files.each_with_index do |file, i|
				if file.match(/\.(jpg|png)/).nil?
					next
				elsif i == 0 
					# left at least one image
					next
				else
					detect_os_and_clear file
				end
			end
		end
	end

	def self.load_setting
		YAML.load_file File.dirname(__FILE__)+'/../config/kabe_setting.yaml'
	end
	
	def self.detect_os_and_clear file
		if OS.windows?
			`del "#{file.gsub('/','\\')}"`
		else
			`rm #{file}`
		end
	end

	def self.internet_available?
	  begin
	    true if open("http://www.google.com/")
	  rescue
	    false
	  end
	end
end