set :output, '/dev/null'

every 1.hours do # 1.minute 1.day 1.week 1.month 1.year is also supported
	command "cd #{path};ruby ./lib/get_image.rb"
end

every 15.minutes do 
	command "cd #{path};sh ./lib/chwall.sh"
end
