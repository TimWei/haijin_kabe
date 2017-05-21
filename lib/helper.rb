class Helper
	def self.clear_old_img
		files = Dir['./img/*']
		files.each do |file|
			break if files.size <= 1
			if file.match(/\.(jpg|png)/).nil?
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