require 'yaml'
require_relative 'pixiv'

files = Dir['./img/*']
files.each do |file|
	break if files.size <= 1
	if file.match(/\.(jpg|png)/).nil?
		next
	else
		`rm #{file}`
	end
end

user_info = YAML.load_file 'user.yaml'
pixiv_info = user_info['pixiv']
ag = Pixiv.new
ag.login pixiv_info['account'], pixiv_info['password']
ag.get_daily 5