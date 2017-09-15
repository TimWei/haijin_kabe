require 'yaml'

set :output, '/dev/null'
freq = YAML.load_file(File.dirname(__FILE__)+'/kabe_setting.yaml')['frequency']

every freq['download_new_image'].minutes do 
	command "cd #{path};ruby ./lib/kabe.rb"
end

every freq['change_wallpapper'].minutes do 
	command "cd #{path};sh ./lib/chwall.sh"
end
