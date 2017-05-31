class Helper
	def self.clear_old_img
		files = Dir['./img/*']
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

	def self.load_setting
		YAML.load_file 'config/kabe_setting.yaml'
	end
	def self.detect_os_and_clear file
		if OS.windows?
			`rm #{file}`
		else
			`del #{file}`
		end
	end
end