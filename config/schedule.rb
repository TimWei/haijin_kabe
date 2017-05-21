set :output, '/dev/null'

every 1.hours do 
	command "cd #{path};ruby ./lib/kabe.rb"
end

every 15.minutes do 
	command "cd #{path};sh ./lib/chwall.sh"
end
