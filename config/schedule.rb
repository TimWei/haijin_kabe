require 'yaml'

set :output, '/dev/null'
freq = YAML.load_file(File.dirname(__FILE__)+'/kabe_setting.yaml')['freq']

every freq['kabe'].minutes do 
	command "cd #{path};ruby ./lib/kabe.rb"
end

every freq['chwall'].minutes do 
	command "cd #{path};sh ./lib/chwall.sh"
end
