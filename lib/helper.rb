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
				`rm #{file}`
			end
		end
	end

	def self.load_setting
		YAML.load_file 'config/kabe_setting.yaml'
	end
end